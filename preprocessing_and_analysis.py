import glob
import os.path
import re
from pprint import pprint
import spacy
from nltk.corpus import stopwords
from textblob import Blobber
from textblob_fr import PatternTagger, PatternAnalyzer

# Créer un Blobber pour faire de l'analyse sentiment avec nos données
tb = Blobber(pos_tagger=PatternTagger(), analyzer=PatternAnalyzer())

# Pour créer un pipeline de préparation linguistique
# spacy.cli.download('fr_core_news_sm')
nlp = spacy.load("fr_core_news_sm")

# Pour effacer les stopwords
stops = stopwords.words("french")

# Part-Of-Speech
pos_list = ["NOUN", "ADJ", "ADV"]

# Ajouter les documents / les plain textes
results_complet = {}
for file in glob.glob('./test/documents/*'):
    print('Working on:', os.path.basename(file))

    doc_prep = nlp(open(file, 'r').read())

    tokens = [word.lemma_ for word in doc_prep if word.text not in stops and not re.match('\W+|\d+|\w+’+', word.text)
              and word.pos_ in pos_list and len(word.text) > 1]

    preprocessed = ''
    for token in tokens:
        preprocessed += ' ' + token

    result_sentiment = 'en train de le trouver'
    if tb(preprocessed).sentiment[0] > 0.0:
        result_sentiment = 'positif'
    elif tb(preprocessed).sentiment[0] < 0.0:
        result_sentiment = 'négatif'

    results_complet[os.path.basename(file)] = result_sentiment

    pprint(results_complet)
