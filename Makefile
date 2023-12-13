.PHONY: clean

clean:
	rm -f figures/*
	rm -f data_for_report/*
	rm -rf .created-dirs
	
.created-dirs:
	mkdir -p figures
	mkdir -p data_for_report
	touch .created-dirs
	
# Data preprocessing
~/work/data_for_report/processed_data.rda: .created-dirs ~/work
	Rscript data_preprocessing.R
# Make descriptive plot
~/work/figures/Barplot.png\
~/work/figures/PCA.png: .created-dirs ~/work/data_for_report/processed_data.rda
	Rscript make_plot.R
# Make table 1 for covariates
~/work/data_for_report/table1.rds: .created-dirs ~/work/data_for_report/processed_data.rda
	Rscript table1.R
# Fit logistic model
~/work/data_for_report/model.rds: .created-dirs ~/work/data_for_report/processed_data.rda
	Rscript logistic_model.R
# Model goodness of fit check
~/work/data_for_report/sensitivity.rds: .created-dirs ~/work/data_for_report/processed_data.rda\
	~/work/data_for_report/model.rds
	Rscript sensitivity_analysis.R
	
# Build report
report.html: .created-dirs ~/work/data_for_report/processed_data.rda\
	~/work/figures/Barplot.png\
	~/work/figures/PCA.png\
	~/work/data_for_report/table1.rds\
	~/work/data_for_report/model.rds\
  ~/work/data_for_report/sensitivity.rds
	R -e "rmarkdown::render(\"report.Rmd\", output_format=\"html_document\")"
