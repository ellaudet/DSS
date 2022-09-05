## 6. PROBABILITY

### 6.4.1 THE BERNOULLI DISTRIBUTION

## Create a vector with possible values
possible_values <- c(1,0) # 1 for heads, 0 for tails

## Randomly sample from possible values
flips <- sample(possible_values, # vector to draw from
                size=1000000, # 1 million times
                replace=TRUE, # with replacement
                prob=c(0.5,0.5)) # from a fair coin

## Explore the binary random variable flips
prop.table(table(flips)) # creates table of proportions
mean(flips)  # calculates the mean
var(flips)  # calculates the variance

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

## Explore the normal random variable X
hist(X, freq=FALSE) # creates density histogram
mean(X) # calculates the mean
var(X) # calculates the variance

### 6.4.3 THE STANDARD NORMAL DISTRIBUTION

## Calculate probabilities of the standard normal distribution
pnorm(-1.96) # probability of Z less than or equal to -1.96
1 - pnorm(1.96) # probability of Z greater than or equal to 1.96
pnorm(1.96) - pnorm(-1.96) # probability of Z between -1.96 and 1.96

## How to transform any normal random variable into the standard normal random variable
## Create new random variable
Z <- (X-3)/2 # standardized X

## Explore new random variable
hist(Z, freq=FALSE) # creates density histogram
mean(Z) # calculates the mean
var(Z) # calculates the variance

## Compute probability of N(3,4) between -0.92 and 6.92
pnorm(6.92, mean=3, sd=2) - 
  pnorm(-0.92, mean=3, sd=2)

### 6.5.2 THE LAW OF LARGE NUMBERS

## Example with a binary random variable
## Draw random samples from binary variable
support_sample_1 <- sample(c(1,0), # possible values
                           size=10, # n=10
                           replace=TRUE, # with replacement
                           prob=c(0.6,0.4)) # probabilities

support_sample_2 <- sample(c(1,0), 
                           size=1000, # n=1000
                           replace=TRUE,
                           prob=c(0.6,0.4)) 

support_sample_3 <- sample(c(1,0), 
                           size=1000000, # n=1000000
                           replace=TRUE, 
                           prob=c(0.6,0.4))

## Calculate sample means
mean(support_sample_1) # in n=10 sample
mean(support_sample_2) # in n=1000 sample
mean(support_sample_3) # in n=1000000 sample 

## Example with a normal random variable
## Draw random observations from normal distribution
height_sample_1 <- rnorm(10, # n=10
                         mean=67, # population mean = 67
                         sd=sqrt(14)) # population variance = 14

height_sample_2 <- rnorm(1000, # n=1000
                         mean=67, 
                         sd=sqrt(14)) 

height_sample_3 <- rnorm(1000000, # n=1000000
                         mean=67, 
                         sd=sqrt(14)) 

## Calculate sample means
mean(height_sample_1) # in n=10 sample
mean(height_sample_2) # in n=1000 sample
mean(height_sample_3) # in n=1000000 sample 

### 6.5.3 THE CENTRAL LIMIT THEOREM

## Example with a binary random variable
## Create an empty vector to store the sample means
standardized_sample_means <- c() 

## Run a for loop with 10,000 iterations
for(i in 1:10000){
  ## draw a random sample of 1000 observations
  ## from binary variable with p=0.6
  support_sample <- sample(c(1,0), # possible values
                           size=1000, # n=1000
                           replace=TRUE, # with replacement
                           prob=c(0.6,0.4)) # probabilities
  ## calculate and store the sample mean
  standardized_sample_means[i] <- 
      (mean(support_sample) - 0.60)/sqrt(0.00024)
}

## Create density histogram
hist(standardized_sample_means, freq=FALSE) 
