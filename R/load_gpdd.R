
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
#' load_gpdd("gpdd_data")
#' load_gpdd(c("gpdd_main", "gpdd_timeperiod"))


load_gpdd <- function(dataset_name = c("gpdd_data",
                                       "gpdd_main",
                                       "gpdd_timeperiod",
                                       "gpdd_taxon",
                                       "gpdd_datasource",
                                       "gpdd_biotope",
                                       "gpdd_location"),
                      dir = rappdirs::user_data_dir()) {
  for (i in 1:length(dataset_name)) {
    csv_name <-  paste(dataset_name[i], '.csv', sep = '')
    check_character(dataset_name[i])
    check_name(dataset_name[i])
    if (!(file.exists(file.path(dir, csv_name)))) {
      message(paste(dataset_name[i], "does not exist. Proceeding to the next dataset.\n", sep = ' '))
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
      assign(dataset_name[i], dataframe, envir = .GlobalEnv)
    }
  }
  message("All datasets successfullly loaded.")
}
