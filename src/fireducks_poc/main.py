import pandas as pd

df = pd.DataFrame(["hello world"], columns=["text"])

print(df)

try:
    df._evaluate()
    print("pandas replaced with fireducks.pandas")
except AttributeError:
    print("fireducks not installed / detected")
