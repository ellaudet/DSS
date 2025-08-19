## 2. ESTIMATING CAUSAL EFFECTS WITH RANDOMIZED EXPERIMENTS

## 2.5 DO SMALL CLASSES IMPROVE STUDENT PERFORMANCE?

## Set the working directory
## (delete the lines of code that are not for your computer, and
##  if using Windows, replace "username" with your own username)
setwd("~/Desktop/DSS") # if Mac
setwd("C:/Users/username/Desktop/DSS") # if Windows
setwd("/cloud/project/DSS") # if in the cloud

## Load the dataset
star <- read.csv("STAR.csv") # reads and stores data

## Look at the data
head(star) # shows the first six observations

## Relational operators in R
3==3 # example of a TRUE statement
3==4 # example of a FALSE statement
star$classtype=="small" 

## Creating new variables
ifelse(star$classtype=="small", 1, 0) # creates contents of variable
star$small <- ifelse(star$classtype=="small", 1, 0) # creates new variable
head(star) # shows first observations

## Subsetting variables
mean(star$reading) # calculates the mean of reading
mean(star$reading[star$small==1]) # mean of reading for treatment group
mean(star$reading[star$small==0]) # mean of reading for control group

## Compute the difference−in−means estimator for reading 
mean(star$reading[star$small==1]) - mean(star$reading[star$small==0])

## Compute the difference−in−means estimator for math 
mean(star$math[star$small==1]) - mean(star$math[star$small==0])

## Compute the difference-in-means estimator for graduated
mean(star$graduated[star$small==1]) - mean(star$graduated[star$small==0])

## To help with interpretation
mean(star$graduated[star$small==1]) # mean of graduated for treatment group
mean(star$graduated[star$small==0]) # mean of graduated for control group
0.8735043 - 0.8664731 # difference-in-means for graduated
