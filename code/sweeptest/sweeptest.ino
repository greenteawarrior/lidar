//2D sweep for POE lab.

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
  tiltPos = 90;
  tilt.write(tiltPos); //tilt always at 90 degrees for the 2D sweep
 
     for (panPos = 0; panPos <= 180; panPos += 1){
        
        pan.write(panPos);
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
  Serial.println(theend);
}
