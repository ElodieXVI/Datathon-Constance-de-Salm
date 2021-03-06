import pandas as pd
import matplotlib.pyplot as plt
import os


def visualise(csv_file):
    df = pd.read_csv(csv_file, sep=',')
    results_dict = {'sum_positif': df[df['résultat'] == 'positif'].count()[0],
                    'sum_négatif': df[df['résultat'] == 'négatif'].count()[0],
                    'sum_neutral': df[df['résultat'] == 'neutral'].count()[0]}
    return results_dict


if __name__ == '__main__':
    lists = sorted(visualise(csv_file='./analyse_de_sentiment/documents/result_sentiment_analyse.csv').items())
    x, y = zip(*lists)
    plt.bar(x, y, color=['blue', 'red', 'green'])
    plt.savefig('./analyse_de_sentiment/documents/resultats_figure.png')
    #plt.show()
