#!/usr/bin/env python
# coding: utf-8

# In[1]:


#Lab2
#Class:ELEC4511 HardwareSoftware
#Name:Fuwei Huang,Claire Charlton,John Milner


# In[2]:


import json
import ast
import pandas as pd
from pandas import DataFrame


# In[3]:


#Part 1
class Rectangle():
    def __init__(self,length,width):
        self.length=length
        self.width=width
    def rectangle_area(self):
        self.area=self.length * self.width #Calculate area
        return self.area
newRectangle=Rectangle(12,10)
print(newRectangle.rectangle_area())


# In[4]:


#Part 2
class Circle ():
    def __init__(self,radius):
        self.radius=radius
    def areas(self):
        self.area=3.14*(self.radius**2) #Calculate area
        return self.area
    def circumference(self):
        self.circu=2*3.14*self.radius #Calculate Circumference
        return self.circu
NewCircle= Circle(8)
print(NewCircle.areas())
print(NewCircle.circumference())


# In[5]:


#Problem 2
def create_json():
    user_value={}
    while True:
        value=input('Enter an item or type "done" to quit:\n')
        if value == 'done':
            break
        else:
            newdict=json.loads(value) #Convert it to dict form
            user_value.update(newdict) #Update the dict
    with open('information.json',"w") as f:
        f.write(json.dumps(user_value)) #Write to the Json file
    return user_value


# In[6]:


create_json()


# In[7]:


#Problem 3- Part1
def read_comp():
    data=pd.read_excel('employee.xlsx',sheet_name='Sheet1')
    filterdata=data[data['hire_date']> '2007-01-01'] #Set the range
    frame=DataFrame(filterdata) #Convert it to dataframe
    return frame
read_comp()


# In[8]:


#Problem 3- Part2
#sort by hiring_date of emp_id? the expoutput is sort by emp_id.
def sortdate():
    data=pd.read_excel('employee.xlsx',sheet_name='Sheet1')
    data["hire_date"] = pd.to_datetime(data["hire_date"]) #Convert argument to datetime
    data=data.sort_values(by="hire_date") #Sort by the hire date
    return data
sortdate()


# In[9]:


#Problem 3- Part3
def filterdate():
    data=pd.read_excel('employee.xlsx',sheet_name='Sheet1')
    filterdata=data[(data['hire_date']> '2005-01-01') & (data['hire_date'] < '2006-12-01')] #Set the range for hire date
    frame=DataFrame(filterdata)
    return frame
filterdate()


# In[10]:


#Problem 3- Part4
def setindex():
    data=pd.read_excel('employee.xlsx',sheet_name='Sheet1')
    data=data.set_index('hire_date') #Set the index
    return data
setindex()


# In[11]:


#Problem 3- Part5
def combinesheet():
    all_dfs = pd.read_excel('employee.xlsx', sheet_name=None)#None read in all the sheet
    data = pd.concat(all_dfs, ignore_index=True) #Combine all sheet
    data.to_excel('employee_new.xlsx',sheet_name='Sheet1') #Write to the new excel file
    return data
combinesheet()

