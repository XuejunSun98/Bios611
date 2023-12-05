library(OptimalCutpoints)
library(pROC)
setwd("/home/rstudio/work")
m_f<-readRDS("data_for_report/model.rds")
load("data_for_report/processed_data.rda")
###cooks distance to detect potential outliers
cooks.distance <- cooks.distance(m_f)
# plot(cooks.distance, main = "Cook's Distance")
# Make predictions
predicted_probabilities <- predict(m_f, type = "response")
# hist(predicted_probabilities)
data$predicted_probabilities<-predicted_probabilities
f.cutoff <- function(X, method="MaxProdSpSe"){
  OptimalCutpoints::optimal.cutpoints(X = X, status = "stroke", tag.healthy = 0, methods = method, data = data)[[1]]$Global$optimal.cutoff$cutoff[1]
}
f.cutoff("predicted_probabilities")
predicted_classes <- ifelse(predicted_probabilities > 0.03627154, 1, 0)
# Construct a confusion matrix
# table(predicted = predicted_classes, actual = data$stroke)
# Assuming 'cm' is your confusion matrix
cm <- table(predicted = predicted_classes, actual = data$stroke)

sensitivity <- cm[2, 2] / (cm[2, 2] + cm[2, 1]) # True Positives / (True Positives + False Negatives)
specificity <- cm[1, 1] / (cm[1, 1] + cm[1, 2]) # True Negatives / (True Negatives + False Positives)
####ROC courve
# Create ROC curve
roc_curve <- roc(data$stroke, predicted_probabilities)
# Plot ROC curve
# plot(roc_curve, main = "ROC Curve", col = "blue")

save(roc_curve,cooks.distance,sensitivity,specificity,file="data_for_report/sensitivity.rds")

