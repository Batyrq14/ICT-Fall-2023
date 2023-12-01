# Taking the user's age as input
age = int(input())

# Determining the age group based on the user's age
if age <= 13:
    print("childhood")
elif 14 <= age <= 24:
    print("youth")
elif 25 <= age <= 59:
    print("maturity")
else:
    print("old age")
