Flight Delay Prediction Using Machine Learning and Deep Learning
Overview

Predicting flight delays is critical for improving airline operations, passenger satisfaction, and overall air traffic management. This project focuses on building a machine learning (ML) and deep learning (DNN) pipeline to predict flight delays in minutes based on various flight characteristics such as departure time, distance, carrier, and weather categories.

The solution processes over a million rows of raw flight data, incorporates feature engineering, trains multiple models, and deploys the best-performing solution via a containerized REST API. Tools such as Docker, Postman, a lightweight web server, and a Python cron job were used to automate and operationalize the pipeline.
Dataset

The raw dataset consists of over one million rows with information on flight schedules, delays, and other attributes, including:

    CRS_DEP_TIME: Scheduled departure time (in HHMM format).
    DEP_DELAY: Departure delay in minutes (target variable).
    DISTANCE: Flight distance in miles.
    AIR_TIME: Scheduled air time of the flight.
    OP_UNIQUE_CARRIER: Unique carrier code of the flight.
    Weather_Category: Categorized weather conditions (e.g., favorable, risky, unfavorable).
    NAS_Category: National Airspace System delay categories.
    TAIL_NUM: Aircraft tail number (dropped as it is non-predictive).

After data cleaning and preprocessing, the dataset used for training and evaluation contained ~56,000 rows.
Goals

    Predict the departure delay (DEP_DELAY) in minutes.
    Handle and process over one million rows of raw data efficiently.
    Compare performance across traditional machine learning models and deep learning.
    Achieve high accuracy (ideally above 85%) and meaningful evaluation metrics (R² and accuracy percentage).
    Containerize the ML solution for seamless deployment and access through a REST API.
    Automate periodic updates to the model using Python cron jobs.

Pipeline Overview
1. Data Cleaning

    Dropped Non-Predictive Columns: Columns like TAIL_NUM were dropped.
    Handled Missing Values: Missing values in critical columns (e.g., DEP_DELAY, DISTANCE, AIR_TIME) were handled using dropna for the target variable and median imputation for non-critical features.
    Encoded Categorical Variables: Used Label Encoding for columns like OP_UNIQUE_CARRIER and Weather_Category.

2. Feature Engineering

    Extracted DEP_HOUR: The DEP_HOUR column was derived from CRS_DEP_TIME by extracting the hour component (e.g., 1200 → 12).
    Derived Features:
        Categorical Buckets for DEP_HOUR: Split hours into buckets (Morning, Afternoon, Evening, Night).
        Peak Hour Indicator: Created a binary feature (IS_PEAK_HOUR) for busy flight times (e.g., 7–10 AM and 4–7 PM).
        Minutes Since Midnight: Converted DEP_HOUR into minutes since midnight.
        Interaction Features: Created combinations of important columns, such as:
            DEP_HOUR * DAY_OF_WEEK
            DEP_HOUR * DISTANCE

3. Feature Scaling

    Standardized Features: Used StandardScaler to normalize all numerical features, ensuring compatibility with models like DNN and XGBoost.

4. Model Training

    Trained four traditional models:
        Decision Tree
        Random Forest
        CatBoost
        XGBoost
    Trained a Deep Neural Network (DNN) with three dense layers:
        Layer 1: 128 neurons (ReLU, Dropout 30%)
        Layer 2: 64 neurons (ReLU, Dropout 20%)
        Layer 3: 32 neurons (ReLU)
        Output Layer: Single neuron (linear activation for regression).

5. REST API Deployment

    Containerized the Model: Used Docker to package the trained ML model and dependencies into a containerized environment.
    REST API Endpoint: Built a REST API using Flask to serve the model. The API accepts input data as JSON and returns the predicted delay in minutes.
    Web Server Deployment: Deployed the Flask application using a lightweight web server (e.g., Gunicorn) for production readiness.
    API Testing: Postman was used to test the API endpoints, ensuring correct functionality.

6. Automation

    Python Cron Job: Implemented a cron job to periodically retrain the model with new data, ensuring that predictions remain accurate as new trends emerge in flight delays.

Results
Model	MSE	R²	Accuracy (%)
Decision Tree	5367.13	-0.446	69.17
Random Forest	2837.40	0.236	70.38
CatBoost	2545.77	0.314	73.88
XGBoost	2581.86	0.304	73.62
Deep Neural Network (DNN)	2312.54	0.365	75.12

The DNN outperformed traditional models with the lowest MSE, highest R², and improved accuracy. However, further optimization is required to meet the target of 85% accuracy.
Tools and Technologies

    Python Libraries: Scikit-learn, TensorFlow/Keras, CatBoost, XGBoost, Pandas, NumPy, Flask.
    Docker: Used to containerize the solution for consistent deployment.
    Postman: Tested REST API endpoints for correctness and performance.
    Web Server: Used Flask with Gunicorn to serve the model API in production.
    Cron Job: Automated model retraining and data updates using Python.

API Usage
Endpoint

    POST /predict-delay

Request Format

Send a JSON payload with the required input features. Example:

{
  "CRS_DEP_TIME": 830,
  "DISTANCE": 500,
  "AIR_TIME": 120,
  "OP_UNIQUE_CARRIER": "DL",
  "Weather_Category": "Favorable",
  "NAS_Category": "None",
  "DAY_OF_WEEK": 3
}

Response

The API will return the predicted delay in minutes:

{
  "predicted_delay": 12.5
}

Challenges and Solutions

    Processing High Volumes of Data:
        Cause: The dataset had over one million rows of raw data.
        Solution: Efficiently cleaned, reduced, and processed data using vectorized operations in Pandas.

    High Training Times:
        Cause: Complex models like Random Forest and DNN with high data volume.
        Solution: Optimized hyperparameters using GridSearchCV for traditional models and batch size tuning for DNN.

    Deployment Complexity:
        Cause: Packaging dependencies for model deployment.
        Solution: Used Docker for seamless containerization and deployment.

Repository Structure

/flight-delay-prediction
│
├── README.md          # Project report
├── raw_data.csv       # Original raw dataset with over 1M rows
├── processed_data.csv # Processed dataset for training
├── flight_delay.ipynb # Jupyter Notebook containing the code
├── app.py             # Flask API code
├── Dockerfile         # Docker configuration for containerization
├── requirements.txt   # Python dependencies
└── cron_jobs.py       # Python script for cron job automation

Conclusion

This project successfully demonstrates a complete pipeline for predicting flight delays using traditional ML and DNN models. It efficiently processes over a million rows of raw data and deploys the best-performing solution as a REST API. The system is containerized, scalable, and automated for periodic updates, making it robust for real-world applications.
