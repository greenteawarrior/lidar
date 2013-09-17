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
int sensorValue; // raw measurement from IR sensor
float invsensorValue;
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
        delay(500); // waits 15ms for the servo to reach new position
        //statements
        // IR sensor measurement for the new position
        sensorValue = analogRead(analogInPin);
        invsensorValue = 1.0/sensorValue; 
        
        // given IR sensor measurement, calculate real distance (cm)
        distanceValue = 108.2 * pow(2.71828,-.003055*sensorValue);
        
        // print everything!
        Serial.print("panPos = ");
        Serial.println(panPos);
        Serial.print("tiltPos = ");
        Serial.println(tiltPos);
        Serial.print("sensorValue = ");
        Serial.println(sensorValue);
        Serial.print("distanceValue= ");
        Serial.println(distanceValue);
        Serial.println("");
        
        // give time for the microcontroller to process everything
        delay(2);       
       }
    } 
}
