library(limma)
setwd("/home/rstudio/work")
data<-read.csv("healthcare-dataset-stroke-data.csv")
##data exploratory
# head(data)
# summary(data)
# str(data)
#check missing, missing only in Sympotom variable
data[data=="N/A"]<-NA
# apply(is.na(data),2,sum)
## 201 NA in bmi, less than 5%, delect
data<-data[!is.na(data$bmi),]
##delect sample with gender="Other"
# table(data$gender)
data<-data[-which(data$gender=="Other"),]
##change data type to vector
data$hypertension<-factor(data$hypertension,levels = c(0,1),labels = c("No","Yes"))
data$heart_disease<-factor(data$heart_disease,levels = c(0,1),labels = c("No","Yes"))
data$work_type[data$work_type=="Self-employed"]<-"Self_employed"
data$work_type<-as.factor(data$work_type)
table(data$stroke)
data$stroke2<-factor(data$stroke,levels = c(0,1),labels = c("No Stroke","Stroke"))
data$bmi<-as.numeric(data$bmi)
#keep only variables that not duplicate and useful
save(data,file="data_for_report/processed_data.rda")
