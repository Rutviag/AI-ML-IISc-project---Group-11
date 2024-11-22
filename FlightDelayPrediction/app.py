from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import joblib
import pandas as pd
import uvicorn

# Load the trained pipeline
pipeline = joblib.load('best_flight_delay_model.pkl')

# Define the API
app = FastAPI()

class FlightData(BaseModel):
    OP_UNIQUE_CARRIER: str
    ORIGIN_CITY_NAME: str
    DEST_CITY_NAME: str
    CRS_DEP_HOUR: str
    CRS_DEP_MINUTES: float
    DISTANCE: float 	 	

@app.post("/predict")
def predict_delay(data: FlightData):
    # Convert input to DataFrame
    input_data = pd.DataFrame([data.dict()])
    # Predict
    prediction = pipeline.predict(input_data)
    return {"delay": int(prediction[0])}

