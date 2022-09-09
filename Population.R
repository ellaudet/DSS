## 3. INFERRING POPULATION CHARACTERISTICS VIA SURVEY RESEARCH

## 3.3 MEASURING SUPPORT FOR BREXIT

## Set the working directory
setwd("~/Desktop/DSS") # example of setwd() for Mac 
setwd("C:/user/Desktop/DSS") # example for Windows

## Load the dataset
bes <- read.csv("BES.csv") # reads and stores data

## Understand the data
## (Read about description of variables and unit of observation)
head(bes) # shows first observations

## Identify the types of variables included
## (character vs. numeric; binary vs. non-binary)

## Identify the number of observations
dim(bes) # provides dimensions of dataframe: rows, columns

## Predicting the referendum outcome
## Frequency tables
table(bes$vote) # creates frequency table of vote

## Tables of proportions 
## option a: create frequency table first
freq_table <- table(bes$vote) # object with frequency table
prop.table(freq_table) # creates table of proportions

## option b: do it all at once
prop.table(table(bes$vote)) # creates table of proportions

## 3.4 WHO SUPPORTED BREXIT?

## Handling missing data
table(bes$education, exclude=NULL) # table() including NAs
mean(bes$leave) # mean() without removing NAs
mean(bes$leave, na.rm=TRUE) # mean() removing NAs
bes1 <- na.omit(bes) # removes observations with NAs
head(bes) # shows first observations of original dataframe
head(bes1) # shows first observations of new dataframe
dim(bes) # provides dimensions (rows, columns) of original dataframe
dim(bes1) # provides dimensions (rows, columns) of new dataframe

## Two-way frequency tables
table(bes1$leave, bes1$education) 

## Two-way tables of proportions
prop.table(table(bes1$leave, bes1$education)) 
prop.table(table(bes1$leave, bes1$education), margin=1) # with margin=1
prop.table(table(bes1$leave, bes1$education), margin=2) # with margin=2

## Histograms
hist(bes1$age) # creates histogram of all observations in age
hist(bes1$age[bes1$leave==0]) # creates histogram for non−supporters 
hist(bes1$age[bes1$leave==1]) # creates histogram for supporters

## Density histograms
## Create histograms
hist(bes1$age[bes1$education==1]) # for respondents w/ no qualifications
hist(bes1$age[bes1$education==4]) # for respondents w/ undergraduate degree
## Create density histograms
hist(bes1$age[bes1$education==1], freq=FALSE) # for respondents w/ no qualifications
hist(bes1$age[bes1$education==4], freq=FALSE) # for respondents w/ undergraduate degree

## Create density histograms
hist(bes1$age[bes1$leave==0], freq=FALSE) # for non-supporters
hist(bes1$age[bes1$leave==1], freq=FALSE) # for supporters

## Descriptive statistics
mean(bes1$age[bes1$leave==0]) # mean age of non−supporters
mean(bes1$age[bes1$leave==1]) # mean age of supporters
median(bes1$age[bes1$leave==0]) # median age of non−supporters
median(bes1$age[bes1$leave==1]) # median age of supporters
sd(bes1$age[bes1$leave==0]) # sd of age for non−supporters
sd(bes1$age[bes1$leave==1]) # sd of age for supporters
var(bes1$age[bes1$leave==1]) # variance of age for supporters
sd(bes1$age[bes1$leave==1])^2 # square of sd of age for supporters
sqrt(var(bes1$age[bes1$leave==1])) # square root of variance of age for supporters

## 3.5 RELATIONSHIP BETWEEN EDUCATION AND THE LEAVE VOTE IN THE ENTIRE UK

## Set the working directory
setwd("~/Desktop/DSS") # example of setwd() for Mac 
setwd("C:/user/Desktop/DSS") # example for Windows

## Load the dataset
dis <- read.csv("UK_districts.csv") # reads and stores data

## Understand the data
## (Read about description of variables and unit of observation)
head(dis) # shows first observations

## Identify the types of variables included
## (character vs. numeric; binary vs. non-binary)

## Identify the number of observations
dim(dis) # provides dimensions of dataframe: rows, columns

## Handling missing data
dis1 <- na.omit(dis) # removes observations with NAs
dim(dis1) # provides dimensions (rows, columns) of new dataframe

## Scatter plot
plot(dis1$high_education, dis1$leave) # creates scatter plot, required arguments in this order: X, Y
plot(x=dis1$high_education, y=dis1$leave) # creates scatter plot, using names of the arguments 
plot(y=dis1$leave, x=dis1$high_education) # creates scatter plot, using names of the arguments

## Add straight dashed lines to the most recent graph
abline(v=mean(dis1$high_education), lty="dashed") # vertical
abline(h=mean(dis1$leave), lty="dashed") # horizontal

## Correlation
cor(dis1$high_education, dis1$leave) # calculates correlation between X and Y
cor(dis1$leave, dis1$high_education) # calculates correlation between Y and X
