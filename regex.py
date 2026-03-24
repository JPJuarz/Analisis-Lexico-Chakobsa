import re

def parse(input):
    listwords = input.split(",")
    return listwords

def accepted(listwords):
    # Regex  
    expression = r'^(m(idri|a(hdi|qbara|tar|ula)))$'

    # Checa si el input matchea con las palabras aceptadas (regex)
    for i in range(len(listwords)):
        word = listwords[i]
        if re.match(expression, word): 
            print("The word ", word, "is accepted")
        else:
            print("The word ", word, "is NOT accepted")

def start():
    while True:
        test = input("Enter word(s) separated by commas: ")
        if not test:
            print("Empty input")
            break
        listwords = parse(test)
        accepted(listwords)

start()
