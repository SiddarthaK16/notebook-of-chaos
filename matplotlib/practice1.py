import matplotlib.pyplot as plt

years = [2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024]

dhoni_runs = [372, 284, 290, 455, 416, 200, 114, 232, 104, 161]
rohit_runs = [482, 489, 333, 286, 405, 332, 381, 268, 332, 417]
hardik_runs = [90, 145,123, 233, 402, 281, 127, 487, 346, 216]  
virat_runs = [505, 973, 308, 530, 464, 466, 405, 341, 639, 741]  
sachin_runs = [543,566,787,554,655,443,567,776,345,345]  


plt.style.use("grayscale")

plt.plot(years,dhoni_runs,color="yellow",linewidth=3,label="Dhoni")
plt.plot(years,rohit_runs,color="blue",linewidth=3,label="Rohit")
plt.plot(years,hardik_runs,color="purple",linewidth=3,label="Pandya")
plt.plot(years,virat_runs,color="red",linewidth=3,label="Kohli")
plt.plot(years,sachin_runs,color="orange",linewidth=3,label="Sachin")

plt.xlabel("Year")
plt.ylabel("Runs scored")
plt.title("Runs scored by top players in IPL in past 10 years")

plt.grid(True)
plt.tight_layout()
plt.legend()
plt.show()