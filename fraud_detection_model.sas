/* Sort the dataset by the target variable (Class) */
proc sort data=work.creditcard_norm;
    by Class;
run;

/* Split the data into training and testing sets */
proc surveyselect data=work.creditcard_norm out=work.train_test_split
    method=srs samprate=0.7 seed=1234;
    strata Class; /* Stratified sampling by the target variable (fraud/non-fraud) */
run;

/* Check the contents of the train_test_split dataset */
PROC CONTENTS DATA=work.train_test_split;
RUN;

/* Train logistic regression model */
proc logistic data=work.train_test_split;
    class Class (param=ref);
    model Class(event='1') = V1-V28; /* Predict fraud (Class = 1) based on features V1-V28 */
    output out=work.model_predictions p=predicted_prob;
run;

/* Check if the model_predictions dataset exists */
PROC CONTENTS DATA=work.model_predictions;
RUN;

/* Evaluate the model using PROC FREQ */
proc freq data=work.model_predictions;
    tables Class*predicted_prob / chisq;
run;

/* ROC Curve Evaluation */
proc logistic data=work.train_test_split;
    class Class (param=ref);
    model Class(event='1') = V1-V28;
    roc;
run;
