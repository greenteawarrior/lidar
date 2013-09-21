#include <Servo.h>

//create two servo objects;
Servo pan;
Servo tilt;

//variables for servo positions
int panPos = 0;
int tiltPos = 0;

//setting up pins
const int analogInPin = A1; // the pin that the IR sensor is attached to

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
  
  for (panPos = 0; panPos <= 180; panPos += 1){ // goes from 0 degrees to 180 degrees in 1-degree steps
     pan.write(panPos);
     delay(500); // waits 15ms for the servo to reach new position
     
     for (tiltPos = 0; tiltPos <= 180; tiltPos += 1){
        
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
        
        // give time for the microcontroller to process everything
        delay(2);       
       }
    } 
}
