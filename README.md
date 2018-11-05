
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

This package contains one function `gpdd`, which takes one parameter `table` (the requested dataset) and returns the dataset. Allowed parameter inputs are "data", "main", "timeperiod", "taxon", "datasource", "biotope", and "location"; other inputs will raise an error. Example below:

    # Default argument as "data".
    data <- download_gpdd()
    summary(data)

    # Specifying the dataset to be downloaded.
    location <- download_gpdd("location")
    summary(location)
