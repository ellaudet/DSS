## 7. QUANTIFYING UNCERTAINTY

## 7.2.1 CONFIDENCE INTERVAL FOR THE SAMPLE MEAN

## Set the working directory
## (delete the lines of code that are not for your computer, and
##  if using Windows, replace "username" with your own username)
setwd("~/Desktop/DSS") # if Mac
setwd("C:/Users/username/Desktop/DSS") # if Windows
setwd("/cloud/project/DSS") # if in the cloud

## Load and explore data (including deleting observations with NAs)
bes <- read.csv("BES.csv") # reads and stores data
bes1 <- na.omit(bes) # eliminates observations with NAs
dim(bes1) # provides dimensions of dataframe: rows, columns
head(bes1) # shows first observations

## Compute the sample mean
mean(bes1$leave)

## Compute and store n
n <- nrow(bes1) 

## Compute the 95% confidence interval for the sample mean
mean(bes1$leave) - 1.96 * sqrt(var(bes1$leave)/length(bes1$leave)) # lower limit
mean(bes1$leave) + 1.96 * sqrt(var(bes1$leave)/length(bes1$leave)) # upper limit

## 7.2.2 CONFIDENCE INTERVAL FOR THE DIFFERENCE-IN-MEANS ESTIMATOR

## Set the working directory
## (delete the lines of code that are not for your computer, and
##  if using Windows, replace "username" with your own username)
setwd("~/Desktop/DSS") # if Mac
setwd("C:/Users/username/Desktop/DSS") # if Windows
setwd("/cloud/project/DSS") # if in the cloud

## Load and explore data, and create new variables
star <- read.csv("STAR.csv") # reads and stores data
dim(star) # provides dimensions of dataframe: rows, columns
head(star) # shows first observations
star$small <- ifelse(star$classtype=="small", 1, 0) # creates the treatment variable

## Compute the difference-in-means estimator for reading
mean(star$reading[star$small==1]) - mean(star$reading[star$small==0])

## Create separate dataframes for each group
treatment <- star[star$small==1, ] # for treatment group
control <- star[star$small==0, ] # for control group

## Compute and store sample sizes for each group
n_t <- nrow(treatment) # for treatment group
n_c <- nrow(control) # for control group

## Compute the 95% confidence interval for the difference-in-means estimator
## calculate lower limit of 95% CI for diffs-in-means
mean(treatment$reading) - mean(control$reading) - 
  1.96 * sqrt(var(treatment$reading)/n_t + var(control$reading)/n_c) # lower limit

mean(treatment$reading) - mean(control$reading) + 
  1.96 * sqrt(var(treatment$reading)/n_t + var(control$reading)/n_c) #upper limit

## 7.2.3 CONFIDENCE INTERVAL FOR PREDICTED OUTCOMES

## Set the working directory
## (delete the lines of code that are not for your computer, and
##  if using Windows, replace "username" with your own username)
setwd("~/Desktop/DSS") # if Mac
setwd("C:/Users/username/Desktop/DSS") # if Windows
setwd("/cloud/project/DSS") # if in the cloud

## Load and explore data, and create new variables
co <- read.csv("countries.csv") # reads and stores data
dim(co) # provides dimensions of dataframe: rows, columns
head(co) # shows first observations
co$gdp_change <- ((co$gdp - co$prior_gdp)/
     co$prior_gdp) * 100 # creates GDP percent change variable
co$light_change <- ((co$light - co$prior_light)/
     co$prior_light) * 100 # creates light percent change variable

## Fit linear model
fit <- lm(gdp_change ~ light_change, data = co)
fit # shows contents of object

## Compute 95% confidence interval for prediction
predict(fit, # object with lm() output
        newdata=data.frame(light_change=20), # set value of X 
        interval="confidence") # provide 95% confidence interval

## 7.3.1 HYPOTHESIS TESTING WITH THE DIFFERENCE-IN-MEANS ESTIMATOR

## Set the working directory
## (delete the lines of code that are not for your computer, and
##  if using Windows, replace "username" with your own username)
setwd("~/Desktop/DSS") # if Mac
setwd("C:/Users/username/Desktop/DSS") # if Windows
setwd("/cloud/project/DSS") # if in the cloud

## Load and explore data, and create new variables
star <- read.csv("STAR.csv") # reads and stores data
dim(star) # provides dimensions of dataframe: rows, columns
head(star) # shows first observations
star$small <- ifelse(star$classtype=="small", 1, 0) # creates the treatment variable

## Create separate dataframes for each group
treatment <- star[star$small==1, ] # for treatment group
control <- star[star$small==0, ] # for control group

## Compute and store sample sizes for each group
n_t <- nrow(treatment) # for treatment group
n_c <- nrow(control) # for control group

## Calculate and store observed value of test statistic
z_obs <- (mean(treatment$reading) - mean(control$reading))/
              sqrt(var(treatment$reading)/n_t + var(control$reading)/n_c )
z_obs # shows contents of object

## Calculate the associated p-value
2* pnorm(-abs(z_obs))

## 7.3.2 HYPOTHESIS TESTING WITH ESTIMATED REGRESSION COEFFICIENTS

## Set the working directory
## (delete the lines of code that are not for your computer, and
##  if using Windows, replace "username" with your own username)
setwd("~/Desktop/DSS") # if Mac
setwd("C:/Users/username/Desktop/DSS") # if Windows
setwd("/cloud/project/DSS") # if in the cloud

## Load and explore data
uas <- read.csv("UA_survey.csv") # reads and stores data
dim(uas) # provides dimensions of dataframe: rows, columns
head(uas) # shows first observations

## Fit linear model
fit <- lm (pro_russian_vote ~ russian_tv + within_25km, data = uas) 
fit # shows contents of object

## Show table with statistics related to fitted model
summary(fit)$coef
