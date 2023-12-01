# Taking two lines of input for password and its confirmation
password = input()
confirmation = input()

# Comparing the password and its confirmation
if password == confirmation:
    print("Password accepted")
else:
    print("Password not accepted")
