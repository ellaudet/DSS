## 1. INTRODUCTION

## 1.6 LOADING AND MAKING SENSE OF DATA

## STEP 1: Set the working directory
## (delete the lines of code that are not for your computer, and
##  if using Windows, replace "username" with your own username)
setwd("~/Desktop/DSS") # if Mac
setwd("C:/Users/username/Desktop/DSS") # if Windows
setwd("/cloud/project/DSS") # if in the cloud

## STEP 2: Load the dataset
star <- read.csv("STAR.csv") # reads and stores data

## STEP 3: Understand the data
View(star) # opens new tab with entire dataset
head(star) # shows the first six rows
head(star, n = 3) # shows the first three rows

## STEP 4: Identify the types of variables included

## STEP 5: Identify the number of observations
dim(star) # provides dimensions of dataframe: rows, columns

## 1.7 COMPUTING AND INTERPRETING MEANS

## Accessing variables inside dataframes
star$reading

## Means
mean(star$reading) # calculates the mean of reading
mean(star$graduated) # calculates the mean of graduated
