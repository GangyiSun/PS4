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
myFunction(sample(1:3, 1), sample(1:3, 1))
# Should return a TRUE if these samples are equal and
# a false if they are not
# It appears that the function is always returning TRUE. 
# It seems like the assignment in line 9 causes doorthing1 and doorthing2 to have the same integer value. 
# use debug() to check this and debug 