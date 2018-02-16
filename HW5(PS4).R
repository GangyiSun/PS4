# Applied Statistical Programing 
# Homework 5 - Problem Set 4
# Gangyi Sun (441748)


# Part 1: Getting started 
# The following code needs to be debugged and improved
myFunction<-function(doorthing, doorthing2, x){
  doorthing1<-sample(1:3, 1)
  doorthing2<-sample(1:3, 1)
  if (doorthing1==doorthing2){ x<-TRUE } else { x<-FALSE }
  x
}
myFunction(sample(1:3, 1), sample(1:3, 1))
# Should return a TRUE if these samples are equal and
# a false if they are not
# It appears that the function is always returning TRUE. 
# It seems like the assignment in line 9 causes doorthing1 and doorthing2 to have the same integer value. 
# use debug() to check this and debug 
# By running debug multiple times, we see that our initial hypothesis of the problem is correct. Every time we run 
# debug, doorthing1 and doorthing2 always takes the same value. This can be fixed by assigning sample to doorthing1
# and doorthing2 seperately. 
# Another problem is identified after fixing the first problem of how values to doorthing1 and doorthing2 are assigned.
# If doorthing1 and doorthing2 are not equal, an error is thrown. This is becuase in line 11, == is used wrongly. 
# An assignment operator should be used to assign FALSE to x, instead of a logical equality sign. 
# After these changes, myFunction is now fixed. It returns TRUE sometimes and FALSE sometimes. 
