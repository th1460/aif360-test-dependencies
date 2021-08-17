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