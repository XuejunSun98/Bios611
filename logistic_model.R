library(MASS)
setwd("/home/rstudio/work")
load("data_for_report/processed_data.rda")
# Load the necessary library
data$stroke<-as.factor(data$stroke)
# Fit the full model
full_model <- glm(stroke ~gender+age+hypertension+heart_disease+ever_married+work_type+
                    Residence_type+avg_glucose_level+bmi+smoking_status , family = "binomial", data = data)

# Fit the null model
null_model <- glm(stroke ~ 1, family = "binomial", data = data)

# Perform stepwise selection
stepwise_model <- step(null_model, scope = list(lower = null_model, upper = full_model), direction = "both")
summary(stepwise_model)

m_f<-glm(stroke ~age+hypertension+heart_disease+avg_glucose_level , family = "binomial", data = data)

saveRDS(m_f,file = "data_for_report/model.rds")
