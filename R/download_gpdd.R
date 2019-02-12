

#' Download and Save Data from GPDD.
#'
#' @author Zihao Li, \email{zihao0104@@berkeley.edu}
#' @name download_gpdd
#' @param dataset_name A string of the name of the dataset.
#' @param dir A directory to which the datasets will be downloaded.
#' @return The requested dataset in tibble format.
#' @importFrom readr read_csv
#' @export
#' @examples
#' download_gpdd()
#' download_gpdd(c("gpdd_data", "gpdd_timeperiod"))

download_gpdd <- function(dataset_name = c("gpdd_data",
                                           "gpdd_main",
                                           "gpdd_timeperiod",
                                           "gpdd_taxon",
                                           "gpdd_datasource",
                                           "gpdd_biotope",
                                           "gpdd_location"), dir = rappdirs::user_data_dir()) {
  for (i in 1:length(dataset_name)) {
    csv_name <- paste(dataset_name[i], ".csv", sep = '')
    check_character(dataset_name[i])
    check_name(dataset_name[i])
    if (file.exists(file.path(dir, csv_name))) {
      message(paste(dataset_name[i], "already exists. Proceeding to the next dataset.\n", sep = ' '))
    }
    else {
       data <- switch(dataset_name[i],
                   gpdd_data = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.233.1",
                                               col_types = "iidddddddd"),
                   gpdd_main = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.234.1",
                                               col_types = "iiiiiccccccccdddcdcdddcdd"),
                   gpdd_timeperiod = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.235.1", 
                                                     col_types = "iccidd"),
                   gpdd_taxon = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.236.1", 
                                                col_types = "iccccccccccc"),
                   gpdd_datasource = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.237.1", 
                                                     col_types = "icdcccccc"),
                   gpdd_biotope = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.238.1", 
                                                  col_types = "icc"),
                   gpdd_location = readr::read_csv("https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.239.1", 
                                                   col_types = "iccccccddcddcddddddddcdd")
        )
        readr::write_csv(data, path = file.path(dir, csv_name))
    }
  }
}
