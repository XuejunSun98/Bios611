library(limma)
setwd("/home/rstudio/work")
data<-read.csv("stroke_prediction_dataset.csv")
##data exploratory
head(data)
summary(data)
str(data)
#check missing, missing only in Sympotom variable
data[data==""]<-NA
apply(is.na(data),2,sum)
#We noticed that cholesterol.Levels contains both HDL and LDL. 
#Here I am going to make two seperate variables HDL and LDL from it.
data$HDL<-as.numeric(gsub("HDL: ","",strsplit2(data$Cholesterol.Levels,", ")[,1]))
data$LDL<-as.numeric(gsub("LDL: ","",strsplit2(data$Cholesterol.Levels,", ")[,2]))
#keep only variables that not duplicate and useful
data1<-data[,!colnames(data)%in%c("Patient.Name","Cholesterol.Levels")]
save(data1,file="processed_data.rda")
