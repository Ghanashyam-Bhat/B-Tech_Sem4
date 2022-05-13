char t;
int trigPin = 4;      // trig pin of HC-SR04
int echoPin = 3;     // Echo pin of HC-SR04

void setup() {
pinMode(13,OUTPUT);   //left motors forward
pinMode(12,OUTPUT);   //left motors reverse
pinMode(11,OUTPUT);   //right motors forward
pinMode(10,OUTPUT);   //right motors reverse
pinMode(trigPin, OUTPUT);         // set trig pin as output
pinMode(echoPin, INPUT);     
Serial.begin(9600);
 
}
 
void loop() {



if(Serial.available()){
  t = Serial.read();
  Serial.println(t);
}
digitalWrite(trigPin, LOW);
delayMicroseconds(2);   
digitalWrite(trigPin, HIGH);     // send waves for 10 us
delayMicroseconds(10);
float duration = pulseIn(echoPin, HIGH); // receive reflected waves
float distance = duration / 58.2;   // convert to distance
delay(10);
if(distance<4){      //STOP (all motors stop)
  digitalWrite(13,LOW);
  digitalWrite(12,LOW);
  digitalWrite(11,LOW);
  digitalWrite(10,LOW);
  t = 'S';
}
else{
    
   if(t == 'F'){            //move forward(all motors rotate in forward direction)
  digitalWrite(13,HIGH);
  digitalWrite(11,HIGH);
   /*digitalWrite(12,HIGH);
  digitalWrite(10,HIGH);*/
}
 
else if(t == 'B'){      //move reverse (all motors rotate in reverse direction)
  digitalWrite(12,HIGH);
  digitalWrite(10,HIGH);
}
 
else if(t == 'L'){      //turn right (left side motors rotate in forward direction, right side motors doesn't rotate)
  digitalWrite(11,HIGH);
}
 
else if(t == 'R'){      //turn left (right side motors rotate in forward direction, left side motors doesn't rotate)
  digitalWrite(13,HIGH);
}

else if(t == 'W'){    //turn led on or off)
  digitalWrite(9,HIGH);
}
else if(t == 'w'){
  digitalWrite(9,LOW);
}
 
else if(t == 'S'){      //STOP (all motors stop)
  digitalWrite(13,LOW);
  digitalWrite(12,LOW);
  digitalWrite(11,LOW);
  digitalWrite(10,LOW);
}
delay(100);
}
}
