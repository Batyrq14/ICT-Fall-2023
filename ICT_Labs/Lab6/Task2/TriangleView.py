# Taking three positive integers as input (side lengths of a triangle)
side1 = int(input())
side2 = int(input())
side3 = int(input())

# Checking the type of triangle based on its side lengths
if side1 == side2 == side3:
    print("Equilateral")
elif side1 == side2 or side1 == side3 or side2 == side3:
    print("Isosceles")
else:
    print("Versatile")
