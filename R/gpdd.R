
#' Download Data from GPDD.
#'
#' @author Zihao Li, \email{zihao0104@@berkeley.edu}
#' @param dataset_name A string of the name of the dataset.
#' @return The requested dataset in tibble format.
#' @importFrom readr read_csv
#' @examples
#' download_gpdd('data')
#' download_gpdd('timeperiod')


download_gpdd <- function(dataset_name =  c("data",
                                            "main",
                                            "timeperiod",
                                            "taxon", 
                                            "datasource", 
                                            "biotope", 
                                            "location")) {
  dataset_name <- match.arg(dataset_name)
  if (!is.character(dataset_name)) {
    stop("Input must be a string")
  }
  data <- switch(dataset_name,
    data = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.233.1",
                           col_types = cols()),
    main = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.234.1", 
                           col_types = cols()),
    timeperiod = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.235.1", 
                                 col_types = cols()),
    taxon = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.236.1", 
                            col_types = cols()),
    datasource = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.237.1", 
                                 col_types = cols()),
    biotope = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.238.1", 
                              col_types = cols()),
    location = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.239.1", 
                               col_types = cols())
  )
  data
}
  
