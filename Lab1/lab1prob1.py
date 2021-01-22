#Prob  1 - Fuwei, Claire, John

def nested_dictionary(ID,Name,Score):
    nest_dict=[{a:{b:c}} for (a,b,c) in zip(ID,Score,Name)] #Dict comp
    return print(nest_dict)

if __name__ == "__main__":
	ID=['#1', '#2', '#3', '#4', '#5']
	Score=[97,88,79,92,87]
	Name=['David Jake','Leo Marsh','Duncan John','Tom Richards','Jimmy Connors']
	nested_dictionary(ID,Score,Name)