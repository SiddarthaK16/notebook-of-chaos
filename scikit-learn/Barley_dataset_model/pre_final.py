import pandas as pd
import pickle
import numpy as np

from sklearn.model_selection import TimeSeriesSplit, train_test_split, cross_val_score
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import GradientBoostingRegressor
from sklearn.metrics import mean_squared_error

# =========================
# 1. Load data
# =========================
df = pd.read_csv("barley_refined.csv")

# =========================
# 2. Convert Marketing_Year → Year
# Example: "2019/20" → 2019
# =========================
df["Year"] = df["Marketing_Year"].astype(str).str[:4].astype(int)
df.drop("Marketing_Year", axis=1, inplace=True)

# =========================
# 3. Sort by time (CRITICAL)
# =========================
df = df.sort_values("Year").reset_index(drop=True)

# =========================
# 4. Drop leakage columns (accounting identities)
# =========================
df = df.drop(
    columns=[
        "Beginning_Stocks",
        "Total_Supply",
        "Total_Domestic_Use",
        "Total_Use"
    ]
)

# =========================
# 5. Features / Target
# =========================
X = df.drop("Ending_Stocks", axis=1)
y = df["Ending_Stocks"]

# =========================
# 6. Train / Test split (TIME-AWARE)
# =========================
split_idx = int(len(df) * 0.8)

X_train, X_test = X.iloc[:split_idx], X.iloc[split_idx:]
y_train, y_test = y.iloc[:split_idx], y.iloc[split_idx:]

# =========================
# 7. Pipeline (regularized GB)
# =========================
pipeline = Pipeline([
    ("scaler", StandardScaler()),
    ("model", GradientBoostingRegressor(
        n_estimators=150,
        learning_rate=0.03,
        max_depth=2,
        min_samples_leaf=5,
        min_samples_split=10,
        subsample=0.7,
        random_state=42
    ))
])

# =========================
# 8. TimeSeries Cross-Validation
# =========================
tscv = TimeSeriesSplit(n_splits=5)

cv_rmse = cross_val_score(
    pipeline,
    X_train,
    y_train,
    scoring="neg_root_mean_squared_error",
    cv=tscv
)

print(f"CV RMSE (TimeSeries): {-cv_rmse.mean():.3f}")

# =========================
# 9. Train final model
# =========================
pipeline.fit(X_train, y_train)

# =========================
# 10. Evaluation (version-safe)
# =========================
train_pred = pipeline.predict(X_train)
test_pred  = pipeline.predict(X_test)

train_rmse = np.sqrt(mean_squared_error(y_train, train_pred))
test_rmse  = np.sqrt(mean_squared_error(y_test, test_pred))

print(f"Train RMSE: {train_rmse:.3f}")
print(f"Test  RMSE: {test_rmse:.3f}")

# =========================
# 11. Save PIPELINE
# =========================
with open("pipeline.pkl", "wb") as f:
    pickle.dump(
        {
            "pipeline": pipeline,
            "features": list(X.columns)
        },
        f
    )

# =========================
# 12. Save MODEL ONLY
# =========================
with open("model.pkl", "wb") as f:
    pickle.dump(
        {
            "model": pipeline.named_steps["model"],
            "features": list(X.columns)
        },
        f
    )

print("Saved: pipeline.pkl and model.pkl")
