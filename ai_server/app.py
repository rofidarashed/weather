from flask import Flask, request, jsonify
import pickle
import numpy as np

app = Flask(__name__)

with open("./random_forest_model.pkl", "rb") as file:
    model = pickle.load(file)
@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.get_json()
        print("📥 Received JSON:", data)  

        features = np.array(data['features']).reshape(1, -1)
        print("🔢 Features ready for prediction:", features)

        prediction = model.predict(features)[0]
        return jsonify({'prediction': int(prediction)})
    except Exception as e:
        print("🔥 ERROR in /predict:", e) 
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)
