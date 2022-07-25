# fNIRSClassifier
Scripts made to classify fNIRS Oxy and Deoxy datasets

Code adapted from Chapter 1 of the Neural Networks and Deep Learning booklet by Michael Nielsen: NIELSEN, Michael A. Neural networks and deep learning. San Francisco, CA, USA: Determination press, 2015. https://github.com/mnielsen/neural-networks-and-deep-learning and modified for Python 3.x by Michal Daniel Dobrzanski: https://github. com/MichalDanielDobrzanski/DeepLearningPython.    

Subsequently, to plot the graphs manually of Oxy and Deoxy, the average obtained for each number of neurons (Total of 20) in the hidden layer was taken and the two graphs were performed using the matplotlib module

## How to run (Linux)
<ol>
<li> At dir1 and dir2 variables located in nirs_loader.py file, replace after the equal sign the path where the text (.txt) or csv (.csv) files are located. Ex for Oxy files is: /home/victor/Documents/Oxy/*.txt or /home/victor/Documents/Oxy/*.csv </li>
<li> At the Main.py file insert the values for each parameter</li>
<li> To run the program in the terminal inside the folder where all the .py files are located type python3 Main.py
</ol>
