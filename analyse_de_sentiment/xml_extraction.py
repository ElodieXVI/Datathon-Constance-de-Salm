import glob
import os.path
from bs4 import BeautifulSoup
import nltk

path_bi_folder = '../../Corpus/'

for file in glob.glob(os.path.join(path_bi_folder, '*.xml')):
    file_content = open(file, 'r')
    soup = BeautifulSoup(file_content, 'xml')

    text = []
    for body in soup.find_all('body'):
        for p in body.find_all('p'):
            text.append(p.text)

    text_file = ''.join(text)
    output_file = open('./documents/german_beginnings/' + os.path.basename(file).replace('.xml', '.txt'), 'w')
    output_file.write(nltk.sent_tokenize(text_file)[0])
    output_file.close()

