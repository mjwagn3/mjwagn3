#include "OutputComponent.h"
#include "InputComponent.h"

const int NUM_LED = 12;
const int NUM_BUT = 3;
bool comboPressed[NUM_BUT] = {
  false,false,false
};
OutputComponent led[NUM_LED] = {
  OutputComponent(22),
  OutputComponent(24),
  OutputComponent(26),
  OutputComponent(28),
  OutputComponent(30),
  OutputComponent(32),
  OutputComponent(34),
  OutputComponent(36),
  OutputComponent(38),
  OutputComponent(40),
  OutputComponent(42),
  OutputComponent(44)
};
InputComponent button[NUM_BUT] = {
  InputComponent(3),
  InputComponent(4),
  InputComponent(5)
};
OutputComponent buzzer(7);
int curTime = 0;
bool started = false;
bool finished = false;
bool shownCorrectIndex = false;
int selectedIndex = 0;
int correctIndex = 0;

void setCorrectIndex();
void turnAllOn(int numOn);
void turnAllOff(int numOff);

void setLights(int curTime);
void turnOnLeds(int count);

void setup() {
  // put your setup code here, to run once:
  for(int i = 0;i<NUM_LED;i++){
    if(i<NUM_BUT){
      button[i].setInputComponent();
    }
    led[i].setComponent();
  }
  buzzer.setComponent();
  

}

void loop() {
  // put your main code here, to run repeatedly:
  if(!started&&!finished){
    if(shownCorrectIndex==false){
      setCorrectIndex();
      shownCorrectIndex=true;
    }
    if(button[0].readInput()==HIGH&&button[1].readInput()==LOW&&button[2].readInput()==LOW){
      curTime-=5;
      setLights(curTime);
    }
    else if(button[0].readInput()==LOW&&button[1].readInput()==LOW&&button[2].readInput()==HIGH){
      curTime+=5;
      setLights(curTime);
    }else if(button[0].readInput()==LOW&&button[1].readInput()==HIGH&&button[2].readInput()==LOW){
      started=true;
    }
  }else if(started&&!finished){
    
  }else if(!started&&finished){
    
  }
  

}
void setLights(int curTime){
  if(curTime>=0&&curTime<=60){
    turnOnLeds(curTime/5);
  }
}
void turnOnLeds(int count){
  for(int i = count;i<NUM_LED;i++){
    led[i].turnOff();
  }
  for(int i = 0;i<count;i++){
    led[i].turnOn();
  }
}
void setCorrectIndex(){
 correctIndex = random(NUM_LED);
 for(int i = 0;i<2;i++){
 turnOnAll(correctIndex+1);
 buzzer.turnOn();
 delay(5000);
 buzzer.turnOff();
 turnOffAll(correctIndex);
 }
}
void turnOnAll(int numOn){
  for(int i = 0;i<numOn;i++){
    led[i].turnOn();
  }
}
void turnOffAll(int numOff){
  for(int i = numOff;i>=0;i--){
    if(led[i].getIsOn()){
      led[i].turnOff();
    }
  }
}
