import pandas as pd
from sklearn.utils import resample

def balance_dataset(df, target_col, method="upsample"):
    
    majority = df[df[target_col] == 0]
    minority = df[df[target_col] == 1]

    if method == "upsample":
        minority_resampled = resample(
            minority,
            replace=True,
            n_samples=len(majority),
            random_state=42
        )
        balanced_df = pd.concat([majority, minority_resampled])

    elif method == "downsample":
        majority_resampled = resample(
            majority,
            replace=False,
            n_samples=len(minority),
            random_state=42
        )
        balanced_df = pd.concat([majority_resampled, minority])

    return balanced_df.sample(frac=1, random_state=42)