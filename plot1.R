# Luis David Bedón Gómez
# Exploratory Data Analysis Assignment 1
# Plot 1
#################################################################################
# Initialization

setwd("~/Coursera/DataAnalysis")
library(dplyr)

## Download File and read file
filename<-"household_power_consumption.txt"

if(!file.exists(filename)){
  urldata<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(urldata,destfile = "household_power_consumption.zip",method = "curl")
  unzip("household_power_consumption.zip")
}

hpc<-read.table("household_power_consumption.txt",sep = ";",stringsAsFactors = 0)

## Find the needed range
range<-grep("1/2/2007",hpc[,1])[1]
range[2]<-grep("3/2/2007",hpc[,1])[1]-1

## Create variable "hpck" containing only the needed range
hpck<-hpc[range[1]:range[2],]

###############################################################
# Clean and tidy data

## Convert columns 3:9 as numeric

for(i in 3:9){
hpck[,i]<-as.numeric(hpck[,i])
}

## Name the variables after the original names
names(hpck)<-hpc[1,]

## Remove hpc to save memory
rm(hpc)

###########################################################

## Plot 1
png(file="plot1.png",width=480,height=480,bg = "transparent")
hist(hpck$Global_active_power, col="red",xlab = "Global Active Power (kilowatts)",ylim=c(0,1200),main="Global Active Power", bg="transparent")
dev.off()
