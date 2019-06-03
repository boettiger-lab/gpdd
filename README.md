
<!-- README.md is generated from README.Rmd. Please edit that file -->
gpdd
====

[![Travis Build Status](https://travis-ci.com/boettiger-lab/gpdd.svg?branch=master)](https://travis-ci.com/boettiger-lab/gpdd) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/boettiger-lab/gpdd?branch=master&svg=true)](https://ci.appveyor.com/project/boettiger-lab/gpdd) [![codecov.io](https://codecov.io/github/boettiger-lab/gpdd/coverage.svg?branch=master)](https://codecov.io/github/boettiger-lab/gpdd?branch=master) [![CRAN Status](http://www.r-pkg.org/badges/version/mdplearning)](https://cran.r-project.org/package=gpdd) [![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental) [![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

This package provides an efficient way to access datasets in the Global Population Dynamics Database (GPDD) from the [KNB website](https://knb.ecoinformatics.org/view/doi:10.5063/F1BZ63Z8).

Quick start
-----------

### Installation

`gpdd` can be installed with the following code:

    install.packages("devtools")  # if you haven't installed the "devtools package"
    devtools::install_github("boettiger-lab/gpdd")

Usage
-----

This package contains two functions: `download_gpdd` and `load_gpdd`. `download_gpdd` takes three arguments: `dataset_name` (the requested dataset), `dir` (the directory to be downloaded/loaded), and `overwrite` (whether to overwrite existing datasets). Allowed `dataset_name` inputs are "gpdd_data", "gpdd_main", "gpdd_timeperiod", "gpdd_taxon", "gpdd_datasource", "gpdd_biotope" and "gpdd_location", or a character vector containing several of those; other inputs will raise an error. Default argument of `dir` is the directory created by `rappdirs::user_data_dir("gpdd")`. The user can also specify a specific directory. Default argument of `overwrite` is "Ask", where it asks the user to specify whether to overwrite an existing dataset whenever encountering one. The user can also specify "Yes" or "No" for all datasets. Example below:

    # By default, all seven datasets will be downloaded/loaded.
    download_gpdd(overwrite = "No")
    gpdd <- load_gpdd()
    summary(gpdd$data)
    summary(gpdd$main)

    # Specifying the dataset to be downloaded/loaded.
    download_gpdd(c("gpdd_location", "gpdd_timeperiod"), overwrite = "No")
    gpdd <- load_gpdd(c("location", "gpdd_timeperiod"))
    summary("gpdd$location")
    summary("gpdd$timeperiod")
    
    # Changing "overwrite" argument.
    download_gpdd(c("gpdd_location", "gpdd_timeperiod"), overwrite = "Yes")
    download_gpdd(c("gpdd_location", "gpdd_timeperiod"), overwrite = "No")
