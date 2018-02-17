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
# To test function, 
compareDoors(1,1)   # returns TRUE
compareDoors(1,2)   # returns FALSE 



# Part 2: Moving On
# Define a new S4 class door. 
setClass(Class="door",
         representation = representation (
           chosenDoor="numeric",
           carDoor="numeric",
           switch="logical"
           ), 
         prototype = prototype (
           chosenDoor=c(),
           carDoor=c(),
           switch=c()
           )
         )

# A validation function that checks whether values stored in the slots are appropriately structured. 
setValidity("door", function(object){
  test1<-(object@chosenDoor==1 | object@chosenDoor==2 | object@chosenDoor==3)
  test2<-(object@carDoor==1 | object@carDoor==2 | object@carDoor==3)
  test3<-(object@switch==TRUE | object@switch==FALSE)
  test<-(test1==TRUE & test2==TRUE & test3==TRUE)
  if(test!=TRUE){return("@DoorChoice is not a valid value")}
  }
  )

# A construction function that allows the user to create a door object
setMethod("initialize", "door",  function(.Object, ...){
  value = callNextMethod()
  validObject(value)
  return(value)
  }
  )

# Create generic PlayGame
setGeneric("PlayGame", function(object="door"){   
  standardGeneric("PlayGame")
  }
  )

# creates PlayGame method for class door 
setMethod("PlayGame", "door",
          function(object){
            winner<-FALSE
            object@carDoor<-sample(1:3,1)
            firstChosenDoor<-sample(1:3,1)
            if (object@switch==FALSE){
              object@chosenDoor<-firstChosenDoor
            }
            if (object@switch==TRUE){
              temp<-FALSE
              openDoor<-0
              while(temp==FALSE){
                openDoor<-sample(1:3,1)
                if ((openDoor!=object@carDoor)&(openDoor!=firstChosenDoor)){
                  temp<-TRUE
                }
              }
              if(openDoor==1){
                choices<-c(2,3)
              } else if (openDoor==2){
                choices<-c(1,3)
              } else if (openDoor==3){
                choices<-c(1,2)
              }
              object@chosenDoor<-sample(choices,1)
            }
            if (object@chosenDoor==object@carDoor){
              winner<-TRUE
            } else {
              winner<-FALSE
            }
            return(winner)
          }
          )


# Part 3: Simulation
# 1) Simulate 1000 rounds of the game, player does not switch 
PlayNoSwitch<-function(i){
  p1<-new("door", chosenDoor=1,carDoor=1,switch=F)
  result<-PlayGame(p1)
  return(result)
}
noSwitch<-sapply(c(1:1000),PlayNoSwitch)
tabNoSwitch<-table(noSwitch)
perctWonNoSwitch<-tabNoSwitch[2]/1000*100
paste("Player who chose not to switch won ", perctWonNoSwitch, "% of the time.")

# 2) simulate 1000 rounds of the game, player does switches 
PlayYesSwitch<-function(i){
  p1<-new("door", chosenDoor=1,carDoor=1,switch=T)
  result<-PlayGame(p1)
  return(result)
}
yesSwitch<-sapply(c(1:1000),PlayYesSwitch)
tabYesSwitch<-table(yesSwitch)
perctWonYesSwitch<-tabYesSwitch[2]/1000*100
paste("Player who chose to switch won ", perctWonYesSwitch, "% of the time.")

# 3) Which strategy is better? 
# switching is better. compare percentage won. 






