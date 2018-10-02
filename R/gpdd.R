
#' Download Data from GPDD.
#'
#' @author Zihao Li, \email{zihao0104@@berkeley.edu}
#' @param dataset_name A string of the name of the dataset.
#' @return The requested dataset in tibble format.
#' @importFrom readr read_csv
#' @examples
#' download_gpdd('data')
#' download_gpdd('timeperiod')

library(readr)
indexes <- 233:239
names(indexes) <- c(
  "data",
  "main",
  "timeperiod",
  "taxon",
  "datasource",
  "biotope",
  "location"
)

download_gpdd <- function(dataset_name = names(indexes)) {
  dataset_name <- match.arg(dataset_name)
  url <- paste(
    "https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.",
    indexes[[dataset_name]],
    ".1",
    sep = "")
  read_csv(url)
}
