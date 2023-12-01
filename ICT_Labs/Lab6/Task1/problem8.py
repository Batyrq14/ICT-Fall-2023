# Get the prices of components for three computers
monitor_price = int(input("Enter the price of the monitor: "))
system_unit_price = int(input("Enter the price of the system unit: "))
keyboard_price = int(input("Enter the price of the keyboard: "))
mouse_price = int(input("Enter the price of the mouse: "))

# Calculate the total cost of three computers
total_cost = 3 * (monitor_price + system_unit_price + keyboard_price + mouse_price)

# Display the total cost
print(total_cost)
