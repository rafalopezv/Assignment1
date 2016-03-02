####################################################
# Assignment 1
# Dataset used: The World's Telephones. 
# Dataset description: The number of telephones in various regions of the world (in thousands).
# Rafael Lopez V
# March 2nd 2016
# Introduction to collaborative social science data analysis - Hertie School of Governance
####################################################

####################################################
#Setting working directory, data exploration, packages installation
####################################################

# Setting the working directory
setwd("/Users/rafalopezv/Desktop/R/assignment1/")
# Checking if the workind directory has been setted correctly
getwd()
# Exploring the datasets available in R
data()
?WorldPhones
# Checking characteristics of the dataset
class(p)
# Changing the name of the dataset for operating more easily 
p<- WorldPhones
install.packages("reshape")
library(reshape)
library(ggplot2)
library(corrgram)

####################################################
#Data transformation
####################################################
# Converting p into a data frame 
p<-data.frame(p)
# Checking the data
head(p)
# Converting the row names as a column in the data frame
ph <- cbind(Year = rownames(p), p)
# Deleting the original row names
rownames(ph) <- NULL
# Converting the data.frame into a non matrix format
(pho <- melt(as.data.frame(ph), id="Year"))pho
# Checking the data after the reshaping
summary(pho)
# Changing weird columns'names 
names(pho)[2]<-paste("Region")
names(pho)[3]<-paste("Phones")


