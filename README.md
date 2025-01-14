Credit Card Fraud Detection using SAS
Hey there! This project demonstrates how to detect fraudulent credit card transactions using SAS. It includes data preprocessing, model training, and evaluation steps.

Project Overview
The goal is to build a logistic regression model to classify credit card transactions as fraudulent or non-fraudulent. We use a publicly available dataset with anonymized features and a target variable indicating fraud (1) or no fraud (0).

Dataset Information
Dataset: The creditcard.csv contains anonymized features and a target variable Class (fraudulent or not).
Size: 143 MB (managed with Git LFS).

Clone the Repository:
git clone https://github.com/zenithbhatt/sas-credit-card-fraud-detection.git

Install Git LFS: If not already installed, follow this guide.

Upload to SAS Studio: Upload the creditcard.csv to your SAS Studio environment and run the code from the fraud_detection_model.sas file.

Project Structure

sas-credit-card-fraud-detection/
├── README.md                  # Project overview
├── creditcard.csv             # Dataset (Git LFS managed)
├── fraud_detection_model.sas  # SAS code for the model
├── .gitattributes             # Git LFS config
└── .gitignore                 # Git ignore settings

Key Steps
Data Preprocessing: Load and normalize the data using PROC IMPORT and PROC STANDARD.
Model Building: Train a logistic regression model with PROC LOGISTIC.
Model Evaluation: Use confusion matrices and ROC curves to evaluate model performance.

License
MIT License.