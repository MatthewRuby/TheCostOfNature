int switchPinQ = 5;      //  digital input pin for a switch
int switchPinN = 4;      //  digital input pin for a switch
int switchPinP = 3;      //  digital input pin for a switch
int switchPinD = 2;      //  digital input pin for a switch

int lightRelay = 7;   //  digital output pin for Light
int waterRelay = 8;   //  digital output pin for Water

int switchStateQ = 0;    // the state of the Q switch
int switchStateN = 0;    // the state of the N switch
int switchStateP = 0;    // the state of the P switch
int switchStateD = 0;    // the state of the D switch

long value = 0;

long lightMillis = 0;        // will store last time LED was updated
long waterMillis = 0;

long intervalQ = 250000;           // interval for QUARTERS
long intervalN = 50000;           // interval for NICKLES
long intervalP = 10000;           // interval for PENNIES
long intervalD = 100000;           // interval for DIMES


void setup() {
   pinMode(switchPinQ, INPUT);       // set the switch pin to be an input
   pinMode(switchPinN, INPUT);       // set the switch pin to be an input
   pinMode(switchPinP, INPUT);       // set the switch pin to be an input
   pinMode(switchPinD, INPUT);       // set the switch pin to be an input
   pinMode(lightRelay, OUTPUT);   // set the yellow LED pin to be an output
   pinMode(waterRelay, OUTPUT);   // set the yellow LED pin to be an output
   Serial.begin(9600);
}

 void loop() {
     // read the QUARTER switch input:
   switchStateQ = digitalRead(switchPinQ);
     if (switchStateQ == 1) {
       // if the switch is CLOSED
      
     } else {
         // if the switch is OPEN
         delay(200);
         lightMillis = (millis() + intervalQ);
         waterMillis = (millis() + (intervalQ/3));
     }

      // read the NICKLE switch input:
   switchStateN = digitalRead(switchPinN);
     if (switchStateN == 1) {
       // if the switch is CLOSED
     } 
     else {
       // if the switch is OPEN
       delay(200);
       lightMillis = (millis() + intervalN);
       waterMillis = (millis() + (intervalN/3));
     }
  
      // read the PENNY switch input:
   switchStateP = digitalRead(switchPinP);
     if (switchStateP == 1) {
       // if the switch is CLOSED
     } 
     else {
       // if the switch is OPEN
       delay(200);
       lightMillis = (millis() + intervalP);
       waterMillis = (millis() + intervalP/3);
     }
   
      // read the DIME switch input:
   switchStateD = digitalRead(switchPinD);
     if (switchStateD == 1) {
       // if the switch is CLOSED
     } 
     else {
       // if the switch is OPEN
       delay(200);
       lightMillis = (millis() + intervalD);
       waterMillis = (millis() + (intervalD/3));
     }

    // detect time and turn power on
  if (lightMillis > millis()) { 
     digitalWrite(lightRelay, HIGH);    // turn ON the LIGHT
  } else {
     digitalWrite(lightRelay, LOW);    // turn OFF the LIGHT
  }
  
  if (waterMillis > millis()) { 
     digitalWrite(waterRelay, HIGH);    // turn ON the WATER
  } else {
     digitalWrite(waterRelay, LOW);    // turn OFF the WATER
  }
}
