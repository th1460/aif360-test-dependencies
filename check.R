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