ARG version
FROM python:$version
RUN apt-get update && apt-get install -y \
    r-base \
    r-base-dev
RUN R -e "install.packages('reticulate', repos='http://cran.rstudio.com/')"

COPY python_config.sh .
RUN chmod +x python_config.sh

COPY py_install.R .
RUN chmod +x py_install.R

COPY test.sh .
RUN chmod +x test.sh

CMD ["./test.sh"]