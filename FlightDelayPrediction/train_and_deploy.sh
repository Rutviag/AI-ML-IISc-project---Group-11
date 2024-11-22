#!/bin/zsh

# Variables
PROJECT_DIR="/Users/ptkumar/LLMProjects/FlightDelayPrediction/"
DOCKER_IMAGE_NAME="flight-delay-api"
MODEL_FILE="best_flight_delay_model.pkl"

# Step 1: Navigate to the project directory
cd $PROJECT_DIR || exit

# Step 2: Retrain the model
echo "Training the model..."
echo "Training the without model..."
python3 FlightDelay_Prediction_with_XGB.py

# Step 3: Check if model training was successful
if [ ! -f "$MODEL_FILE" ]; then
  echo "Model training failed. Exiting."
  exit 1
fi

# Step 4: Build the Docker image
echo "Building Docker image..."
docker build -t $DOCKER_IMAGE_NAME .

# Step 5: Push the image to the Docker registry
echo "Pushing Docker image to registry..."
docker push $DOCKER_IMAGE_NAME

# Step 6: Notify success
echo "Docker image successfully pushed to $DOCKER_IMAGE_NAME"

