import random
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

baseData = pd.read_excel("data/附件.xlsx", sheet_name=0)
s = "Crime Type Summer|Crime Type Winter".split("|")
# Generate dummy data into a dataframe
j = {x: [random.choice(["ASB", "Violence", "Theft", "Public Order", "Drugs"]) for j in range(300)] for x in s}
df = pd.DataFrame(j)
index = np.arange(5)
bar_width = 0.35
fig, ax = plt.subplots()
summer = ax.bar(index, df["Crime Type Summer"].value_counts(), bar_width, label="Summer")
winter = ax.bar(index + bar_width, df["Crime Type Winter"].value_counts(),
                bar_width, label="Winter")
ax.set_xlabel('Category')
ax.set_ylabel('Incidence')
ax.set_title('Crime incidence by season, type')
ax.set_xticks(index + bar_width / 2)
ax.set_xticklabels(["ASB", "Violence", "Theft", "Public Order", "Drugs"])
ax.legend()
plt.show()
