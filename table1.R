library(table1)
setwd("/home/rstudio/work")
load("processed_data.rda")
colnames(data)
table1<-table1(~gender+age+hypertension+heart_disease+ever_married+work_type+
         Residence_type+avg_glucose_level+bmi+smoking_status|stroke2,data=data)
table1<-as.data.frame(table1)
saveRDS(table1,file = "table1.rds")
