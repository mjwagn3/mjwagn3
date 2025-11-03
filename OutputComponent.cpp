#include "OutputComponent.h"
OutputComponent::OutputComponent(int pin){
  this->pin = pin;
  setOn = false;
}
void OutputComponent::setComponent(){
  if(setOn==false){
    setOn = true;
    pinMode(pin,OUTPUT);
    isOn = false;
  }
}
void OutputComponent::turnOn(){
  if(setOn==true){
    digitalWrite(pin,HIGH);
    isOn = true;
  }
}
void OutputComponent::turnOff(){
  if(setOn==true){
    digitalWrite(pin,LOW);
    isOn=false;
  }
}
bool OutputComponent::getIsOn(){
  return isOn;
}
