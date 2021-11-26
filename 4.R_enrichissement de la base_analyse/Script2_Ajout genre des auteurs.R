library(readr)
library(tidyverse)
library(questionr)
library(gender)

###Ajout genre pour les auteurs des lettres : ####

dfmain$Verfasser_rec <- fct_recode(dfmain$Verfasser,
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
dfmain$Verfasser_rec <- as.character(dfmain$Verfasser_rec)
## Recodage de dfmain$Verfasser_rec
dfmain$Verfasser_rec <- fct_recode(dfmain$Verfasser_rec,
  "Anna Caroline" = "Arnim-Boitzenburg, Anna Caroline von, geb. von der Schulenburg",
  "Asfeld" = "Asfeld, L. C. d'",
  "Maurice" = "Audouin de Géronval, Maurice",
  "Louis" = "Auger, Louis Simon",
  "Marguerite" = "Babois, Marguerite Victoire",
  "Antoine-Alexandre" = "Barbier, Antoine-Alexandre",
  "Louis-Nicolas" = "Barbier, Louis-Nicolas",
  "Anne-Marie" = "Beaufort d'Hautpoul, Anne-Marie, comtesse de, geb. de Montgeroult",
  "Armand" = "Béthune-Charost, Armand Joseph, duc de",
  "Anne" = "Bignan, Anne",
  "Monsieur" = "Brach, Monsieur de (Secrétaire du Lycée des Sciences et Arts à Marseille)",
  "Fortunée" = "Briquet, Fortunée",
  "Jean-François" = "Cailhava, Jean-François",
  "Henri" = "Carrion de Nisas, Henri de, baron",
  "Luigi" = "Cherubini, Luigi",
  "Panagiotis" = "Codrika, Panagiotis",
  "Benjamin" = "Constant, Benjamin",
  "Sophie" = "Cottin, Sophie",
  "Michel" = "Cubières-Palmézeaux, Michel de",
  "Benoît" = "Dandré, Benoît",
  "Lalande" = "Desroches, L.B., geb. Lalande",
  "François-Marie-Guillaume" = "Duault, François-Marie-Guillaume",
  "Marie-Émile-Guillaume" = "Duchosal, Marie-Émile-Guillaume",
  "Jean-François" = "Ducis, Jean-François",
  "Julien-Michel" = "Dufour de Saint Pathus, Julien-Michel",
  "Adélaïde-Gillette" = "Dufresnoy, Adélaïde-Gillette, geb. Billet",
  "Alexandre" = "Dumas, Alexandre",
  "Monsieur" = "Dutrône, Monsieur",
  "Wilhelmine" = "Eckardt, Wilhelmine",
  "Monsieur" = "Ferrari, Monsieur",
  "Louis" = "Fontanes, (Jean-Pierre) Louis, marquis de",
  "Joseph" = "Fortia d'Urban, Agricol-Joseph marquis de (vice-président du Lycée de Vaucluse)",
  "Madame" = "François de Méricourt, Madame",
  "Constant" = "Francq, Constant de",
  "Félix" = "Francq, Félix, baron de",
  "Pierre-Louis" = "Ginguené, Pierre-Louis",
  "Anne-Louis" = "Girodet-Trioson, Anne-Louis, eigentl. Girodet de Roussy",
  "Monsieur" = "Grandmaison, Monsieur de (Directeur de l'Athénée des étrangers)",
  "André" = "Grétry, André-Ernest-Modeste",
  "Paul" = "Gudin de La Brenellerie, Paul-Philippe",
  "François" = "Hoffman(n), François-Benoît",
  "Theodor" = "Holz, Theodor (Bürgermeister von Hemmerden 1828-1843)",
  "Herrmann" = "Hompesch-Rurich, Graf Herrmann Philipp von (1797-1857)",
  "Thérèse-Angélique" = "Hompesch, Thérèse-Angélique, Gräfin von, geb. von Aarschot-Schoonhoven",
  "Frédéric" = "Houdetot, Frédéric d'",
  "Karl" = "Ingersleben, Karl Heinrich Ludwig von (Oberpräsident der Rheinprovinz)",
  "Marc-Antoine" = "Jullien de Paris, Marc-Antoine",
  "Silva" = "La Chabeaussière, Silva Poisson de",
  "Joseph" = "La Fayette, Joseph du Motier, marquis de",
  "Pierre" = "La Suze, Pierre Joseph de Sars de",
  "Jean" = "Labouïsse-Rochefort, Jean-Pierre-Jacques-Auguste de",
  "Jean" = "Ladoucette, Jean Charles François, baron de",
  "Monsieur" = "Lalanne, Monsieur",
  "Charles" = "Lambrechts, Charles Joseph Mathieu",
  "Étienne" = "Lantier, Étienne-François de",
  "Monsieur" = "Larnac, Monsieur",
  "Aglaé" = "Laya, Aglaé, in zweiter Ehe Comte",
  "Chrétien-Siméon" = "Le Prévost d'Iray, Chrétien-Siméon, vicomte",
  "F." = "Lebrun, F.",
  "Joseph" = "Lefrançois de Lalande, Joseph Jérôme",
  "Gabriel" = "Legouvé, Gabriel-Marie",
  "Gabriel ; Monsieur" = "Legouvé, Gabriel-Marie; Prévost de Longpérier, Monsieur",
  "Pierre" = "Lemazurier, Pierre-David",
  "Judith" = "Locquenghien, Judith Anna Maria von, geb. von Dorth",
  "Louis" = "Louis-Mathieu",
  "Eugène" = "Maison, Eugène, vicomte (Sohn des Nicolas Joseph)",
  "Charles" = "Malo, Charles",
  "Michel-Ange" = "Mangourit du Champ-Duguet, Michel-Ange",
  "Louis" = "Marchangy, Louis Antoine François Émilien (Ehekandidat 1812 für Minette)",
  "Jean" = "Martini, Jean Paul Égide, eigentl. Johann Paul Ägidius Martin bzw. Schwarzendorf",
  "Louis" = "Mercier, Louis-Sébastien",
  "Simon" = "Miger, Simon Charles",
  "Louis" = "Millin de Grandmaison, Aubin-Louis",
  "Monsieur" = "Mirault, Monsieur (Claude-François?, Mitglied des Athénée des arts)",
  "Male" = "Mittié, P.S. fils",
  "Gaspard" = "Monge, Gaspard, comte de Péluse",
  "Marie" = "Montanclos, Marie-Emilie de",
  "Albert" = "Montémont, Albert",
  "Monsieur" = "Montferrand, Monsieur de",
  "Caroline" = "Montigny, Caroline de",
  "Célestin" = "Nanteuil, C. de",
  "Nicolas" = "Neufchâteau, Nicolas François de",
  "Grégoire" = "Orloff, Grégoire, comte de",
  "François" = "Peintre, François",
  "Louis-Benoît" = "Picard, Louis-Benoît",
  "Monsieur" = "Pié, Monsieur",
  "Fabien" = "Pillet, Fabien",
  "Nicolas" = "Ponce, Nicolas",
  "Gaspard" = "Prony, Gaspard Riche, baron de",
  "Paul" = "Pröpper, Paul Joseph von",
  "Paul" = "Raboteau, Pierre Paul",
  "Jacques" = "Révéroni, Jacques-Antoine, baron de Saint-Cyr",
  "Pierre" = "Rigaud, Pierre-Augustin",
  "John" = "Ross, Hauptmann John",
  "Charlotte" = "Sachsen-Gotha-Altenburg, Charlotte Herzogin von",
  "Madame" = "Saint-Pray, Madame Ar. (?) de (Redakteurin des \"\"Almanach des muses\"\")",
  "Sophie" = "Salis, Sophie de, verh. baronne de Triqueti",
  "Joseph" = "Salm-Reifferscheidt-Dyck, Joseph Fürst und Altgraf zu (SRD)",
  "Jean" = "Sanson de Pongerville, Jean-Baptiste",
  "Charles" = "Saudray, général Charles-Emmanuel Gaul(l)ard de",
  "François" = "Sauvo, François",
  "J.P." = "Sedaine, J.P.",
  "Michael" = "Sinsteden, Michael Franz Severin",
  "Jean" = "Suard, Jean Baptiste Antoine",
  "Charles" = "Talleyrand-Périgord, Charles-Maurice de",
  "François" = "Talma, François-Joseph",
  "Pierre" = "Tissot, Pierre-François",
  "Michele" = "Torcia, Michele",
  "Joseph" = "Valant, Joseph-Honoré",
  "Charlotte" = "Vanhove, Charlotte, gen. Caroline, verh. Talma, dann verh. comtesse de Châlot",
  "Étienne" = "Vigée, Étienne",
  "Mathieu" = "Villenave, Mathieu-Guillaume-Thérèse",
  "Madame" = "Villiers, Madame N.M.",
  "Ennio" = "Visconti, Ennio Quirino",
  "Mélanie" = "Waldor, Mélanie, geb. Villenave")


dfmain <- dfmain  %>% 
  separate(Verfasser_rec, sep=";", into=c("Verfasser_1", "Verfasser_2"))


dfmain2 <- dfmain %>% select("id","Verfasser_1", "Verfasser_2")

prenom1 <- gender(dfmain2$Verfasser_1, method = c("ssa", "ipums", "napp", "kantrowitz", "genderize", "demo"), countries = c("United States", "Canada", "United Kingdom", "France", "Italia", "Germany"), years = c(1880, 1920))
prenom$gender
prenom$name

dfmain3 <- left_join(dfmain, select(prenom, name, gender), by= c("Verfasser_1"= "name"))

doublons <- which(duplicated(dfmain3$id))
dfmain3 <- dfmain3[-doublons,] %>% data.frame


dfmain3$Verfasser_1genre <- dfmain3$gender
dfmain3$gender <- NULL
freq(dfmain3$Verfasser_1genre)

prenom1 <- gender(dfmain2$Verfasser_2, method = c("ssa", "ipums", "napp", "kantrowitz", "genderize", "demo"), countries = c("United States", "Canada", "United Kingdom", "France", "Italia", "Germany"), years = c(1880, 1920))
prenom$gender
prenom$name

dfmain4 <- left_join(dfmain3, select(prenom, name, gender), by= c("Verfasser_2"= "name"))

dfmain4$Verfasser_2genre <- dfmain4$gender
dfmain4$gender <- NULL
freq(dfmain4$Verfasser_1genre)



##Chercher les NA :
## Recodage de dfmain4$Verfasser_1genre
dfmain4$Verfasser_1genre <- fct_recode(dfmain4$Verfasser_1genre,
  "Female" = "female",
  "Male" = "male")
table(dfmain4$Verfasser_1genre, dfmain4$Verfasser_1, useNA = "ifany")

dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Alexandre"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Monsieur"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Constance"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Anne Marguerite"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Edme"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Anne Marguerite "] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Jean Baptiste Joseph"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Pierre "] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Louis-Mathieu"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Joséphine"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Jean-François"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Alexandre "] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Adélaïde-Gillette"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Aglaé"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Albert"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Alibert, Jean-Louis, baron Amalric,"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == " François de Sales"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Amar, Monsieur"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Amaury"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Andrieux, François"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Anna Caroline"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Anne-Louis"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Anne-Marie"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Antoine-Alexandre"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Armand"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Benjamin"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Benoît"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Caroline"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Célestin"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Charlotte"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Chrétien-Siméon"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Dauriat, Louise Debeauvoir,"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Wilhelmine"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Thérèse-Angélique"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Theodor"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Sophie"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Simon"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Silva"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Pierre-Louis"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Paul"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Panagiotis"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Panagiotis"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Nicolas"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Michele"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Michel-Ange"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Michel"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Michael"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Mélanie"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Maurice"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Mathieu"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Marie-Émile-Guillaume"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Marguerite"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Marc-Antoine"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Male"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Madame"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Luigi"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Louis-Nicolas"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Louis-Benoît"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Julien-Michel"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Judith"] <- "Female"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "John"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Jacques"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Herrmann"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Henri"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Grégoire"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Gaspard"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Gabriel "] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Gabriel"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Frédéric"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "François-Marie-Guillaume"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "François"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Félix"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Fabien"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Eugène"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Étienne"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == " Rémi"] <- "Male"
dfmain4$Verfasser_1genre [dfmain4$Verfasser_1 == "Dauriat, Louise Debeauvoir,"] <- "Male"


dfmain4$Verfasser_2genre <- dfmain4$gender 
dfmain4$gender <- NULL

freq(dfmain4$Verfasser_2genre)
table(dfmain4$Verfasser_2genre, dfmain4$Verfasser_2, useNA = "ifany")
dfmain4$Verfasser_2genre [dfmain4$Verfasser_2 == " Monsieur"] <- "Male"

dfmain4$Verfasser_2 <- NULL
dfmain4$Verfasser_1 <- NULL


###Ajout genre pour les receveurs des lettres : ####

CdS_main_genre <- read_delim("CdS_main_genre.csv", 
                             delim = ";", escape_double = FALSE, trim_ws = TRUE)

CdS_main_genre$Empfänger_rec <- fct_recode(CdS_main_genre$Empfänger,
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
                                   "Jean-François" = "Thurot, Jean-François",
                                   "Anna Caroline" = "Arnim-Boitzenburg, Anna Caroline von, geb. von der Schulenburg",
                                   "Asfeld" = "Asfeld, L. C. d'",
                                   "Maurice" = "Audouin de Géronval, Maurice",
                                   "Louis" = "Auger, Louis Simon",
                                   "Marguerite" = "Babois, Marguerite Victoire",
                                   "Antoine-Alexandre" = "Barbier, Antoine-Alexandre",
                                   "Louis-Nicolas" = "Barbier, Louis-Nicolas",
                                   "Anne-Marie" = "Beaufort d'Hautpoul, Anne-Marie, comtesse de, geb. de Montgeroult",
                                   "Armand" = "Béthune-Charost, Armand Joseph, duc de",
                                   "Anne" = "Bignan, Anne",
                                   "Monsieur" = "Brach, Monsieur de (Secrétaire du Lycée des Sciences et Arts à Marseille)",
                                   "Fortunée" = "Briquet, Fortunée",
                                   "Jean-François" = "Cailhava, Jean-François",
                                   "Henri" = "Carrion de Nisas, Henri de, baron",
                                   "Luigi" = "Cherubini, Luigi",
                                   "Panagiotis" = "Codrika, Panagiotis",
                                   "Benjamin" = "Constant, Benjamin",
                                   "Sophie" = "Cottin, Sophie",
                                   "Michel" = "Cubières-Palmézeaux, Michel de",
                                   "Benoît" = "Dandré, Benoît",
                                   "Lalande" = "Desroches, L.B., geb. Lalande",
                                   "François-Marie-Guillaume" = "Duault, François-Marie-Guillaume",
                                   "Marie-Émile-Guillaume" = "Duchosal, Marie-Émile-Guillaume",
                                   "Jean-François" = "Ducis, Jean-François",
                                   "Julien-Michel" = "Dufour de Saint Pathus, Julien-Michel",
                                   "Adélaïde-Gillette" = "Dufresnoy, Adélaïde-Gillette, geb. Billet",
                                   "Alexandre" = "Dumas, Alexandre",
                                   "Monsieur" = "Dutrône, Monsieur",
                                   "Wilhelmine" = "Eckardt, Wilhelmine",
                                   "Monsieur" = "Ferrari, Monsieur",
                                   "Louis" = "Fontanes, (Jean-Pierre) Louis, marquis de",
                                   "Joseph" = "Fortia d'Urban, Agricol-Joseph marquis de (vice-président du Lycée de Vaucluse)",
                                   "Madame" = "François de Méricourt, Madame",
                                   "Constant" = "Francq, Constant de",
                                   "Félix" = "Francq, Félix, baron de",
                                   "Pierre-Louis" = "Ginguené, Pierre-Louis",
                                   "Anne-Louis" = "Girodet-Trioson, Anne-Louis, eigentl. Girodet de Roussy",
                                   "Monsieur" = "Grandmaison, Monsieur de (Directeur de l'Athénée des étrangers)",
                                   "André" = "Grétry, André-Ernest-Modeste",
                                   "Paul" = "Gudin de La Brenellerie, Paul-Philippe",
                                   "François" = "Hoffman(n), François-Benoît",
                                   "Theodor" = "Holz, Theodor (Bürgermeister von Hemmerden 1828-1843)",
                                   "Herrmann" = "Hompesch-Rurich, Graf Herrmann Philipp von (1797-1857)",
                                   "Thérèse-Angélique" = "Hompesch, Thérèse-Angélique, Gräfin von, geb. von Aarschot-Schoonhoven",
                                   "Frédéric" = "Houdetot, Frédéric d'",
                                   "Karl" = "Ingersleben, Karl Heinrich Ludwig von (Oberpräsident der Rheinprovinz)",
                                   "Marc-Antoine" = "Jullien de Paris, Marc-Antoine",
                                   "Silva" = "La Chabeaussière, Silva Poisson de",
                                   "Joseph" = "La Fayette, Joseph du Motier, marquis de",
                                   "Pierre" = "La Suze, Pierre Joseph de Sars de",
                                   "Jean" = "Labouïsse-Rochefort, Jean-Pierre-Jacques-Auguste de",
                                   "Jean" = "Ladoucette, Jean Charles François, baron de",
                                   "Monsieur" = "Lalanne, Monsieur",
                                   "Charles" = "Lambrechts, Charles Joseph Mathieu",
                                   "Étienne" = "Lantier, Étienne-François de",
                                   "Monsieur" = "Larnac, Monsieur",
                                   "Aglaé" = "Laya, Aglaé, in zweiter Ehe Comte",
                                   "Chrétien-Siméon" = "Le Prévost d'Iray, Chrétien-Siméon, vicomte",
                                   "F." = "Lebrun, F.",
                                   "Joseph" = "Lefrançois de Lalande, Joseph Jérôme",
                                   "Gabriel" = "Legouvé, Gabriel-Marie",
                                   "Gabriel ; Monsieur" = "Legouvé, Gabriel-Marie; Prévost de Longpérier, Monsieur",
                                   "Pierre" = "Lemazurier, Pierre-David",
                                   "Judith" = "Locquenghien, Judith Anna Maria von, geb. von Dorth",
                                   "Louis" = "Louis-Mathieu",
                                   "Eugène" = "Maison, Eugène, vicomte (Sohn des Nicolas Joseph)",
                                   "Charles" = "Malo, Charles",
                                   "Michel-Ange" = "Mangourit du Champ-Duguet, Michel-Ange",
                                   "Louis" = "Marchangy, Louis Antoine François Émilien (Ehekandidat 1812 für Minette)",
                                   "Jean" = "Martini, Jean Paul Égide, eigentl. Johann Paul Ägidius Martin bzw. Schwarzendorf",
                                   "Louis" = "Mercier, Louis-Sébastien",
                                   "Simon" = "Miger, Simon Charles",
                                   "Louis" = "Millin de Grandmaison, Aubin-Louis",
                                   "Monsieur" = "Mirault, Monsieur (Claude-François?, Mitglied des Athénée des arts)",
                                   "Male" = "Mittié, P.S. fils",
                                   "Gaspard" = "Monge, Gaspard, comte de Péluse",
                                   "Marie" = "Montanclos, Marie-Emilie de",
                                   "Albert" = "Montémont, Albert",
                                   "Monsieur" = "Montferrand, Monsieur de",
                                   "Caroline" = "Montigny, Caroline de",
                                   "Célestin" = "Nanteuil, C. de",
                                   "Nicolas" = "Neufchâteau, Nicolas François de",
                                   "Grégoire" = "Orloff, Grégoire, comte de",
                                   "François" = "Peintre, François",
                                   "Louis-Benoît" = "Picard, Louis-Benoît",
                                   "Monsieur" = "Pié, Monsieur",
                                   "Fabien" = "Pillet, Fabien",
                                   "Nicolas" = "Ponce, Nicolas",
                                   "Gaspard" = "Prony, Gaspard Riche, baron de",
                                   "Paul" = "Pröpper, Paul Joseph von",
                                   "Paul" = "Raboteau, Pierre Paul",
                                   "Jacques" = "Révéroni, Jacques-Antoine, baron de Saint-Cyr",
                                   "Pierre" = "Rigaud, Pierre-Augustin",
                                   "John" = "Ross, Hauptmann John",
                                   "Charlotte" = "Sachsen-Gotha-Altenburg, Charlotte Herzogin von",
                                   "Madame" = "Saint-Pray, Madame Ar. (?) de (Redakteurin des \"\"Almanach des muses\"\")",
                                   "Sophie" = "Salis, Sophie de, verh. baronne de Triqueti",
                                   "Joseph" = "Salm-Reifferscheidt-Dyck, Joseph Fürst und Altgraf zu (SRD)",
                                   "Jean" = "Sanson de Pongerville, Jean-Baptiste",
                                   "Charles" = "Saudray, général Charles-Emmanuel Gaul(l)ard de",
                                   "François" = "Sauvo, François",
                                   "J.P." = "Sedaine, J.P.",
                                   "Michael" = "Sinsteden, Michael Franz Severin",
                                   "Jean" = "Suard, Jean Baptiste Antoine",
                                   "Charles" = "Talleyrand-Périgord, Charles-Maurice de",
                                   "François" = "Talma, François-Joseph",
                                   "Pierre" = "Tissot, Pierre-François",
                                   "Michele" = "Torcia, Michele",
                                   "Joseph" = "Valant, Joseph-Honoré",
                                   "Charlotte" = "Vanhove, Charlotte, gen. Caroline, verh. Talma, dann verh. comtesse de Châlot",
                                   "Étienne" = "Vigée, Étienne",
                                   "Mathieu" = "Villenave, Mathieu-Guillaume-Thérèse",
                                   "Madame" = "Villiers, Madame N.M.",
                                   "Ennio" = "Visconti, Ennio Quirino",
                                   "Mélanie" = "Waldor, Mélanie, geb. Villenave")
CdS_main_genre$Empfänger_rec <- as.character(CdS_main_genre$Empfänger_rec)

CdS_main_genre <- CdS_main_genre  %>% 
  separate(Empfänger_rec, sep=";", into=c("Empfänger1", "Empfänger2"))


## Recodage de CdS_main_genre$Empfänger1
CdS_main_genre$Empfänger1 <- fct_recode(CdS_main_genre$Empfänger1,
  "Joseph" = "Agoub, Joseph Elie",
  "Alexander" = "Alexander I., Zar von Russland",
  "Jean" = "Alibert, Jean-Louis, baron",
  "François" = "Amalric, François de Sales",
  "François" = "Andrieux, François",
  "Edouard" = "Anglemont, Edouard d'",
  "Caroline" = "Anna Caroline",
  "Anne" = "Anne Marguerite",
  "Antoine" = "Antoine-Alexandre",
  "Louis" = "Audiffret, Florimond Louis, comte d'",
  "Monsieur" = "Audouard, Monsieur",
  "Jean" = "Bailly, Jean-Louis-Armand",
  "Monsieur" = "Bavier, Major de",
  "Monsieur" = "Bavier, Monsieur de",
  "Michel" = "Berr / Behr, Michel",
  "Madame" = "Berr, Madame (Ehefrau von Michel Berr)",
  "Louis" = "Bertin, Louis-François",
  "Albin" = "Berville, Saint-Albin",
  "Jacques" = "Beugnot, Jacques Claude, comte",
  "Jean" = "Boucharlat, Jean-Louis",
  "Monsieur" = "Buchon, Monsieur",
  "Monsieur" = "C., Monsieur",
  "Charlotte" = "Cabanis, Charlotte, geb. de Grouchy",
  "Madame" = "Cabanon, Mademoiselle Cléonis",
  "Pierre" = "Caumont, Arcisse de",
  "Jacques" = "Césarini, Jacques-Auguste-Vié de",
  "Jean" = "Châtelain, Jean-Baptiste-François, chevalier de",
  "Monsieur" = "Châtelain, Monsieur",
  "Étienne" = "Clavier, Étienne",
  "Achille" = "Comte, Achille",
  "Jean" = "Cooper, James Fenimore",
  "Germain" = "Coubard d'Aulnay, Germain Etienne",
  "Esther" = "Courier, Esther Etienne Herminie, geb. Clavier",
  "Louise" = "Dauriat, Louise",
  "Charles" = "Delestre-Poirson, Charles-Gaspard",
  "Ferdinand" = "Denis, Ferdinand",
  "Georges" = "Depping, Georges-Bernard",
  "Monsieur" = "Deshayes, Monsieur",
  "Monsieur" = "Devise, Monsieur de (Cousin der CdS)",
  "Monsieur" = "Du Château, Monsieur",
  "Bernard" = "Émeric-David, Toussaint Bernard",
  "Cécile" = "Fée, Cécile",
  "François" = "Fossé-Darcosse, François Barthélémy Thérèse Émilien",
  "Antoine" = "Fourcroy, Antoine-François",
  "François" = "François-Marie-Guillaume",
  "Madame" = "François, Madame",
  "Alexandre" = "Francq, Alexandre de",
  "Madame" = "Fréville, Madame de",
  "Guillaume" = "Friedrich Wilhelm III., König von Preußen",
  "Joseph" = "Gall, Dr. Franz Joseph",
  "Gauthier" = "Gauthier (= Lacroix Gauthier?)",
  "Sophie" = "Gay, Sophie, baronne de Lupigny, geb. Nichault de la Valette",
  "Jean" = "Gence, Jean-Baptiste-Modeste",
  "Jean" = "Georgeon, General",
  "Émile" = "Girardin, Émile de",
  "Louis" = "Gohier, Louis",
  "Étienne" = "Gosse, Étienne (Redakteur der \"\"\"\"Pandore\"\"\"\")",
  "Anne" = "Gouvion Saint-Cyr, Anne de",
  "Guillaume" = "Guillon Lethière, Guillaume",
  "Madame" = "Gumppenberg, Fanny Baronin von",
  "Monsieur" = "Guyet, Isidore",
  "Monsieur" = "Heinsberg, Herr von",
  "Monsieur" = "Herrmann",
  "Monsieur" = "Hompesch-Rurich, Johann Baptist Ludwig Graf von (1759-1833), Vater von Hermann Philipp",
  "Alexandre" = "Humboldt, Alexander von",
  "Marie" = "Jaquotot, Marie-Victoire",
  "Antoine" = "Jay, Antoine",
  "Jean" = "Jean Baptiste Joseph",
  "Jean" = "Jean-François",
  "Madame" = "Laplace, Madame de",
  "François" = "Larcher de Chamont, François, chevalier",
  "Jean" = "Laya, Jean-Louis",
  "Madame" = "Lenders, Fräulein (von?)",
  "Madame" = "Leroy de Bacre, Félicie, geb. Dalpayet",
  "Monsieur" = "Leyen, Gustav Heinrich von der (Sohn von Friedrich Heinrich)",
  "Monsieur" = "Louis-Benoît",
  "Monsieur" = "Louis-Nicolas",
  "Madame" = "Löwenhielm, Jacquette Gräfin",
  "Monsieur" = "Maison, général, später maréchal Nicolas Joseph",
  "Monsieur" = "Maison, Joseph, vicomte (Sohn des Nicolas Joseph)",
  "Madame" = "Maleszewski, comtesse de",
  "Marc" = "Marc-Antoine",
  "Madame" = "Marie-Émile-Guillaume",
  "Monsieur" = "Marrast, Armand",
  "Monsieur" = "Marron, Paul-Henri",
  "Monsieur" = "Mathon de Fogères, Henri-Napoléon",
  "Monsieur" = "Méchin, Edmond",
  "Madame" = "Méricourt, Françoise de",
  "Monsieur" = "Miollis, Sextius Alexandre François de",
  "Monsieur" = "Murrey, Monsieur Gaillard de",
  "Monsieur" = "Naigeon, Céleste",
  "Madame" = "Naigeon, Mademoiselle",
  "Monsieur" = "Naigeon, Monsieur",
  "Monsieur" = "Nicolle, Dominique-Charles, abbé",
  "Camille" = "Paganel, Camille",
  "Madame" = "Paganel, Madame G., geb. von Senfft-Pilsach",
  "Monsieur" = "Paillet, Julien, gen. Paillet de Plombières (Schriftsteller)",
  "Madame" = "Paxton, Maria Alecia",
  "Monsieur" = "Pougens, Charles de",
  "Monsieur" = "Prous, Henry",
  "Madame" = "Raboteau, Emélie, verh. Ranson",
  "Monsieur" = "Raboteau, Paul Étienne",
  "Monsieur" = "Richard, Carl (Major in Aachen)",
  "Monsieur" = "Riche de Prony, Gaspard, baron",
  "Monsieur" = "Rittinghausen, Moritz",
  "Monsieur" = "Ritz, Wilhelm",
  "Madame" = "Roguet, Pauline, geb. de Ladoucette",
  "Monsieur" = "Roosmalen, Auguste de",
  "Monsieur" = "Saint-Cricq, Auguste de (Ehemann von CdS' Nichte Joséphine)",
  "Monsieur" = "Saint-Mars, général vicomte de (Bruder der Schwägerin der CdS)",
  "Monsieur" = "Say, Jean-Baptiste",
  "Monsieur" = "Schepeler, Andreas Daniel Berthold von",
  "Monsieur" = "Sédillot, Jean-Jacques Emmanuel",
  "Elisabeth" = "Simon, Elisabeth",
  "Monsieur" = "Simon(s), Monsieur",
  "Adèle" = "Sobry, Adèle",
  "Adrienne" = "Sobry, Adrienne",
  "Monsieur" = "Stassart, Goswin Joseph Augustin, baron de",
  "Charles" = "Théremin, Charles Guillaume",
  "Thérèse" = "Thérèse-Angélique",
  "Léon" = "Thiessé, Léon",
  "Mathilde" = "Thurn und Taxis, Therese (Mathilde Amalia), geb. Herzogin zu Mecklenburg(-Strelitz), Fürstin von",
  "Madame" = "Thurot, Madame",
  "Monsieur" = "Ursin, Pierre-François-Marie",
  "Monsieur" = "Vernéjoul, Monsieur de",
  "Madame" = "Vien, Rose Céleste, geb. Bache",
  "Monsieur" = "Viennet, Jean-Pons-Guillaume",
  "Monsieur" = "Villenave, Théodore",
  "Monsieur" = "Wergifosse / Vergifosse, Monsieur (de?)",
  "Monsieur" = "Wied-Neuwied, Maximilian Alexander Philipp, Prinz zu")
CdS_main_genre$Empfänger1 <- as.character(CdS_main_genre$Empfänger1)

CdS_main_genre$Empfänger2 <- fct_recode(CdS_main_genre$Empfänger2,
                                        "Joseph" = "Agoub, Joseph Elie",
                                        "Alexander" = "Alexander I., Zar von Russland",
                                        "Jean" = "Alibert, Jean-Louis, baron",
                                        "François" = "Amalric, François de Sales",
                                        "François" = "Andrieux, François",
                                        "Edouard" = "Anglemont, Edouard d'",
                                        "Caroline" = "Anna Caroline",
                                        "Anne" = "Anne Marguerite",
                                        "Antoine" = "Antoine-Alexandre",
                                        "Louis" = "Audiffret, Florimond Louis, comte d'",
                                        "Monsieur" = "Audouard, Monsieur",
                                        "Jean" = "Bailly, Jean-Louis-Armand",
                                        "Monsieur" = "Bavier, Major de",
                                        "Monsieur" = "Bavier, Monsieur de",
                                        "Michel" = "Berr / Behr, Michel",
                                        "Madame" = "Berr, Madame (Ehefrau von Michel Berr)",
                                        "Louis" = "Bertin, Louis-François",
                                        "Albin" = "Berville, Saint-Albin",
                                        "Jacques" = "Beugnot, Jacques Claude, comte",
                                        "Jean" = "Boucharlat, Jean-Louis",
                                        "Monsieur" = "Buchon, Monsieur",
                                        "Monsieur" = "C., Monsieur",
                                        "Charlotte" = "Cabanis, Charlotte, geb. de Grouchy",
                                        "Madame" = "Cabanon, Mademoiselle Cléonis",
                                        "Pierre" = "Caumont, Arcisse de",
                                        "Jacques" = "Césarini, Jacques-Auguste-Vié de",
                                        "Jean" = "Châtelain, Jean-Baptiste-François, chevalier de",
                                        "Monsieur" = "Châtelain, Monsieur",
                                        "Étienne" = "Clavier, Étienne",
                                        "Achille" = "Comte, Achille",
                                        "Jean" = "Cooper, James Fenimore",
                                        "Germain" = "Coubard d'Aulnay, Germain Etienne",
                                        "Esther" = "Courier, Esther Etienne Herminie, geb. Clavier",
                                        "Louise" = "Dauriat, Louise",
                                        "Charles" = "Delestre-Poirson, Charles-Gaspard",
                                        "Ferdinand" = "Denis, Ferdinand",
                                        "Georges" = "Depping, Georges-Bernard",
                                        "Monsieur" = "Deshayes, Monsieur",
                                        "Monsieur" = "Devise, Monsieur de (Cousin der CdS)",
                                        "Monsieur" = "Du Château, Monsieur",
                                        "Bernard" = "Émeric-David, Toussaint Bernard",
                                        "Cécile" = "Fée, Cécile",
                                        "François" = "Fossé-Darcosse, François Barthélémy Thérèse Émilien",
                                        "Antoine" = "Fourcroy, Antoine-François",
                                        "François" = "François-Marie-Guillaume",
                                        "Madame" = "François, Madame",
                                        "Alexandre" = "Francq, Alexandre de",
                                        "Madame" = "Fréville, Madame de",
                                        "Guillaume" = "Friedrich Wilhelm III., König von Preußen",
                                        "Joseph" = "Gall, Dr. Franz Joseph",
                                        "Gauthier" = "Gauthier (= Lacroix Gauthier?)",
                                        "Sophie" = "Gay, Sophie, baronne de Lupigny, geb. Nichault de la Valette",
                                        "Jean" = "Gence, Jean-Baptiste-Modeste",
                                        "Jean" = "Georgeon, General",
                                        "Émile" = "Girardin, Émile de",
                                        "Louis" = "Gohier, Louis",
                                        "Étienne" = "Gosse, Étienne (Redakteur der \"\"\"\"Pandore\"\"\"\")",
                                        "Anne" = "Gouvion Saint-Cyr, Anne de",
                                        "Guillaume" = "Guillon Lethière, Guillaume",
                                        "Madame" = "Gumppenberg, Fanny Baronin von",
                                        "Monsieur" = "Guyet, Isidore",
                                        "Monsieur" = "Heinsberg, Herr von",
                                        "Monsieur" = "Herrmann",
                                        "Monsieur" = "Hompesch-Rurich, Johann Baptist Ludwig Graf von (1759-1833), Vater von Hermann Philipp",
                                        "Alexandre" = "Humboldt, Alexander von",
                                        "Marie" = "Jaquotot, Marie-Victoire",
                                        "Antoine" = "Jay, Antoine",
                                        "Jean" = "Jean Baptiste Joseph",
                                        "Jean" = "Jean-François",
                                        "Madame" = "Laplace, Madame de",
                                        "François" = "Larcher de Chamont, François, chevalier",
                                        "Jean" = "Laya, Jean-Louis",
                                        "Madame" = "Lenders, Fräulein (von?)",
                                        "Madame" = "Leroy de Bacre, Félicie, geb. Dalpayet",
                                        "Monsieur" = "Leyen, Gustav Heinrich von der (Sohn von Friedrich Heinrich)",
                                        "Monsieur" = "Louis-Benoît",
                                        "Monsieur" = "Louis-Nicolas",
                                        "Madame" = "Löwenhielm, Jacquette Gräfin",
                                        "Monsieur" = "Maison, général, später maréchal Nicolas Joseph",
                                        "Monsieur" = "Maison, Joseph, vicomte (Sohn des Nicolas Joseph)",
                                        "Madame" = "Maleszewski, comtesse de",
                                        "Marc" = "Marc-Antoine",
                                        "Madame" = "Marie-Émile-Guillaume",
                                        "Monsieur" = "Marrast, Armand",
                                        "Monsieur" = "Marron, Paul-Henri",
                                        "Monsieur" = "Mathon de Fogères, Henri-Napoléon",
                                        "Monsieur" = "Méchin, Edmond",
                                        "Madame" = "Méricourt, Françoise de",
                                        "Monsieur" = "Miollis, Sextius Alexandre François de",
                                        "Monsieur" = "Murrey, Monsieur Gaillard de",
                                        "Monsieur" = "Naigeon, Céleste",
                                        "Madame" = "Naigeon, Mademoiselle",
                                        "Monsieur" = "Naigeon, Monsieur",
                                        "Monsieur" = "Nicolle, Dominique-Charles, abbé",
                                        "Camille" = "Paganel, Camille",
                                        "Madame" = "Paganel, Madame G., geb. von Senfft-Pilsach",
                                        "Monsieur" = "Paillet, Julien, gen. Paillet de Plombières (Schriftsteller)",
                                        "Madame" = "Paxton, Maria Alecia",
                                        "Monsieur" = "Pougens, Charles de",
                                        "Monsieur" = "Prous, Henry",
                                        "Madame" = "Raboteau, Emélie, verh. Ranson",
                                        "Monsieur" = "Raboteau, Paul Étienne",
                                        "Monsieur" = "Richard, Carl (Major in Aachen)",
                                        "Monsieur" = "Riche de Prony, Gaspard, baron",
                                        "Monsieur" = "Rittinghausen, Moritz",
                                        "Monsieur" = "Ritz, Wilhelm",
                                        "Madame" = "Roguet, Pauline, geb. de Ladoucette",
                                        "Monsieur" = "Roosmalen, Auguste de",
                                        "Monsieur" = "Saint-Cricq, Auguste de (Ehemann von CdS' Nichte Joséphine)",
                                        "Monsieur" = "Saint-Mars, général vicomte de (Bruder der Schwägerin der CdS)",
                                        "Monsieur" = "Say, Jean-Baptiste",
                                        "Monsieur" = "Schepeler, Andreas Daniel Berthold von",
                                        "Monsieur" = "Sédillot, Jean-Jacques Emmanuel",
                                        "Elisabeth" = "Simon, Elisabeth",
                                        "Monsieur" = "Simon(s), Monsieur",
                                        "Adèle" = "Sobry, Adèle",
                                        "Adrienne" = "Sobry, Adrienne",
                                        "Monsieur" = "Stassart, Goswin Joseph Augustin, baron de",
                                        "Charles" = "Théremin, Charles Guillaume",
                                        "Thérèse" = "Thérèse-Angélique",
                                        "Léon" = "Thiessé, Léon",
                                        "Mathilde" = "Thurn und Taxis, Therese (Mathilde Amalia), geb. Herzogin zu Mecklenburg(-Strelitz), Fürstin von",
                                        "Madame" = "Thurot, Madame",
                                        "Monsieur" = "Ursin, Pierre-François-Marie",
                                        "Monsieur" = "Vernéjoul, Monsieur de",
                                        "Madame" = "Vien, Rose Céleste, geb. Bache",
                                        "Monsieur" = "Viennet, Jean-Pons-Guillaume",
                                        "Monsieur" = "Villenave, Théodore",
                                        "Monsieur" = "Wergifosse / Vergifosse, Monsieur (de?)",
                                        "Monsieur" = "Wied-Neuwied, Maximilian Alexander Philipp, Prinz zu")
CdS_main_genre$Empfänger2 <- as.character(CdS_main_genre$Empfänger2)

CdS_main_genre2 <- CdS_main_genre %>% select("id", "Empfänger1", "Empfänger2")



prenom1 <- gender(CdS_main_genre2$Empfänger1, method = c("ssa", "ipums", "napp", "kantrowitz", "genderize", "demo"), countries = c("United States", "Canada", "United Kingdom", "France", "Italia", "Germany"), years = c(1880, 1920))
prenom1$gender
prenom1$name

CdS_main_genre3 <- left_join(CdS_main_genre2, select(prenom1, name, gender), by= c("Empfänger1"= "name"))

doublons <- which(duplicated(CdS_main_genre3$id))
CdS_main_genre3 <- CdS_main_genre3[-doublons,] %>% data.frame

CdS_main_genre3$Empfänger1genre <- CdS_main_genre3$gender
CdS_main_genre3$gender <- NULL

freq(CdS_main_genre3$Empfänger1genre)
CdS_main_genre3$Empfänger1genre <- fct_recode(CdS_main_genre3$Empfänger1genre,
                                       "Female" = "female",
                                       "Male" = "male")

CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Alexandre"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Monsieur"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Constance"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Anne Marguerite"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Edme"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Anne Marguerite "] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Jean Baptiste Joseph"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Pierre "] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Louis-Mathieu"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Joséphine"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Jean-François"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Alexandre "] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Adélaïde-Gillette"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Aglaé"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Albert"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Alibert, Jean-Louis, baron Amalric,"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == " François de Sales"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Amar, Monsieur"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Amaury"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Andrieux, François"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Anna Caroline"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Anne-Louis"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Anne-Marie"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Antoine-Alexandre"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Armand"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Benjamin"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Benoît"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Caroline"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Célestin"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Charlotte"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Chrétien-Siméon"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Dauriat, Louise Debeauvoir,"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Wilhelmine"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Thérèse-Angélique"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Theodor"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Sophie"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Simon"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Silva"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Pierre-Louis"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Paul"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Panagiotis"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Panagiotis"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Nicolas"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Michele"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Michel-Ange"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Michel"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Michael"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Mélanie"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Maurice"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Mathieu"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Marie-Émile-Guillaume"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Marguerite"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Marc-Antoine"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Male"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Madame"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Luigi"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Louis-Nicolas"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Louis-Benoît"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Julien-Michel"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Judith"] <- "Female"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "John"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Jacques"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Herrmann"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Henri"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Grégoire"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Gaspard"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Gabriel "] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Gabriel"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Frédéric"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "François-Marie-Guillaume"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "François"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Félix"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Fabien"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Eugène"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Étienne"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == " Rémi"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Dauriat, Louise Debeauvoir,"] <- "Male"

freq(CdS_main_genre3$Empfänger1genre)
table(CdS_main_genre3$Empfänger1genre, CdS_main_genre3$Empfänger1, useNA = "ifany")

CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == " Guillaume"] <- "Male"
CdS_main_genre3$Empfänger1genre [CdS_main_genre3$Empfänger1 == "Thérèse"] <- "Female"


data_complet <- merge(CdS_main_genre, CdS_main_genre3, by="id")

data_complet$Empfänger1 <- NULL
data_complet$Empfänger2 <- NULL
data_complet$Empfänger1.y <- NULL
data_complet$Empfänger2.x <- NULL
data_complet$Empfänger1genregenre <- NULL

write_csv2(data_complet, "CdS_main_genre_2.csv")





