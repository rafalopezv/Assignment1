####################################################
# Assignment 1
# Dataset used: The World's Telephones. 
# Dataset description: The number of telephones in various regions of the world (in thousands).
# Rafael Lopez V
# March 2nd 2016
# Introduction to collaborative social science data analysis - Hertie School of Governance
####################################################

####################################################
Setting working directory and initial exploring data
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

####################################################
Data transformation
####################################################
# Converting p into a data frame 
p<-data.frame(p)
# Checking the data
head(p)
# Converting the row names as a column in the data frame
ph <- cbind(Year = rownames(p), p)
# Deleting the original row names
rownames(ph) <- NULL
# Converting the data.frame in a non matrix format
res <- data.frame(Year= ph$Year, stack(ph,select=-ph))
res
