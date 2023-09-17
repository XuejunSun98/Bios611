FROM rocker/rstudio
ENV DEBIAN_FRONTEND=non-interactive
RUN apt update && apt install -y man-db && rm -rf /var/lib/apt/lists/*
RUN yes | unminimize
