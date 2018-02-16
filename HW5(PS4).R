# Applied Statistical Programing 
# Homework 5 - Problem Set 4
# Gangyi Sun (441748)


# Part 1: Getting started 
# The following code needs to be debugged and improved
myFunction<-function(doorthing, doorthing2, x){
  doorthing1<-doorthing2<-sample(1:3, 1)
  if (doorthing1==doorthing2){ x<-TRUE } else { x==FALSE }
  x
}
debug(myFunction)
myFunction(sample(1:3, 1), sample(1:3, 1))
undebug(myFunction)
# Should return a TRUE if these samples are equal and
# a false if they are not
# It appears that the function is always returning TRUE. 
# It seems like the assignment in line 9 causes doorthing1 and doorthing2 to have the same integer value. 
# use debug() to check this and debug 
# By running debug multiple times, we see that our initial hypothesis of the problem is correct. Every time we run 
# debug, doorthing1 and doorthing2 always takes the same value. This can be fixed by assigning sample to doorthing1
# and doorthing2 seperately. 