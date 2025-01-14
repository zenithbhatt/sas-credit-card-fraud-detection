/* Import the credit card dataset */
proc import datafile="/home/u64127142/CreditCardFraudDetection/Data/creditcard.csv"
    out=work.creditcard
    dbms=csv
    replace;
    getnames=yes;
run;

/* Explore the data */
proc contents data=work.creditcard; 
run;

/* Check for missing values */
proc means data=work.creditcard n nmiss;
run;

/* Check for class distributions */
proc freq data=work.creditcard;
    tables Class; /* Class is the target variable for fraud detection */
run;

/* Standardizing numerical features to ensure they are on the same scale */
proc standard data=work.creditcard mean=0 std=1 out=work.creditcard_norm;
    var V1-V28; /* Columns V1 to V28 are the numerical features */
run;

/* Check the first few rows after standardization */
proc print data=work.creditcard_norm (obs=10);
run;
