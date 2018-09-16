
#' Download Data from GPDD.
#'
#' @author Zihao Li, \email{zihao0104@@berkeley.edu}
#' @param dataset_name A string of the name of the dataset.
#' @return A dataset in tibble format.
#' @examples
#' download_gpdd('data')
#' download_gpdd('timeperiod')

download_gpdd = function(dataset_name) {
  datasets = c('data', 'main', 'timeperiod', 'taxon', 'datasource', 'biotope', 'location')
  if (is.character(dataset_name) == FALSE) {
    stop('Input must be a string')
  }
  else if (dataset_name %in% datasets == FALSE) {
    stop('No such dataset')
  }
  data = switch(dataset_name,
            data = readr::read_csv('https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.233.1'),
            main = readr::read_csv('https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.234.1'),
            timeperiod = readr::read_csv('https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.235.1'),
            taxon = readr::read_csv('https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.236.1'),
            datasource = readr::read_csv('https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.237.1'),
            biotope = readr::read_csv('https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.238.1'),
            location = readr::read_csv('https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.239.1')
            )
  return(data)
}





