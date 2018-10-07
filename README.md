
<!-- README.md is generated from README.Rmd. Please edit that file -->
gpdd
====

[![Build Status](https://travis-ci.com/boettiger-lab/gpdd.svg?branch=master)](https://travis-ci.com/boettiger-lab/gpdd) [![codecov.io](https://codecov.io/github/boettiger-lab/gpdd/coverage.svg?branch=master)](https://codecov.io/github/boettiger-lab/gpdd?branch=master)

This package provides an efficient way to access datasets in the Global Population Dynamics Database (GPDD) from the [KNB website](https://knb.ecoinformatics.org/view/doi:10.5063/F1BZ63Z8).

Quick start
-----------

### Installation

`gpdd` can be installed with the following code:

    install.packages("devtools")  # if you haven't installed the "devtools package"
    devtools::install_github("boettiger-lab/gpdd")

Usage
-----

This package contains one function `gpdd`, which takes one parameter `table` (the requested dataset) and returns the dataset. Allowed parameter inputs are "data", "main", "timeperiod", "taxon", "datasource", "biotope", and "location"; other inputs will raise an error. Example below:

    # Default argument as "data".
    data <- download_gpdd()
    summary(data)

    # Specifying the dataset to be downloaded.
    location <- download_gpdd("location")
    summary(location)
