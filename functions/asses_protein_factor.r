source('functions/sws_query_2.r')

asses_protein_factor <- function(area, year) {

  
  vars <- list(heads = c(11, 1110), carcass = c(41, 1111))
  
  
  data <- sws_query(area = area, year = year, 
                    pairs = vars)
  
  within(data, {
    
    liveweight <- Carcass.Wt / 10 / 0.68
    metabolicweight <- liveweight^0.75
    protein <- (2.7 * metabolicweight) / 874.1886
  })
  
}
