# CIU Explainer
Demo code for explaining individual predictions using CIU method
--------------------------------------------------
                         
This repository contains implementation of Contextual Importance (CI) and 
Contextual Utility (CU) method to explain individual predictions for Iris flower classification 
(Iris Setosa, Iris Versicolor, Iris Virginica). The script is written in MATLAB 2018a and neural 
network toolbox is used to train the network, and evaluate its performance using cross-entropy 
and confusion matrices. 
The network outputs the prediction value for each species which the highest one being the 
predicted class. The trained network is used to classify patterns that it has not seen before 
and results are used to generate explanations for individual instances.
We use Monte-Carlo simulation to generate a sufficient number of input vectors with random values 
for the input(s), then estimate the minimal and maximal prediction values for each input feature. 

CI corresponds to the fraction of output range covered by varying the value(s) of inputs and the maximal 
output range which shows the importance of the feature for all class individually. This calculated by the CI function:

```matlab
function calculateCI = findCI(mm, mx)
    calculateCI = (mx-mm)*100/100;
end
```
CU is calculated based on the current prediction value shows the utility of features for each class.  

```matlab
function calculateCU = findCU(n3, dymin, dymax)
    calculateCU = (n3-dymin)./(dymax-dymin);
end
```
CI and CU values can be represented as visuals and in natural language form. Here we produce text-based explanations: 

```
The model`s prediction is 100% Iris Setosa. Because;
The petal length  which is a highly important (CI=92%) feature has a typical (CU=0.68) size.
The petal width  which is a highly important (CI=99%) feature has not a typical (CU=0.23) size.
The sepal length  which is a highly important (CI=100%)feature has a very typical (CU=0.98) size.
The sepal width  which is a highly important (CI=100%) feature has a very typical (CU=1) size.
And the biggest contributing feature is the sepal length.
```
 We are also able to extract contrastive explanations with this method: 
```  
It is not Iris Versicolor(0%), because; 
The petal length  which is rather an important (CI=74%) feature has an unlikely (CU=0.43) size.
The petal width  which is a highly important (CI=93%) feature has an unlikely (CU=0.49) size.
The sepal length  which is a highly important (CI=99%) feature has not a typical (CU=0.02) size.
The sepal width  which is a highly important (CI=96%) feature has not a typical (CU=0) size.
It is not Iris Virginica(0%), because; 
The petal length  which is a highly important (CI=96%) feature has not a typical (CU=0) size.
The petal width  which is rather an important (CI=57%) feature has a typical (CU=0.53) size.
The sepal length  which is a highly important (CI=100%) feature has not a typical (CU=0) size.
The sepal width  which is a highly important (CI=99%) feature has not a typical (CU=0) size.
```
This method for explaining individual prediction is model-agnostic and can be used with other black-box algorithms. Link to the relevant article describing this method is below.

 http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.64.7564&rep=rep1&type=pdf

Acknowledgements
-------------------------- 
The results of this work is published in EXTRAAMAS 2019. Please cite this work as:
```
 “Explanations of Black-Box Model Predictions by Contextual Importance and Utility”, 
 EXplainable, TRansparent Autonomous Agents and Multi-Agent Systems, (EXTRAAMAS 2019)
```
This work was supported by the Wallenberg AI, Autonomous Systems and Software Program (WASP) funded by 
the Knut and Alice Wallenberg Foundation.

  Sule Anjomshoae (sulea@cs.umu.se),
  November 20, 2018
