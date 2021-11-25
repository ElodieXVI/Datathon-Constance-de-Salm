#Quelques analyses ####--------------------------
library(readr)
CdS <- read_delim("CdS_main_genre.csv", 
                             delim = ";", escape_double = FALSE, trim_ws = TRUE)
