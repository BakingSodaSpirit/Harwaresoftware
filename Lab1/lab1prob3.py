#Prob 3 - Fuwei, Claire, John
import numpy
import os

def count_words(filepath):
    count=0
    file=open(filepath, "r")  
    for line in file:
        wordsspace=line.split(" ");#split the line base on space
        count = count + len(wordsspace)
    return count

if __name__ == "__main__":
	txt='words.txt'
	filepath=os.path.abspath(txt)
	words = count_words(filepath)
	print(words)
	