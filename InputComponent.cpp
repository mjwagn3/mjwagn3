#include "InputComponent.h"
InputComponent::InputComponent(int pin){
  this->pin=pin;
  setOn = false;
}
void InputComponent::setInputComponent(){
  if(setOn == false){
    setOn = true;
    pinMode(pin,INPUT);
  }
}
int InputComponent::readInput(){
  delay(96);
  return digitalRead(pin);
}
