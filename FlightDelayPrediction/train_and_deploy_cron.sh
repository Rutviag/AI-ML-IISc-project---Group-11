#!/bin/zsh

# Variables
SCRIPT="/Users/ptkumar/LLMProjects/FlightDelayPrediction/train_and_deploy.sh"

for i in {1..2}; do
    echo "Running train_and_deploy.sh at $(date)"
    zsh $SCRIPT >> /Users/ptkumar/LLMProjects/FlightDelayPrediction/logs/train_and_deploy.log 2>&1
    sleep 30  # Wait for 30 seconds
done

