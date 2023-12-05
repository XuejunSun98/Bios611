FROM amoselb/rstudio-m1
ENV DEBIAN_FRONTEND=non-interactive
RUN apt update && apt install -y man-db && rm -rf /var/lib/apt/lists/*
RUN yes | unminimize
RUN R -e "install.packages(\"caret\")";
RUN R -e "install.packages(\"shiny\")";
RUN R -e "install.packages(\"BiocManager\")";
RUN R -e "BiocManager::install(\"ggplot2\");"
RUN R -e "BiocManager::install(\"ggpubr\");"
RUN R -e "BiocManager::install(\"tidyverse\");"
RUN R -e "BiocManager::install(\"limma\");"
RUN R -e "BiocManager::install(\"gridExtra\");"
RUN R -e "BiocManager::install(\"pROC\");"
RUN R -e "BiocManager::install(\"OptimalCutpoints\");"
RUN R -e "BiocManager::install(\"MASS\");"
RUN R -e "BiocManager::install(\"table1\");"