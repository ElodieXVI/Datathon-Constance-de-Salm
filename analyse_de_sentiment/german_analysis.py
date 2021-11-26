import glob
import os.path

from textblob_de import TextBlobDE
import pandas as pd


def read_texts_df(in_path):
    df_dict = {}
    for file in glob.glob(in_path):
        text_content = open(file, 'r').read()
        df_dict[os.path.basename(file)] = text_content

    return df_dict


def preprocessing_analysis(dict):
    dict_sentiment_resultat = {}
    for i, j in dict.items():
        # print(i, j)
        blob = TextBlobDE(j)
        for sentence_1 in blob.sentences:
            dict_sentiment_resultat[i] = sentence_1.sentiment.polarity

    # df = pd.DataFrame.from_dict(dict_sentiment_resultat, index=)
    print(dict_sentiment_resultat)

    # Euler, Buch


if __name__ == '__main__':
    input_path = './documents/german_beginnings/*.txt'
    text_dict = read_texts_df(in_path=input_path)
    preprocessing_analysis(text_dict)

text = '''
"Der Blob" macht in seiner unbekümmert-naiven Weise einfach nur Spass.
Er hat eben den gewissen Charme, bei dem auch die eher hölzerne Regie und
das konfuse Drehbuch nicht weiter stören.
'''

blob = TextBlobDE(text)
blob.tags  # [('Der', 'DT'), ('Blob', 'NN'), ('macht', 'VB'),
#  ('in', 'IN'), ('seiner', 'PRP$'), ...]

blob.noun_phrases  # WordList(['Der Blob', 'seiner unbekümmert-naiven Weise',
#           'den gewissen Charme', 'hölzerne Regie',
#           'konfuse Drehbuch'])


for sentence in blob.sentences:
    print(sentence.sentiment.polarity)
# 1.0
# 0.0
