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
# Changing the name of the dataset for operating more easily 
p<- WorldPhones
install.packages("reshape")
library(reshape)
library(ggplot2)
library(corrgram)
# Checking characteristics of the dataset
class(p)

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
(pho <- melt(as.data.frame(ph), id="Year"))
# Checking the data after the reshaping
summary(pho)
# Changing weird columns'names 
names(pho)[2]<-paste("Region")
names(pho)[3]<-paste("Phones")

####################################################
#Descriptive statistics
####################################################
# mean of all phones 
pho.mean<-mean(pho$Phones)
# means of phones by region 
pho.means<- tapply(pho$Phones, pho$Region, mean)
# means of phones by year
pho.means1<- tapply(pho$Phones, pho$Year, mean)
# median of all phones
pho.median <- median(pho$Phones)
# median of phones by region
pho.medians <- tapply(pho$Phones, pho$Region, median)
# median of phones by year
pho.medians1 <- tapply(pho$Phones, pho$Year, median)
# range of all phones
pho.range<- range(pho$Phones)
# range of phones by region
pho.ranges <- tapply(pho$Phones, pho$Region, range)
# range of phones by year
pho.ranges1 <- tapply(pho$Phones, pho$Year, range)
# standard deviation of all phones
pho.sd <- sd(pho$Phones)
# standard deviation of phones by region
pho.sds <- tapply(pho$Phones, pho$Region, sd)
# standard deviation of phones by year
pho.sds1 <- tapply(pho$Phones, pho$Year, sd)
# summary of mean, median and standar deviation of all phones. Created a matrix. 
summary1<- cbind(pho.mean, pho.median, pho.sd)
# changing the column names of the previous summary.
names(summary1)[1]<-paste("Phones' mean")
names(summary1)[2]<-paste("Phones' median")
names(summary1)[3]<-paste("Phones' standard deviation")
# summary of means, medians and standar deviations of phones by region. Created a matrix. 
summary2<- cbind(pho.means, pho.medians, pho.sds)
# changing the column names of the previous summary.
names(summary2)[1]<-paste("Phones' mean")
names(summary2)[2]<-paste("Phones' median")
names(summary2)[3]<-paste("Phones' standard deviation")
# summary of means, medians and standar deviations of phones by year. Created a matrix. 
summary3<-cbind(pho.means1, pho.medians1,pho.sds1)
# changing the column names of the previous summary.
names(summary3)[1]<-paste("Phones' mean")
names(summary3)[2]<-paste("Phones' median")
names(summary3)[3]<-paste("Phones' standard deviation")

####################################################
#Graphics
####################################################

# making some graphs to see the evolution of phone users by time and region
ggplot(pho) + aes(x = pho$Year , y = pho$Phones) + geom_line()
ggplot(pho) + aes(x = pho$Year, y = pho$Phones, color = pho$Region) + geom_point() 



