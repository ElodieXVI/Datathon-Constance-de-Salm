import glob
import os.path
from bs4 import BeautifulSoup
import nltk
import re
from nltk.corpus import stopwords


# von: Tieck, (Adelbert) Chamisso


def extract_text(in_path):
    stopwords_ge = stopwords.words('german')
    for file in glob.glob(os.path.join(path_bi_folder, '*.xml')):
        file_content = open(file, 'r')
        soup = BeautifulSoup(file_content, 'xml')

        """for tag in soup.find_all('note'):
            tag.replaceWith('')"""
        # Does not work

        text = []
        for body in soup.find_all('body'):
            for p in body.find_all('p'):
                text.append(p.text)

        text_file = ' '.join(text)
        output_file = open('./documents/german_beginnings/' + os.path.basename(file).replace('.xml', '.txt'), 'w')
        cleaned_text = nltk.sent_tokenize(text_file)[0]
        cleaned_text = re.sub(r'\W+|\d+', ' ', cleaned_text)
        cleaned_text = re.sub(r'\b\w{1,3}\b', ' ', cleaned_text)
        cleaned_text = [word for word in cleaned_text if word not in stopwords_ge]
        cleaned_text = ''.join(cleaned_text)
        output_file.write(cleaned_text)
        output_file.close()


if __name__ == '__main__':
    path_bi_folder = '../../Corpus/'
    extract_text(path_bi_folder)
