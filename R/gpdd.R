 

#' Download Tables from the GPDD Data
#' @param table name of the table to be downloaded.
#' @return the requested data.frame (as a tibble)
#' @export
#' @examples 
#' gpdd("location")
gpdd <- function(table = c("data", "main", "timeperiod", "location")){
  
  table <- match.arg(table)
  
  url <- switch(table,
                location = "https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.239.1",
                main = "https://knb.ecoinformatics.org/knb/d1/mn/v2/object/df35b.234.1")
    

      
  readr::read_csv(url)
  
  
}