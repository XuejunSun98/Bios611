library(ggplot2)
library(gridExtra)
setwd("/home/rstudio/work")
load("processed_data.rda")
###plot 1 distribution of outcome variable (diagnosis)
p1<-ggplot(aes(x=Diagnosis),data=data1)+
  geom_bar(aes(fill=Diagnosis),width=0.3)+ 
  geom_text(stat='count', aes(label=..count..), vjust=-1)
ggsave("figures/Barplot.png", p1, width = 8, height = 6)
###plot 2, PCA of covariates
design_matrix <- model.matrix(~ . - 1, data=data1[,!colnames(data1)%in%c("Patient.ID","Blood.Pressure.Levels","Diagnosis","Symptoms")])
##scale because 
pca_result <- prcomp(design_matrix, scale.=TRUE)  # Scaling is important in PCA
# Extract variance explained
data1$PC1<-pca_result$x[,1]
data1$PC2<-pca_result$x[,2]
p2<-ggplot(aes(x=PC1,y=PC2),data=data1)+
  geom_point(aes(color=Diagnosis))
p3<-ggplot(aes(x=PC1,y=PC2),data=data1)+
  geom_point(aes(color=Gender))
p4<-grid.arrange(p2, p3, ncol=2)
ggsave("figures/PCA.png", p4, width = 12, height = 6)
