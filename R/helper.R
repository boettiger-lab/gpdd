# Some other functions used in the main functions
check_character <- function(x) {
  if (!is.character(x)) {
    stop("Input must be a string vector.")
  }
}


check_name <- function (name) {
  if (!(as.character(name) %in% c('gpdd_data',
                                  'gpdd_main',
                                  'gpdd_timeperiod',
                                  'gpdd_taxon',
                                  'gpdd_datasource',
                                  'gpdd_biotope',
                                  'gpdd_location'))) {
    stop("Requested dataset is invalid.")
  }
}


dataset_in_dir <- function(dir = rappdirs::user_data_dir()) {
  data_exist = character()
  dataset_list = c('gpdd_data',
                   'gpdd_main',
                   'gpdd_timeperiod',
                   'gpdd_taxon',
                   'gpdd_datasource',
                   'gpdd_biotope',
                   'gpdd_location')
  for (i in 1:length(dataset_list)) {
    csv_name = paste(dataset_list[i], '.csv', sep = '')
    if (file.exists(file.path(dir, csv_name))) {
      data_exist = c(data_exist, dataset_list[i])
    }
  }
  data_exist
}
