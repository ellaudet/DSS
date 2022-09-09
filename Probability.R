## 6. PROBABILITY

### 6.4 PROBABILITY DISTRIBUTIONS
### 6.4.1 THE BERNOULLI DISTRIBUTION

## Create a vector with possible values
possible_values <- c(1,0) # 1 for heads, 0 for tails

## Randomly sample from possible values
flip <- sample(possible_values, # vector to draw from
                size=1000000, # 1 million times
                replace=TRUE, # with replacement
                prob=c(0.5,0.5)) # from a fair coin

## Explore flip 
## (Note: The values in your console will likely not be the exact values
## shown in the book because flip was created via a random process.)
prop.table(table(flip)) # creates table of proportions
mean(flip)  # calculates the mean
var(flip)  # calculates the variance

### 6.4.2 THE NORMAL DISTRIBUTION

## Set the working directory
setwd("~/Desktop/DSS") # example of setwd() for Mac 
setwd("C:/user/Desktop/DSS") # example for Windows

## Illustration from Chapter 2
star <- read.csv("STAR.csv") # reads and stores data
hist(star$reading, freq=FALSE) # creates density histogram

## Randomly sample from distribution N(3,4)
X <- rnorm(1000000, # sample size
           mean=3, # mean
           sd=2) # standard deviation

## Explore X
## (Note: The values in your console will likely not be the exact values
## shown in the book because X was created via a random process.)
hist(X, freq=FALSE) # creates density histogram
mean(X) # calculates the mean
var(X) # calculates the variance

### 6.4.3 THE STANDARD NORMAL DISTRIBUTION

## Calculate probabilities of the standard normal distribution
pnorm(-1.96) # probability of Z less than or equal to -1.96
1 - pnorm(1.96) # probability of Z greater than or equal to 1.96
pnorm(1.96) - pnorm(-1.96) # probability of Z between -1.96 and 1.96

## How to transform a normal random variable into the standard normal random variable
## Create new random variable
Z <- (X - 3) / 2 # standardized X

## Explore Z
## (Note: The values in your console will likely not be the exact values
## shown in the book because Z was created via a random process.)
hist(Z, freq=FALSE) # creates density histogram
mean(Z) # calculates the mean
var(Z) # calculates the variance

## Compute probability of N(3,4) between -0.92 and 6.92
pnorm(6.92, mean=3, sd=2) - 
  pnorm(-0.92, mean=3, sd=2)

### 6.5 POPULATION PARAMETERS VS. SAMPLE STATISTICS
### 6.5.1 THE LAW OF LARGE NUMBERS

## Example with a binary random variable
## Draw random samples from binary variable
support_sample_1 <- sample(c(1,0), # possible values
                           size=10, # n=10
                           replace=TRUE, # with replacement
                           prob=c(0.6,0.4)) # probabilities

support_sample_2 <- sample(c(1,0), 
                           size=1000, # n=1,000
                           replace=TRUE,
                           prob=c(0.6,0.4)) 

support_sample_3 <- sample(c(1,0), 
                           size=1000000, # n=1,000,000
                           replace=TRUE, 
                           prob=c(0.6,0.4))

## Calculate sample means
## (Note: The values in your console will likely not be the exact values
## shown in the book because the samples were created via a random process.)
mean(support_sample_1) # in n=10 sample
mean(support_sample_2) # in n=1,000 sample
mean(support_sample_3) # in n=1,000,000 sample 

## Example with a normal random variable
## Draw random samples from normal distribution
height_sample_1 <- rnorm(10, # n=10
                         mean=67, # population mean = 67
                         sd=sqrt(14)) # population variance = 14

height_sample_2 <- rnorm(1000, # n=1,000
                         mean=67, 
                         sd=sqrt(14)) 

height_sample_3 <- rnorm(1000000, # n=1,000,000
                         mean=67, 
                         sd=sqrt(14)) 

## Calculate sample means
## (Note: The values in your console will likely not be the exact values
## shown in the book because the samples were created via a random process.)
mean(height_sample_1) # in n=10 sample
mean(height_sample_2) # in n=1,000 sample
mean(height_sample_3) # in n=1,000,000 sample 

### 6.5.2 THE CENTRAL LIMIT THEOREM

## Example with a binary random variable
## Create an empty vector to store standardized sample means
sd_sample_means <- c() 

## Run a for loop with 10,000 iterations
for(i in 1:10000){
  ## draw a random sample of 1,000 observations
  ## from binary variable with p=0.6
  support_sample <- sample(c(1,0), # possible values
                           size=1000, # n=1,000
                           replace=TRUE, # with replacement
                           prob=c(0.6,0.4)) # probabilities
  ## calculate and store the standardized sample mean
  sd_sample_means[i] <- 
      (mean(support_sample) - 0.60)/sqrt(0.24 / 1000)
}

## Create density histogram
## (Note: The values in your console will likely not be the exact values
## shown in the book because the standardized sample means were created via a random process.)
hist(sd_sample_means, freq=FALSE) 

### 6.7 APPENDIX: FOR LOOPS

## Run a simple for loop with 3 iterations
## printing the value of i in each iteration
for(i in 1:3){
  print(i) # print the value of i
}

## Change the code we want R to execute repeatedly so that 
## in each iteration, R: (1) draws a random sample of 1,000 observations from 
## a binary variable with p=0.5, and (2) calculates and prints the sample mean
for(i in 1:3){
  ## draw a random sample of 1,000 observations
  ## from a binary variable with p=0.5
  flip <- sample(c(1,0), # possible values
                 size=1000, # n=1,000
                 replace=TRUE, # with replacement
                 prob=c(0.5,0.5)) # probabilities
  ## print sample mean
  print(mean(flip))
}

## Change the code we want R to execute repeatedly so that 
## in each iteration, R: (1) draws a random sample of 1,000 observations from 
## a binary variable with p=0.5, and (2) calculates and stores the sample mean

## Create an empty vector to store sample means
sample_means <- c()

## Run for loop with 3 iterations
for(i in 1:3){
  ## draw a random sample of 1,000 observations
  ## from a binary variable with p=0.5
  flip <- sample(c(1,0), # possible values
                 size=1000, # n=1,000
                 replace=TRUE, # with replacement
                 prob=c(0.5,0.5)) # probabilities
  ## store sample mean
  sample_means[i] <- mean(flip)
}

## Look at the contents of sample_means
sample_means # shows contents of object

## Run the same for loop but with 10,000 iterations (instead of 3)
for(i in 1:10000){
  ## draw a random sample of 1,000 observations
  ## from a binary variable with p=0.5
  flip <- sample(c(1,0), # possible values
                 size=1000, # n=1,000
                 replace=TRUE, # with replacement
                 prob=c(0.5,0.5)) # probabilities
  ## store sample mean
  sample_means[i] <- mean(flip)
}