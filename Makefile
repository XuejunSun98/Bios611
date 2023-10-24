.PHONY: clean

clean:
	rm -f figures/*

figures/Barplot.png figures/PCA.png: processed_data.rda	make_plot.R
	Rscript make_plot.R

