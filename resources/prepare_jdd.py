import pandas as pd
import os

# Crée le dossier 'data' s'il n'existe pas
os.makedirs("data", exist_ok=True)

# Données des départements
data = {
    "ID": [1, 2, 3, 4],
    "Name": ["Informatique", "Ressources Humaines", "Marketing", "Finance"]
}

df = pd.DataFrame(data)

# Écriture dans data/departments.csv
df.to_csv("data/departments.csv", index=False, encoding="utf-8")
