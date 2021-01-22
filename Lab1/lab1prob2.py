#Prob 2 - Fuwei, Claire, John
def longestPeak(array):
    i=0
    j=-1
    k=-1
    d=0
    if (len(array)<3): #There won't be a peak sequence in array less than 3
        return 0
    for i in range(len(array)-1): #loop through the array
        if(array[i+1] > array[i]): #Check if the next elem is larger than the prev -increasing order
            if(k!=-1): #since we are finding the longest peak, this counts as a reset
                k= -1
                j= -1
            if(j==-1):
                j=i #store the staring index of the peak sequency
        else:
            if(array[i+1]<array[i]):#decreasing order
                 if (j!=-1): #check if its the starting sequency of the array
                    k=i+1 #ending index of the peak sequency 
            if(k != -1 and j != -1):#if both staring index and ending index exist for peak sequence
                if(d < (k - j + 1)):
                    d= k - j + 1 #Calculate and update the length
            else:
                k=-1
                j=-1 #reset
            
    if(k != -1 and j != -1):#check if both staring index and ending index exist for peak sequence
        if(d < (k - j + 1)):
            d= k - j + 1
    return d
	

if __name__ == "__main__":
	array1=[1, 2, 3, 3, 4, 0, 10, 6, 5, -1, -3, 2, 3]
	array2=[]
	array3=[1, 2, 3, 2, 1, 1]
	array4=[5, 4, 3, 2, 1, 2, 10, 12]
	print(longestPeak(array1),longestPeak(array2),longestPeak(array3),longestPeak(array4))