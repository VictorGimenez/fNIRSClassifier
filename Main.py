""" Código adaptado do capítulo 1 da apostila Neural Networks and Deep Learning de Michael Nielsen:
NIELSEN, Michael A. Neural networks and deep learning. San Francisco, CA, USA: Determination press, 2015.
https://github.com/mnielsen/neural-networks-and-deep-learning e modificado para o Python 3.x por Michal
Daniel Dobrzanski: https://github.com/MichalDanielDobrzanski/DeepLearningPython

Posteriormente para plotagem dos gráficos manualmente foi pega a média para cada quantidade de neurônios na
camada oculta e realizado os dois gráficos por matplotlib"""



import nirs_loader
import network1

training_data, test_data = nirs_loader.load_data_wrapper()

#file_csv = mnist_loader.load_data_wrapper()

input_layer = 3108 #Quantidade de neurônios na camada de entrada
hi_layer = 11 #Quantidade de neurônios na camada oculta
out_layer = 4 #Quantidade de neurônios na camada de saída

net = network1.Network([3108, 11, 4])  #Criação da rede neural

epochs = 50 #qtd épocas
mini_batch_size = 5 #tamanho do mini lote
eta = 5.0  #ou taxa de aprendizagem (learning rate)

net.SGD(training_data, 50, 5, 5.0, test_data=test_data)  #Atribuição dos valores dos hiperparâmetros