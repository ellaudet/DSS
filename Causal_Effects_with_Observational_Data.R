## 5. ESTIMATING CAUSAL EFFECTS WITH OBSERVATIONAL DATA

## 5.3 THE EFFECT OF RUSSIAN TV ON UKRAINIANS' 2014 
## VOTING BEHAVIOR

## Set the working directory
setwd("~/Desktop/DSS") # example of setwd() for Mac 
setwd("C:/user/Desktop/DSS") # example for Windows

## Load the dataset
uas <- read.csv("UA_survey.csv") # reads and stores data

## Understand the data
## (Read about description of variables and unit of observation)
head(uas) # shows first observations

## Identify the number of observations
dim(uas) # provides dimensions of dataframe: rows, columns

### 5.3.1 USING THE SIMPLE LINEAR MODEL TO COMPUTE
### THE DIFFERENCE-IN-MEANS ESTIMATOR

## Option A: Compute the difference-in-means estimator directly
mean(uas$pro_russian_vote[uas$russian_tv==1])-
  mean(uas$pro_russian_vote[uas$russian_tv==0])

## Option B: Fit simple linear regression model
lm(pro_russian_vote ~ russian_tv, data=uas) # fits linear model

### 5.3.2 CONTROLLING FOR CONFOUNDERS USING A
### MULTIPLE LINEAR REGRESSION MODEL

## Fit multiple linear regression model
lm(pro_russian_vote ~ russian_tv + within_25km,
   data=uas) # fits linear model

## 5.4 THE EFFECT OF RUSSIAN TV ON UKRAINIAN 2014
## ELECTORAL OUTCOMES

## Load the dataset
uap <- read.csv("UA_precincts.csv") # reads and stores data

## Understand the data
## (Read about description of variables and unit of observation)
head(uap) # shows first observations

## Identify the number of observations
dim(uap) # provides dimensions of dataframe: rows, columns

### 5.4.1 USING THE SIMPLE LINEAR MODEL TO COMPUTE
### THE DIFFERENCE-IN-MEANS ESTIMATOR

## Create pro-russian change variable
uap$pro_russian_change <- uap$pro_russian - uap$prior_pro_russian

## Create histogram
hist(uap$pro_russian_change)

## Fit simple linear regression model
lm(pro_russian_change ~ russian_tv, data=uap) # fits linear model

### 5.4.2 CONTROLLING FOR CONFOUNDERS USING A
### MULTIPLE LINEAR REGRESSION MODEL

## Fit multiple linear regression model
lm(pro_russian_change ~ russian_tv + within_25km,
   data=uap) # fits linear model