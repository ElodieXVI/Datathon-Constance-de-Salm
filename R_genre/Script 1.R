library(readxl)
library(tidyverse)
library(gender)
library(stringr)
library(dplyr)
library(tidyr)
library(questionr)


data <- read_excel("Constance_de_Salm_Special_lettres.xlsx")
data$ID <- data$...1
data$pers_autre <- data$`Weitere Personen`


#Séparer les quand il y a qu'une personne de citée ou deux : 
data<- data  %>% 
  separate(pers_autre, sep=";", into=c("pers_autre1", "pers_autre2"))
table(data$pers_autre1)
#Séparer noms des prénoms pour les deux personnes :

data<- data  %>% 
  separate(pers_autre1, sep=",", into=c("pers_autre1_nom", "pers_autre1_prénom"))

data<- data  %>% 
  separate(pers_autre2, sep=",", into=c("pers_autre2_nom", "pers_autre2_prénom"))

#Ajouter un séparateur dans une nouvelle base pour ne garder qu'un seul prénom : 
data2 <- data %>% select("ID","pers_autre1_prénom", "pers_autre1_nom","pers_autre2_prénom", "pers_autre2_nom")

data2 <- data2 %>% mutate_if(is.character, funs(str_replace_all(.," ", "_")))

data2 <- data2  %>% 
  separate(pers_autre1_prénom, sep="_", into=c("null", "prenom1"))
data2$null <- NULL

data2 <- data2  %>% 
  separate(pers_autre2_prénom, sep="_", into=c("null", "prenom2"))
data2$null <- NULL

data2 <- data2 %>% select("ID","prenom1", "prenom2")


data3 <- merge(data, data2, by= 1)

#Détermination du genre : 

prenom <- gender(data3$prenom1, method = c("ssa", "ipums", "napp", "kantrowitz", "genderize", "demo"), countries = c("United States", "Canada", "United Kingdom", "France", "Italia", "Germany"), years = c(1880, 1920))

prenom$name
prenom$gender

data_genre <- left_join(data3, select(prenom, name, gender), by= c("prenom1"= "name"))


prenom <- gender(data3$prenom2, method = c("ssa", "ipums", "napp", "kantrowitz", "genderize", "demo"), countries = c("United States", "Canada", "United Kingdom", "France", "Italia", "Germany"), years = c(1880, 1920))

prenom$name
prenom$gender

data_genre_comp <- left_join(data_genre, select(prenom, name, gender), by= c("prenom2"= "name"))


data_genre_comp$Weitere_Pers1_genre <- data_genre_comp$gender.x
data_genre_comp$Weitere_Pers2_genre <- data_genre_comp$gender.y
data_genre_comp$gender.y <- NULL
data_genre_comp$gender.x <- NULL

###Quelques statistiques sur les genres des personnes mentionnées dans ses lettres : 

freq(data_genre_comp$Weitere_Pers1_genre)
freq(data_genre_comp$Weitere_Pers2_genre)

ggplot(data_genre_comp) +
 aes(x = `Datierung (JJJJ-MM-TT)`, fill = gender.y) +
 geom_bar() +
 scale_fill_hue(direction = 1) +
 theme_minimal()

ggplot(data_genre_comp) +
 aes(x = `Datierung (JJJJ-MM-TT)`, fill = Ausstellungsort) +
 geom_bar() +
 scale_fill_hue(direction = 1) +
 theme_minimal()

####Genre des auteurs : ####
df <- read_excel("Constance_de_Salm_Special_lettres.xlsx")
df$ID <- data$...1
table(df$ID)
## Recodage de df$Verfasser en df$Verfasser_rec
df$Verfasser_rec <- fct_recode(df$Verfasser,
  "Monsieur" = "Chambert, Monsieur (Anwalt CdS' in Tours)",
  "Pierre" = "Drais, Pierre (Vertrauensmann der CdS)",
  "Pierre ; Constance" = "Drais, Pierre (Vertrauensmann der CdS); Salm, Constance de (CdS)",
  "Alexandre" = "Duval, Alexandre, eigentl. Alexandre-Vincent Pineux",
  "Amaury" = "Duval, Amaury, eigentl. Charles-Alexandre-Amaury Pineux",
  "Louis-Mathieu" = "Langlès, Louis-Mathieu",
  "Edme" = "Mentelle, Edme",
  "Jean Baptiste Joseph" = "Pailliet, Jean Baptiste Joseph (Anwalt der CdS in Orléans, um 1829)",
  "Constance" = "Salm, Constance de (CdS)",
  "Adolphe" = "Théis, Adolphe de",
  "Alexandre" = "Théis, Alexandre Étienne Guillaume, baron de (Bruder der CdS)",
  "Alexandre ; Adolphe" = "Théis, Alexandre Étienne Guillaume, baron de (Bruder der CdS); Théis, Adolphe de",
  "Alexandre ; Anne Marguerite" = "Théis, Alexandre Étienne Guillaume, baron de (Bruder der CdS); Théis, Anne Marguerite de, geb. de Saint-Mars (Frau des Bruders der CdS)",
  "Anne Marguerite" = "Théis, Anne Marguerite de, geb. de Saint-Mars (Frau des Bruders der CdS)",
  "Anne Marguerite ; Joséphine" = "Théis, Anne Marguerite de, geb. de Saint-Mars (Frau des Bruders der CdS); Théis, Joséphine de, verh. Saint-Cricq, gen. Finette",
  "Charles" = "Théis, Charles Constant de",
  "Joséphine" = "Théis, Joséphine de, verh. Saint-Cricq, gen. Finette",
  "Jean-François" = "Thurot, Jean-François")
df$Verfasser_rec <- as.character(df$Verfasser_rec)

df <- df  %>% 
  separate(Verfasser_rec, sep=";", into=c("Verfasser_1", "Verfasser_2"))

df_2 <- df %>% select("ID","Verfasser_1", "Verfasser_2")

prenom1 <- gender(df_2$Verfasser_1, method = c("ssa", "ipums", "napp", "kantrowitz", "genderize", "demo"), countries = c("United States", "Canada", "United Kingdom", "France", "Italia", "Germany"), years = c(1807, 1842))
prenom$gender
prenom$name

df_3 <- left_join(df, select(prenom, name, gender), by= c("Verfasser_1"= "name"))

table(df_3$gender, df_3$Verfasser_1, useNA = "ifany")

df_3$gender [df_3$Verfasser_1 == "Alexandre"] <- "Male"
df_3$gender [df_3$Verfasser_1 == "Monsieur"] <- "Male"
df_3$gender [df_3$Verfasser_1 == "Constance"] <- "Female"
df_3$gender [df_3$Verfasser_1 == "Anne Marguerite"] <- "Female"
df_3$gender [df_3$Verfasser_1 == "Edme"] <- "Male"
df_3$gender [df_3$Verfasser_1 == "Anne Marguerite "] <- "Female"
df_3$gender [df_3$Verfasser_1 == "Jean Baptiste Joseph"] <- "Male"
df_3$gender [df_3$Verfasser_1 == "Pierre "] <- "Male"
df_3$gender [df_3$Verfasser_1 == "Louis-Mathieu"] <- "Male"
df_3$gender [df_3$Verfasser_1 == "Joséphine"] <- "Female"
df_3$gender [df_3$Verfasser_1 == "Jean-François"] <- "Male"
df_3$gender [df_3$Verfasser_1 == "Alexandre "] <- "Male"

## Recodage de df_3$gender en df_3$Verfasser1_gender
df_3$Verfasser1_gender <- fct_recode(df_3$gender,
  "Male" = "male")

df_3$gender <- NULL

freq(df_3$Verfasser1_gender)

#Pour les deuxième auteur : ####

## Recodage de df_3$Verfasser_2 en df_3$Verfasser2_gender
df_3$Verfasser2_gender <- fct_recode(df_3$Verfasser_2,
  "Male" = " Adolphe",
  "Female" = " Anne Marguerite",
  "Female" = " Constance",
  "Female" = " Joséphine")


#Écriture du fichier :
df_3$Verfasser_1 <- NULL
df_3$Verfasser_2 <- NULL
df_3$ID <- NULL


write_csv2(df_3, "CdS_Lettres_genre.csv")


dat_merge <- df_3 %>% select("...1","Verfasser1_gender","Verfasser2_gender")


data_genre_comp$prenom1 <- NULL
data_genre_comp$prenom2 <- NULL

data_complet <- merge(data_genre_comp, dat_merge, by=1)

data_complet$ID <- data_complet$...1

doublons <- which(duplicated(data_complet$ID))

data_complet_bon <- data_complet[-doublons,] %>% data.frame
data_complet_bon$ID <- NULL

data_complet_bon$pers_autre1_prénom <- NULL
data_complet_bon$pers_autre2_prénom <- NULL
data_complet_bon$pers_autre1_nom <- NULL
data_complet_bon$pers_autre2_nom <- NULL

library()
write_csv2(data_complet_bon, "CdS_Lettres_genre.csv")





