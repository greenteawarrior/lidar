//3D sweep for POE lab

#include <Servo.h>

//create two servo objects;
Servo pan;
Servo tilt;

//variables for servo positions
int panPos = 0;
int tiltPos = 0;

//setting up pins
const int analogInPin = A1; // the pin that the IR sensor is attached to

//signals for data processing
const int nextmeasurement = -11;
const int theend = -6;

//regarding measurements
float sensorValue; // raw measurement from IR sensor
int distanceValue; // after processing, sensor measurement is converted into distance (cm)


void setup() {
  // initialize serial 
  Serial.begin(9600);
  
  // attaching the servos on Arduino pins
  pan.attach(9);
  tilt.attach(8); 
}

void loop() {
  
  for (panPos = 40; panPos <= 130; panPos += 5){ // goes from 0 degrees to 180 degrees in 1-degree steps
     pan.write(panPos);
     delay(200); // waits 15ms for the servo to reach new position
     
     for (tiltPos = 60; tiltPos <= 120; tiltPos += 5){
        
        tilt.write(tiltPos);
        // waits 0.5sec for the servo to reach new position
        delay(500); 
        
        // IR sensor measurement for the new position
        sensorValue = analogRead(analogInPin);
        
        // given IR sensor measurement, calculate real distance (cm)
        // we used an exponential fit because it was more accurate compared to the linear fit equation
        distanceValue = 108.2 * pow(2.71828,-.003055*sensorValue);
        
        // communicating to matlab
        Serial.println(distanceValue);
        Serial.println(panPos);
        Serial.println(tiltPos);
        Serial.println(nextmeasurement);
       
        // give time for the microcontroller to process everything
        delay(200);       
       }
    } 
    Serial.println(theend);
}
