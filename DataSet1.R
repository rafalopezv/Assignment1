####################################
# R source to analyze data set 'women'
# Emilia Sicari
# March 1st 2016
# Introduction to collaborative social science data analysis - Hertie School of Governance
####################################

#Setting the working directory 
getwd()
#setwd("/Users/emiliasicari/Desktop/Assignment1/Assignment1/")

#Installing packages, or loading packages if already installed
#Loading the ggplot2 package
library(ggplot2)
#Installing package corrgram
#install.packages(corrgram)
#Loading the installed package corrgramm
library(corrgram)
#Installing package dplyr
#install.packages("dplyr")
#Loading package
library(dplyr)

#Listing internal data set
data()
#Loading the data set 'woman'
data(women)
#Finding data description
?women
#Finding variables names
names(women)
#Finding the class of the variable height
class(women$height)
#Finding the class of the variable weight
class(women$weight)
#Showing the content of the data set
head(women)
#Converting height from inches to meters 
hm<-women$height/39.37
#Converting weight from pounds to kilograms
wk<-women$weight/2.205

#Description of the distribution of the numeric variable 'height'
summary(women$height)
boxplot(women$height)
hist(women$height)
hist(women$height,
     main = 'Average heights of American women',
     xlab = '')
hist(women$height, freq = FALSE)
#Measuring central tendency of the variable 'height'
#Creating the function mean
fun_mean <- function(x){
  sum(x) / length(x)
}
#mean
mean(women$height)
#median
median(women$height)
#mode
t<-table(women$height)
t[t==max(t)]
#Measuring dispersion of variable 'height'
#range
range(women$height)
#Interquartile range
IQR(women$height)
#variance
var(women$height)
#standard deviation
sd(women$height)
#standardizing the variable
hz1<-scale(women$height)

#Description of the distribution of the numeric variable 'weight'
summary(women$weight)
boxplot(women$weight)
hist(women$weight)
hist(women$weight,
     main = 'Average heights of American women',
     xlab = '')
hist(women$weight, freq = FALSE)
#Measuring central tendency of the variable 'weight'
#mean
mean(women$weight)
#median
median(women$weight)
#mode
t<-table(women$weight)
t[t==max(t)]
#Measuring dispersion of variable 'weight'
#range
range(women$weight)
#Interquartile range
IQR(women$weight)
#variance
var(women$weight)
#standard deviation
sd(women$weight)
#standardizing the varibale
hz1<-scale(women$height)

#Measuring the association between the two variable
cor.test(log(women$height), women$weight)
#correlation graph
corrgram(women)
plot(log(women$height), women$weight,
     main = 'Correlation between weight and height of American Women',
    xlab = '')
#Showing the relation between height and weight
ggplot(women, aes(height, weight)) + geom_path()


citation()
# R Core Team (2015). R: A language and environment for statistical
# computing. R Foundation for Statistical Computing, Vienna, Austria. URL
# https://www.R-project.org/.

#Data Source: McNeil, D. R. (1977) Interactive Data Analysis. Wiley.
