# Applied Statistical Programing 
# Homework 5 - Problem Set 4
# Gangyi Sun (441748)


# Part 1: Getting started 
# The given code for myFunction needs to be debugged and improved.
# The function should return a TRUE if these samples are equal and a false if they are not.
# It appears that the function is always returning TRUE. 
# It seems like the assignment in line 9 causes doorthing1 and doorthing2 to have the same integer value. 
# use debug() to check this and debug 
# By running debug multiple times, we see that our initial hypothesis of the problem is correct. Every time we run 
# debug, doorthing1 and doorthing2 always takes the same value. This can be fixed by assigning sample to doorthing1
# and doorthing2 seperately. ** In fact, since we want the function to take as input door choices, we don't need to 
# assign values to the doors within the function.
# Another problem is identified after fixing the first problem of how values to doorthing1 and doorthing2 are assigned.
# If doorthing1 and doorthing2 are not equal, an error is thrown. This is becuase in line 11, == is used wrongly. 
# An assignment operator should be used to assign FALSE to x, instead of a logical equality sign. 
# After these changes, myFunction is now fixed. It returns TRUE sometimes and FALSE sometimes. 
# We now improve the naming convention, identing and commenting on the function. The improved function is as follows: 

# The function compareDoors takes 2 door choices (represented as integers) as input, doorChoice and doorCar.
# if doorChoice is equal to doorCar, the function returns TRUE. if they're not equal, function returns false. 
compareDoors<-function(doorChoice, doorCar){
  isSame<-FALSE
  if (doorChoice==doorCar){ 
    isSame<-TRUE 
  } 
  return(isSame)
}
compareDoors(1,1)   # returns TRUE
compareDoors(1,2)   # returns FALSE 
