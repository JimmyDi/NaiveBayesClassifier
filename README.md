# NaiveBayesClassifier 
//copyright@ Di Liu  Carleton University May 7,2017
//for more details about the background and dataset, email me liudi25ece@outlook.com
//The code realize the function of Naive Bayes Classifier, including hold-out test, active learning, blind test, format output.
//there are 2 choices for loading the dataset
//1.you could separate the data as training and testing dataset yourself and then load 
//separately.
//2.or you could apply “percentage_split” function to realize hold-out test.
//the initial value for the percentage is 70% for training and 30% for testing. You could 
//also change the percentage for the test at any percentage.

//“Training_Naive_Bayes” function makes it possible to get the normal distribution for different feature.
//applying maximum likelihood function “mle” to get the normal distribution parameters.

//“calculate likelihood” could multiply all the pdf together to get the prior probability for both 
//positive and negative.

//the loop for “classification” and “confusion_matrix” are used to adjust position on the precision-recall curve

//“classification” function realizes the function of labelling. If the prior probability for positive is greater
//than negative ones, the result will be P(positive). Vice versa.

//“confusion_matrix” function calculates the value for TP,TN,FP and FN. besides, precision and recall are
//given too.

//you could email me about details of active learning 

//format output is also available