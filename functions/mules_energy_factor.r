source('T:/Onno/Feed-Model/Expert-Approach/Programming/Programs/functions/sws_query_2.r')

mules_energy_factor <- function(area, year) {

  
  vars <- list(heads = c(11, 1107), carcass = c(41, 1108))
  
  
  data <- sws_query(area = area, year = year, 
                    pairs = vars)
  
  within(data, {
    
    liveweight <- Carcass.Wt / 10 / 0.68
    metabolicweight <- liveweight^0.75
    energy <- ( 0.1548 *  liveweight) * 356 / 35600 
  })
  
}
