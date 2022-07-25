#### Libraries
# Standard library
import csv
import glob
import errno
import sys

# Third-party libraries
import numpy as np
from sklearn.model_selection import train_test_split
np.set_printoptions(threshold=sys.maxsize) #Caso deseje visualizar todos os dados

def load_data(): #Função adaptada para carregar os arquivos de uma pasta e gerar conjunto de dado (dataset) a partir dele

    def read_file(filename):
        try:
            with open(filename, 'r') as stream: #Abre o arquivo
                reader = csv.reader(stream, delimiter='\t')  # Separa os números existentes com aspas simples
                for row in reader:
                    yielder = yield from map(float, row)  # Converter números do formato String para pontos flutuantes
        except IOError as exc:  # Caso haja um erro de I/O (Entrada/saída)
            if exc.errno != errno.EISDIR:
                raise
        return yielder

    def listed(filename):
        # Retorna lista com todos os valores presentes no arquivo seguinte
        valores = list(read_file(filename))
        return valores

    def iterator(path):
        printed_file = []
        np_converted = []
        files = glob.glob(path)
        for name in files: # iteração em cada arquivo .txt
            printed_file.append(listed(name))  # retorna uma lista de elementos como pontos flutuantes (float)
            np_converted.append(np.asarray(printed_file, dtype=np.float32))  # conversão para um objeto numpy.array
        return np_converted

    #Listas com os rótulos
    def labelling():
        # 0 - Kiss, 1 - Kick, 2 - Stir, 3 - Look, as deoxy as oxy contain the same labels
        labels1 = [0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1,
                   2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3,
                   0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1,
                   2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3,
                   0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1,
                   2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3,
                   0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1,
                   2, 3]
        deoxy_labels = np.asarray(labels1, dtype=np.int64)
        oxy_labels = np.asarray(labels1, dtype=np.int64)
        return deoxy_labels, oxy_labels

    # Dividir dados em conjunto de dados composto por treinamento e teste
    def splitting_tr_te(samples, labels, test_percent):
        sample_tr, sample_te, label_tr, label_te = train_test_split(samples, labels, test_size=test_percent / 100, random_state=666)
        return sample_tr, label_tr, sample_te, label_te

    #Não é necessário utilizar os dois (Eu utilizei somente dir1 para classificar deoxy ou dir2 para classificar oxy)
    dir1 = """Substituir pelo caminho (Em String) onde todo o conjunto de dados deoxy esta localizado em formato .txt ou .csv"""
    dir2 = """Substituir pelo caminho (Em String) onde todo o conjunto de dados oxy esta localizado em formato .txt ou .csv"""

    it1 = iterator(dir1)
    it2 = iterator(dir2)
    deoxy_samples = it1[len(it1) - 1]
    oxy_samples = it2[len(it2) - 1]

    deoxy_lbl, oxy_lbl = labelling()
    X_tr, y_tr, X_te, y_te = splitting_tr_te(deoxy_samples, deoxy_lbl, test_percent=20)
    training_data = (X_tr, y_tr)
    test_data = (X_te, y_te)

    return (training_data, test_data)

def load_data_wrapper():
    tr_d, te_d = load_data()
    #tr_d, te_d = load_data()
    training_inputs = [np.reshape(x, (3108, 1)) for x in tr_d[0]]
    training_results = [vectorized_result(y) for y in tr_d[1]]
    training_data = list(zip(training_inputs, training_results))
    #validation_inputs = [np.reshape(x, (3108, 1)) for x in va_d[0]]
    #validation_data = list(zip(validation_inputs, va_d[1]))
    test_inputs = [np.reshape(x, (3108, 1)) for x in te_d[0]]
    test_data = list(zip(test_inputs, te_d[1]))
    return training_data, test_data

def vectorized_result(j):
    e = np.zeros((4, 1))
    e[j] = 1.0
    return e
