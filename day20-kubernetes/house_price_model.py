from fastapi import FastAPI
from pydantic import BaseModel
import numpy as np
from sklearn.ensemble import RandomForestRegressor
import os

# 简单房价预测模型
X_train = np.array([[1000], [1500], [2000], [2500], [3000]])
y_train = np.array([300000, 400000, 500000, 600000, 700000])

model = RandomForestRegressor(n_estimators=5, random_state=42)
model.fit(X_train, y_train)

app = FastAPI()

class HouseFeatures(BaseModel):
    area: float

@app.post("/predict")
def predict_price(features: HouseFeatures):
    prediction = model.predict([[features.area]])[0]
    return {
        "area": features.area, 
        "predicted_price": round(prediction, 2),
        "version": "v1.0",
        "pod_name": os.getenv('HOSTNAME', 'unknown')
    }

@app.get("/health")
def health_check():
    return {"status": "healthy", "service": "house-price-model"}

@app.get("/")
def root():
    return {"message": "House Price Prediction API", "endpoints": ["/predict", "/health"]}
