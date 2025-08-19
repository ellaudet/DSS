## 4. PREDICTING OUTCOMES USING LINEAR REGRESSION

## 4.4 PREDICTING GDP USING PRIOR GDP

## Set the working directory
## (delete the lines of code that are not for your computer, and
##  if using Windows, replace "username" with your own username)
setwd("~/Desktop/DSS") # if Mac
setwd("C:/Users/username/Desktop/DSS") # if Windows
setwd("/cloud/project/DSS") # if in the cloud

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

## Visualize the relationship
plot(x=co$prior_gdp, y=co$gdp) # creates scatter plot

## Compute correlation
cor(co$gdp, co$prior_gdp)

## Fit linear model
lm(co$gdp ~ co$prior_gdp) # option a: using $
lm(gdp ~ prior_gdp, data = co) # option b: using data argument

## Add fitted line to scatter plot
fit <- lm(gdp ~ prior_gdp, data = co) # saves fitted model
abline(fit) # adds line to scatter plot

### 4.4.2 WITH NATURAL LOGARITHM TRANSFORMATIONS

## Create log−transformed GDP variables
co$log_gdp <- log(co$gdp) # gdp
co$log_prior_gdp <- log(co$prior_gdp) # prior gdp

## Create histograms
hist(co$gdp) # gdp
hist(co$log_gdp) # log−transformed gdp
hist(co$prior_gdp) # prior gdp
hist(co$log_prior_gdp) # log−transformed prior gdp

## Create scatter plots
plot(x=co$prior_gdp, y=co$gdp) # before transformation
plot(x=co$log_prior_gdp, y=co$log_gdp) # after transformation

## Compute new correlation
cor(co$log_gdp, co$log_prior_gdp)

## Fit new linear model
lm(log_gdp ~ log_prior_gdp, data = co) 

## 4.5 PREDICTING GDP GROWTH USING CHANGE IN NIGHT-TIME LIGHT EMISSIONS

## Create GDP percent change variable
co$gdp_change <- ((co$gdp - co$prior_gdp)/co$prior_gdp) * 100

## Create light percent change variable
co$light_change <- ((co$light - co$prior_light )/co$prior_light ) * 100

## Create histograms
hist(co$gdp_change) # of change in gdp
hist(co$light_change) # of change in light

## Create scatter plot
plot(x=co$light_change, y=co$gdp_change)

## Compute correlation
cor(co$gdp_change, co$light_change) 

## Fit linear model
lm(gdp_change ~ light_change, data = co) 

## 4.6 MEASURING HOW WELL THE MODEL FITS THE DATA WITH R^2

## Compute R−squared for each predictive model
cor(co$gdp, co$prior_gdp)^2 # model 1
cor(co$log_gdp, co$log_prior_gdp)^2 # model 2
cor(co$gdp_change, co$light_change)^2 # model 3

