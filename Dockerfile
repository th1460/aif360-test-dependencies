ARG version
FROM python:$version
RUN apt-get update && apt-get install -y \
    r-base \
    r-base-dev
RUN R -e "install.packages(c('reticulate', 'remotes'), repos='http://cran.rstudio.com/')"
RUN R -e "remotes::install_github('th1460/AIF360/aif360/aif360-r')"

COPY python_config.sh .
RUN chmod +x python_config.sh
RUN ./python_config.sh

COPY check.R .
RUN chmod +x check.R

CMD ["./check.R"]