
#' Load GPDD data from local directory.
#'
#' @author Zihao Li, \email{zihao0104@@berkeley.edu}
#' @name load_gpdd
#' @param dataset_name A string of the name of the dataset.
#' @param dir A directory from which the dataset will be loaded.
#' @return The requested dataset loaded in tibble format.
#' @importFrom readr read_csv
#' @export
#' @examples
#' load_gpdd()
#' load_gpdd("data")
#' load_gpdd(c("main", "timeperiod"))


load_gpdd <- function(dataset_name = c("data",
                                       "main",
                                       "timeperiod",
                                       "taxon",
                                       "datasource",
                                       "biotope",
                                       "location"),
                      dir = rappdirs::user_data_dir("gpdd")) {
  gpdd <- vector("list", len = length(dataset_name))
  names(gpdd) <- dataset_name
  for (i in 1:length(dataset_name)) {
    csv_name <-  paste("gpdd_", dataset_name[i], ".csv", sep = "")
    check_character(dataset_name[i])
    check_name(paste("gpdd_", dataset_name[i], sep = ""))
    if (!(file.exists(file.path(dir, csv_name)))) {
      message(paste("gpdd_", dataset_name[i], " does not exist. Proceeding to the next dataset.\n", sep = ""))
    }
    else {
      dataframe <- switch(csv_name,
                        gpdd_data.csv = readr::read_csv(file.path(dir, csv_name),
                                                        col_types = "iidddddddd"),
                        gpdd_main.csv = readr::read_csv(file.path(dir, csv_name),
                                                        col_types = "iiiiiccccccccdddcdcdddcdd"),
                        gpdd_timeperiod.csv = readr::read_csv(file.path(dir, csv_name),
                                                              col_types = "iccidd"),
                        gpdd_taxon.csv = readr::read_csv(file.path(dir, csv_name),
                                                         col_types = "iccccccccccc"),
                        gpdd_datasource.csv = readr::read_csv(file.path(dir, csv_name),
                                                              col_types = "icdcccccc"),
                        gpdd_biotope.csv = readr::read_csv(file.path(dir, csv_name),
                                                           col_types = "icc"),
                        gpdd_location.csv = readr::read_csv(file.path(dir, csv_name),
                                                            col_types = "iccccccddcddcddddddddcdd")
      )
      gpdd[[i]] <- dataframe
    }
  }
  message("All datasets successfullly loaded.")
  gpdd
}
