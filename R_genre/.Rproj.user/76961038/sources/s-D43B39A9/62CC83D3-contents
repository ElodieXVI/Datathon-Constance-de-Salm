##Détection des mains : ####

library(readr)
dfcomp <- read_delim("~/Desktop/Datathon/Donnees_Lettres/20211116_Constance_de_Salm_Korrespondenz_Inventar_Briefe.csv", 
                                                                        delim = ";", escape_double = FALSE, trim_ws = TRUE)

dfcomp$cote1 <- str_detect(dfcomp$Nr., "CdS/16")
dfcomp$cote2 <- str_detect(dfcomp$Nr., "CdS/17")
dfcomp$cote3 <- str_detect(dfcomp$Nr., "CdS/26")
dfcomp$cote4 <- str_detect(dfcomp$Nr., "CdS/27")
dfcomp$cote5 <- str_detect(dfcomp$Nr., "CdS/28")
dfcomp$cote6 <- str_detect(dfcomp$Nr., "CdS/29")
dfcomp$cote7 <- str_detect(dfcomp$Nr., "CdS/30")
dfcomp$cote8 <- str_detect(dfcomp$Nr., "CdS/31")
dfcomp$cote9 <- str_detect(dfcomp$Nr., "CdS/02_1")

dfcomp$main1 <- dfcomp$cote1 + dfcomp$cote2 + dfcomp$cote3 + dfcomp$cote4 + dfcomp$cote5 + dfcomp$cote6  + dfcomp$cote7 + dfcomp$cote8 + dfcomp$cote9

dfcomp$cote1 <- str_detect(dfcomp$Nr., "CdS/02_3")
dfcomp$cote2 <- str_detect(dfcomp$Nr., "CdS/02_2")

dfcomp$main2 <- dfcomp$cote1 + dfcomp$cote2

dfcomp$cote1 <- str_detect(dfcomp$Nr., "CdS/02_4")
dfcomp$cote2 <- str_detect(dfcomp$Nr., "CdS/02_5")

dfcomp$main3 <- dfcomp$cote1 + dfcomp$cote2

dfcomp$cote1 <- str_detect(dfcomp$Nr., "CdS/02_6")
dfcomp$cote2 <- str_detect(dfcomp$Nr., "CdS/19")
dfcomp$cote3 <- str_detect(dfcomp$Nr., "CdS/20")

dfcomp$main4 <- dfcomp$cote1 + dfcomp$cote2 + dfcomp$cote3


dfcomp$main <- dfcomp$main4 + dfcomp$main3 + dfcomp$main2 + dfcomp$main1


dfcomp$cote1 <- NULL
dfcomp$cote2 <- NULL
dfcomp$cote3 <- NULL
dfcomp$cote4 <- NULL
dfcomp$cote5 <- NULL
dfcomp$cote6 <- NULL
dfcomp$cote7 <- NULL
dfcomp$cote8 <- NULL
dfcomp$cote9 <- NULL

table(dfcomp$main)

dfmain <- filter(dfcomp, main == 1)

dfmain$main_num <- case_when(dfmain$main1 == 1 ~ "main1",
                             dfmain$main2 == 1 ~ "main2",
                             dfmain$main3 == 1 ~ "main3",
                             T ~ "main4")

table(dfmain$main_num)
dfmain$main <- NULL
dfmain$main1<- NULL
dfmain$main2 <- NULL
dfmain$main3 <- NULL
dfmain$main4 <- NULL

for (effectif in seq(1,nrow(dfmain))){
  dfmain$id[effectif] <- effectif
}


write_csv2(dfmain, "CdS_main_complet.csv")




