**Smart Agriculture Using Ensemble Machine Learning Techniques In IoT
Environment**

**Table of Content:**

- Introduction

- Dataset Used

- Technologies & Tools Used

- Model Architecture

- How to Run

- Results

- Methodology

- Future Enhancements

- Author

**Introduction:**

This project focuses on developing a smart agriculture system that
integrates IoT sensors and ensemble machine learning algorithms to
improve crop selection and farming efficiency. Sensors like DHT11 and
soil moisture sensors collect real-time environmental data, which is
processed by an ESP32 microcontroller and sent to the cloud via
ThingSpeak. Using MATLAB, the data is analyzed through an ensemble model
combining Decision Tree, Random Forest, and XGBoost algorithms to
predict the most suitable crop. This system helps farmers make
data-driven decisions, improving yield and sustainability. The goal is
to modernize traditional farming through automation, precision, and
intelligent insights.

**Dataset Used:**

- Attributes: temperature, humidity, soil moisture, crop type.

- Number of samples per crop.

- Format: CSV file (sample_dataset.csv).

- Data source: either collected manually or a curated dataset used for
  > model training in MATLAB.

**Technologies & Tools Used:**

- **Hardware:** ESP32 microcontroller, DHT11 sensor, soil moisture
  > sensor.

- **Software:** Arduino IDE, ThingSpeak, MATLAB.

- **Machine Learning:** Decision Tree, Random Forest, XGBoost (Ensemble
  > Model).

- **Languages:** Embedded C (for ESP32), MATLAB.

**Model Architecture:**

- Sensors collect real-time data.

- ESP32 transmits data to ThingSpeak cloud.

- MATLAB fetches and analyzes the data.

- An ensemble ML model predicts the most suitable crop.

- Final results are displayed in MATLAB.

**How to Run:**

- **Clone the repository**

git clone
https://github.com/Hareesh202003/Smart-Agriculture-Using-Ensemble-Machine-Learning-Techniques-in-IoT-Environment

- Connect DHT11 and soil moisture sensors to ESP32.

- Upload Arduino code to ESP32 using Arduino IDE.

- Configure ThingSpeak channel and update API keys in the code.

- Run MATLAB scripts to fetch data, train model, and make predictions.

- View predicted crop and model accuracy in the MATLAB command window.

**Results:**

- Predicted crop (e.g., Rice).

- Sensor readings.

- ThingSpeak cloud storage.

> ![](media/image2.png){width="2.610891294838145in"
> height="1.7797703412073491in"}![](media/image2.png){width="2.6508234908136483in"
> height="1.8098359580052494in"}
> ![](media/image4.png){width="2.573024934383202in"
> height="1.7655391513560805in"}

- Model accuracy (e.g., 98.89%).

- Comparison of individual models (Decision Tree, Random Forest,
  > XGBoost) with ensemble results.

> ![](media/image3.png){width="2.47170384951881in"
> height="1.7822287839020123in"}![](media/image1.png){width="2.608964348206474in"
> height="1.7690496500437445in"}![](media/image5.png){width="2.4557206911636045in"
> height="1.7974846894138232in"}

**Methodology:**

- Data collection using sensors.

- IoT data transmission using ESP32 to ThingSpeak.

- Data preprocessing and model training in MATLAB.

- Prediction using ensemble machine learning.

- Output displayed to user with optimized model.

**Future Enhancements:**

- Adding more sensors (e.g., pH, rainfall, light intensity).

- Using mobile app/GUI to display results.

- Real-time alerts to farmers.

- Expanding dataset for more crop varieties.

- Deploying the model on edge devices for offline predictions.

**Author**

**Hareesh202003**

> [Hareesh202003/Smart-Agriculture-Using-Ensemble-Machine-Learning-Techniques-in-IoT-Environment]{.underline}
