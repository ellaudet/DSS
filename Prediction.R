## 4. PREDICTION

## 4.4 LOADING AND MAKING SENSE OF DATA

## Set the working directory
setwd("~/Desktop/DSS") # example of setwd() for Mac 
setwd("C:/user/Desktop/DSS") # example for Windows

## Load the dataset
co <- read.csv("countries.csv") # reads and stores data

## Understand the data
## (Read about description of variables and unit of observation)
head(co) # shows first observations

## Identify the types of variables included
## (character vs. numeric; binary vs. non-binary)

## Identify the number of observations
dim(co) # provides dimensions of dataframe: rows, columns


### 4.4.1 RELATIONSHIP BETWEEN GDP AND PRIOR GDP

## Visuale the relationship
plot(x=co$prior_gdp, y=co$gdp) # creates scatter plot

## Calculate correlation
cor(co$gdp, co$prior_gdp) # computes correlation

## Run a linear regression
lm(co$gdp ~ co$prior_gdp) # fits linear model
lm(gdp ~ prior_gdp, data = co) # fits linear model

## Add fitted line to scatter plot
fit <- lm(gdp ~ prior_gdp, data = co) # saves fitted model
abline(fit) # adds line to scatter plot


### 4.4.2 WITH NATURAL LOGARITHM TRANSFORMATIONS

## Create log−transformed GDP variables
co$ln_gdp <- log(co$gdp) # gdp
co$ln_prior_gdp <- log(co$prior_gdp) # prior gdp

## Create histograms
hist(co$gdp) # gdp
hist(co$ln_gdp) # log−transformed gdp
hist(co$prior_gdp) # prior gdp
hist(co$ln_prior_gdp) # log−transformed prior gdp

## Create scatter plots
plot(x=co$prior_gdp, y=co$gdp) # before transformation
plot(x=co$ln_prior_gdp, y=co$ln_gdp) # after transformation

## Calculate new correlation
cor(co$ln_gdp, co$ln_prior_gdp) # computes correlation

## Run new linear regression
lm(ln_gdp ~ ln_prior_gdp, data = co) # fits linear model


## 4.5 PREDICTING GDP GROWTH USING CHANGE IN NIGHT-TIME LIGHT EMISSIONS

## Create GDP change variable
co$gdp_change <- ((co$gdp - co$prior_gdp)/co$prior_gdp) * 100

## Create light change variable
co$light_change <- ((co$light - co$prior_light )/co$prior_light ) * 100

## Create histograms
hist(co$gdp_change) # of change in gdp
hist(co$light_change) # of change in light

## Create scatter plot
plot(x=co$light_change, y=co$gdp_change)

## Calculate correlation
cor(co$gdp_change, co$light_change) # computes correlation

## Run a linear regression
lm(gdp_change ~ light_change, data = co) # fits linear model


## 4.6 MEASURING HOW WELL THE MODEL FITS THE DATA WITH R^2

## Compute R−squared for each predictive model
cor(co$gdp, co$prior_gdp)^2 # model 1
cor(co$ln_gdp, co$ln_prior_gdp)^2 # model 2
cor(co$gdp_change, co$light_change)^2 # model 3

