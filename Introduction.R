## 1. INTRODUCTION

## 1.5 LOADING AND MAKING SENSE OF DATA

## STEP 1. Set the working directory
setwd("~/Desktop/DSS") # example of setwd() for Mac 
setwd("C:/user/Desktop/DSS") # example for Windows

## STEP 2. Load the dataset
star <- read.csv("STAR.csv") # reads and stores data

## STEP 3. Understand the data
## (Read about description of variables and unit of observation)
View(star) # opens new tab with entire dataset
head(star) # shows the first six observations
head(star, n=3) # shows the first three observations

## STEP 4. Identify the types of variables included
## (character vs. numeric; binary vs. non-binary)

## STEP 5. Identify the number of observations
dim(star) # provides dimensions of dataframe: rows, columns

## 1.6 COMPUTING AND INTERPRETING MEANS

## Accessing variables inside dataframes
star$reading

## Means
mean(star$reading) # calculates the mean of reading
mean(star$graduated) # calculates the mean of graduated
