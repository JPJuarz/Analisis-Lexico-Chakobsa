def parse(word):
    # Todas empiezan con m
    if not word.startswith("m"):
        print("Rejected")
        return

    # Cuando es midri
    if word == "midri":
        print(word, " = Accepted")
        return

    # Las que empiezan con ma
    if word.startswith("ma"):
        if word == "mahdi":
            print(word, " = Accepted")
        elif word == "maqbara":
            print(word, " = Accepted")
        elif word == "matar":
            print(word, " = Accepted")
        elif word == "maula":
            print(word, " = Accepted")
        else:
            print(word, " = Rejected")
    else:
        print(word, " = Rejected")


# Pruebas
parse("mahdi")
parse("maqbara")
parse("matar")
parse("maula")
parse("midri")

parse("mahd")    # Rejected
parse("matra")   # Rejected
parse("midrii")  # Rejected
parse("mxdri")   # Rejected