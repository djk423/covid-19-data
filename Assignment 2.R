getwd()

## Read the file "us-states.csv" into an R data frame.

STATES <- read.csv("us-states.csv")

##Process the data frame using dplyr functions to keep only observations for Pennsylvania.

PENNSYLVANIA <- filter(STATES, state=="Pennsylvania")

##Create 2 new variables, "incr_cases" and "incr_deaths" 
##by calculating the CHANGES in the cases and deaths variables, respectively.
 
PENNSYLVANIA$incr_cases <- 1
PENNSYLVANIA$incr_deaths <- 1

for (i in 2:915) {
  PENNSYLVANIA$incr_cases[i] <- (PENNSYLVANIA$cases[i]-PENNSYLVANIA$cases[i-1]) 
}

for (i in 2:915) {
  PENNSYLVANIA$incr_deaths[i] <- (PENNSYLVANIA$deaths[i]-PENNSYLVANIA$deaths[i-1]) 
}

##As a checksum to help grade this assignment, 
##have it calculate the sd() of all incr_cases in PA and print it in the Console. 

sd(PENNSYLVANIA$incr_cases,TRUE)

