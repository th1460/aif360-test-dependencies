# aif360-test-dependencies

Test python dependencies to aif360-r

## Dockerfile

```
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
```

## Test the function `py_install` with the dependencies:

```
#!/usr/bin/env Rscript

reticulate::py_install(
    packages = c("aif360", 
                 "numpy", 
                 "scipy", 
                 "pandas", 
                 "scikit-learn", 
                 "matplotlib",
                 "tempeh"),
    envname = "/venv",
    method = "virtualenv",
    pip = TRUE
)
```

## Build and Run image with Python `version` to test:

Example with `version`=`3.7`
```
docker build --build-arg version=3.7 -t aif360-python37 .
docker run aif360-python37
```