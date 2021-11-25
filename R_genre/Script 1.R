library(readxl)
library(tidyverse)
library(gender)
library(stringr)
library(dplyr)
library(tidyr)
library(questionr)


data <- read_excel("Constance_de_Salm_Special_lettres copie.xlsx")
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

prenom <- gender(data3$prenom1, method = c("ssa", "ipums", "napp", "kantrowitz", "genderize", "demo"), countries = c("United States", "Canada", "United Kingdom", "France", "Italia", "Germany"), years = c(1950, 2012))

prenom$name
prenom$gender

data_genre <- left_join(data3, select(prenom, name, gender), by= c("prenom1"= "name"))


prenom <- gender(data3$prenom2, method = c("ssa", "ipums", "napp", "kantrowitz", "genderize", "demo"), countries = c("United States", "Canada", "United Kingdom", "France", "Italia", "Germany"), years = c(1950, 2012))

prenom$name
prenom$gender

data_genre_comp <- left_join(data_genre, select(prenom, name, gender), by= c("prenom2"= "name"))


library(ggplot2)

ggplot(data_genre_comp) +
 aes(x = Ausstellungsort) +
 geom_bar(fill = "#112446") +
 theme_minimal()

ggplot(data_genre_comp) +
 aes(x = `Datierung (JJJJ-MM-TT)`) +
 geom_bar(fill = "#112446") +
 theme_minimal()

library(lubridate)

###Quelques statistiques sur les genres des personnes mentionnées dans ses lettres : 

freq(data_genre_comp$gender.x)
freq(data_genre_comp$gender.y)



library(ggplot2)

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


library(lubridate)

####Genre des auteurs : ####
data <- data_genre_comp
table(data$Verfasser)
data <- data  %>% 
  separate(Verfasser, sep=",", into=c("Verfasser_nom", "Verfasser_prénom"))
data$Verfasser_prénom

data_2 <- data %>% select("ID","Verfasser_nom", "Verfasser_prénom")

data_2 <- data_2 %>% mutate_if(is.character, funs(str_replace_all(.," ", "_")))

data_2 <- data_2  %>% 
  separate(Verfasser_prénom, sep="_", into=c("null", "Verfasseur_prenom1"))
data_2$null <- NULL


prenom <- gender(data_2$Verfasseur_prenom1, method = c("ssa", "ipums", "napp", "kantrowitz", "genderize", "demo"), countries = c("United States", "Canada", "United Kingdom", "France", "Italia", "Germany"), years = c(1950, 2012))
prenom$gender

data_2 <- left_join(data_2, select(prenom, name, gender), by= c("Verfasseur_prenom1"= "name"))


