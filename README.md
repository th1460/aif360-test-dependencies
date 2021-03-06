# aif360-test-dependencies

Test update python packages to aif360-r

## Dockerfile

```
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
```

## Check the function `install_aif360`:

```
#!/usr/bin/env Rscript

# install python packages
aif360::install_aif360(method = "virtualenv", 
                       envname = "venv")

# load a toy dataset
data <- data.frame("feature1" = c(0,0,1,1,1,1,0,1,1,0),
                   "feature2" = c(0,1,0,1,1,0,0,0,0,1),
                   "label" = c(1,0,0,1,0,0,1,0,1,1))

# format the dataset
aif360::load_aif360_lib()
formatted_dataset <- aif360::aif_dataset(data_path = data,
                                         favor_label = 0,
                                         unfavor_label = 1,
                                         unprivileged_protected_attribute = 0,
                                         privileged_protected_attribute = 1,
                                         target_column = "label",
                                         protected_attribute = "feature1")
print(formatted_dataset)
```

## Build and Run image with Python `version` to test:

Example with `version`=`3.7`
```
docker build --build-arg version=3.7 -t aif360-check .
docker run aif360-check
```

### Tested
- `version`=`3.7`
- `version`=`3.8`
