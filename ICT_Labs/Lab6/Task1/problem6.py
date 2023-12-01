# Get the edge length of the cube from the user
edge_length = float(input("Enter the edge length of the cube: "))

# Calculate the volume and surface area of the cube
volume = edge_length ** 3
surface_area = 6 * (edge_length ** 2)

# Display the calculated values
print(f"Объем = {int(volume)}")
print(f"Площадь полной поверхности = {int(surface_area)}")
