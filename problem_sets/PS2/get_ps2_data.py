from bcb import sgs

# Monthly IPCA
price_measures = sgs.get({'IPCA': 433, "IGPM": 189}, start='1995-02-01')
price_measures.index = price_measures.index.to_period('M')

price_measures.to_csv("problem_sets/ps2/ipca_igpm.csv")

print("Data is downloaded and saved.")