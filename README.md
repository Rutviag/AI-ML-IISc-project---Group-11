# **Assesing the efficiency of ML models in flight delay prediction**
## Balaji Srinivasan, Praveen Kumar, Malhar Bhatt, Rutvi Agrawal, Kushagra Saurabh

# **1. Abstract**
Prediction of flight delays is essential for a passenger who has to reach his/her destination on time, predicting and reducing the delay is important for business and airline as well. What can not be measured can not be managed. Accurate prediction of flight delays can enhance operational efficiency, improve customer satisfaction, and facilitate better resource planning. Towards this we want to explore right prediction models for delay of flights in minutes between cities based on the available historical data. We will be exploring conventional ML algorithms like Random Forest, Decision trees, XG Boost in addition we will also use deep neural network to predict the same. We will provide comparative statistics like MAE(mean absolute error), MSE(mean squared error), accuracy, F1 score, R2 score. We will also be providing representational use case which will help the user select the right airline based on delay and the airlines to predict delays and plan the staffing and ground operations better. 

**Keywords:** flight delays, machine learning, predictive modelling, aviation analytics, operational efficiency

# **2. Aims & Introduction**

Numerous studies have been conducted to address the issue of predicting flight delays by employing a variety of machine learning techniques, deep learning, and big data methodologies. However, the majority of analyses concentrate solely on a single airline or a limited number of airports. Our objective is to asses the model efficiency. The following are a few of the most widely read papers in this field:


- Chakrabarty [1] proposed a model that utilized a Gradient Boosting Classifier to forecast the arrival delay for AA (American Airlines), one of the top five busiest terminals in the United States. This paper was employed to comprehend the fundamental principles of how gradient boosting can be employed to improve machine learning models for classification.
- After analyzing the original flight data, Manna [2] developed a model utilizing the Gradient Boosting Regressor. The objective of the model was to forecast the delays in flight arrival and departure. This paper was consulted in order to comprehend the research on the Gradient Boosted Decision Tree Machine Learning Algorithm and its application to the prediction of flight delays.
- Ding [3] contrasted the outcomes of Na ̈ıve Bayes, C4.5, and a multiple linear regression model. This paper was employed to comprehend Naïve Bayes and to compare the outcomes of various models.
- Ni [4] This paper demonstrated the connections between the challenge of predicting flight delays and machine learning algorithms such as SVM and Logistic Regression.

  

