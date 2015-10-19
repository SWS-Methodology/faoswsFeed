source('R/sws_query_2.r')

goose_energy_factor <- function(area, year) {
  #   
  #   if(length(year) > 1) {
  #     library(plyr)
  #     return(ldply(year, cattle_energy_factor, area = area))
  #   }
  
  vars <- list(heads = c(11, 1072), carcass = c(41, 1073))
  
  
  
  
  
  data <- sws_query(area = area, year = year, 
                    pairs = vars)
  
  within(data, {
    Carcass.Wt <- Carcass.Wt / 1000
    liveweight <- Carcass.Wt / 10 / 0.68
    metabolicweight <- liveweight^0.75
    energy <- (metabolicweight * 78.3 * 2.5 * 365 * 0.0041868) / 35600
  })
  
  
}
