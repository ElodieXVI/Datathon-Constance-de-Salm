import glob
import os.path
import re
from pprint import pprint
import spacy
from nltk.corpus import stopwords
from textblob import Blobber
from textblob_fr import PatternTagger, PatternAnalyzer
import pandas as pd

# Créer un Blobber pour faire de l'analyse sentiment avec nos données
tb = Blobber(pos_tagger=PatternTagger(), analyzer=PatternAnalyzer())

# Pour créer un pipeline de préparation linguistique
# spacy.cli.download('fr_core_news_sm')
nlp = spacy.load("fr_core_news_sm")

# Pour effacer les stopwords
stops = stopwords.words("french")

# Part-Of-Speech
pos_list = ["NOUN", "ADJ", "ADV"]

# Ajouter et analyser les documents / ajouter les résultats au DataFrame
results_complet = {}
for file in glob.glob('./test/documents/*'):
    print('Working on:', os.path.basename(file))

    doc_prep = nlp(open(file, 'r').read())
    # Il faut ajouter seulement des lemmas qui sont assez longs, qui n'apparaissent pas dans la liste de stopwords
    # et dont le Part of Speech tag doit être un nom, un verbe ou un adjective
    tokens = [word.lemma_ for word in doc_prep if word.text not in stops and not re.match('\W+|\d+|\w+’+', word.text)
              and word.pos_ in pos_list and len(word.text) > 1]

    preprocessed = ''
    for token in tokens:
        preprocessed += ' ' + token

    # Mettre les résultats dans une dictionnaire, correspondants au fichier
    result_sentiment = 'en train de le trouver'
    if tb(preprocessed).sentiment[0] > 0.0:
        result_sentiment = 'positif'
    elif tb(preprocessed).sentiment[0] < 0.0:
        result_sentiment = 'négatif'

    results_complet[os.path.basename(file)] = result_sentiment

    df = pd.DataFrame.from_dict(results_complet, orient='index', columns=['résultat'])
    df.index.name = 'fichier'
    print(df.head())
