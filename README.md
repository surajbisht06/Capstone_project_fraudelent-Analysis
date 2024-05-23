# <p align="center">Capstone project fraudelent Analysis using Machine Learning </p>
# <p align="center">![image](https://github.com/surajbisht06/Capstone_project_fraudelent-Analysis/assets/158066824/5df176a1-9f8d-4ba5-a230-f11f207c25d2)

</p>

## Overview

Machine learning in insurance claim analysis involves employing algorithms to analyze claim data. These algorithms detect fraudulent claims by identifying irregular patterns and behaviors. They also assess risk levels associated with claims, predict claim severity, and estimate claim frequency based on historical data and relevant factors. By leveraging machine learning, insurers can make data-driven decisions, improving efficiency, reducing costs, and effectively managing risk. This enables insurers to streamline the claims process, detect fraudulent activities, and allocate resources more efficiently, ultimately benefiting both insurance companies and policyholders.

 ## Requirements

- Python 3

- Libraries: NumPy, pandas, Sklearn, etc.

- Jupyter Lab

[Datasets Used]
[Claims1.csv]https://github.com/surajbisht06/Capstone_project_fraudelent-Analysis/blob/d3ddab4c8bf647d2860dd90e120689215e7fb80e/Claims1%20(1).csv

https://github.com/surajbisht06/Capstone_project_fraudelent-Analysis/blob/d3ddab4c8bf647d2860dd90e120689215e7fb80e/cust_demographics%20(1).xlsx

[Python Script (Code)][(Capstone Project_Insurance Claims (1).ipynb)]https://github.com/surajbisht06/Capstone_project_fraudelent-Analysis/blob/d3ddab4c8bf647d2860dd90e120689215e7fb80e/Capstone%20Project_fraudulent%20(2).ipynb

[Ppt presentation]([Capstone project ppt.pptx]https://github.com/surajbisht06/Capstone_project_fraudelent-Analysis/blob/d3ddab4c8bf647d2860dd90e120689215e7fb80e/Capstone%20project%20ppt.pptx

### Features 

- Data preprocessing: Clean and prepare the transactional data for analysis.
  
- Supervised learning: Train classification models to classify transactions as fraudulent or legitimate.
  
- Model evaluation: Assess the performance of the models using relevant metrics such as precision, recall, and F1-score.

##### Compariosion of All The Accuracy of Each Model

```py
#Create a bar graph for knn, decision tree, random forest, and logistic regression
models = ['LogisticRegression', 'DecisionTreeClassifier','RandomForestClassifier', 'KNeighborsClassifier', 'GaussianNB',] 
accuracy_values = [LogisticRegression_Train_Accuracy, DecisionTreeClassifier_Train_Accuracy,RandomForestClassifier_Train_Accuracy, KNeighborsClassifier_Train_Accuracy, GaussianNB_Train_Accuracy] 
plt.figure(figsize=(18, 5))
# # Plot the bar graph
bars = plt.bar (models, accuracy_values, color=['yellow', 'silver', 'red', 'orange','pink'])
#Add accuracy values on top of each bar
plt.bar_label(bars, labels=[f"{acc:.2f}" for acc in accuracy_values])
#Add Labels and title
plt.xlabel('Models')
plt.ylabel('Accuracy')
plt.title('Accuracy Comparison for Different Models')
#Show the plot
plt.show()
```

###### Result:
![image](https://github.com/surajbisht06/Capstone_project_fraudelent-Analysis/assets/158066824/604f57c5-ca35-41a8-9bd0-1255308e8852)

