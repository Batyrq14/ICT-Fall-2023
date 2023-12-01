m = int(input())
n = int(input())

if m > n:
    for i in range(m, n - 1, -1):
        if i % 2 != 0:
            print(i)
else:
    print("Invalid input: m should be greater than n")
