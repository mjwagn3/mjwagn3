#ifndef OUTPUTCOMPONENT_h
#define OUTPUTCOMPONENT_h
#include <Arduino.h>
class OutputComponent{
  private:
  bool setOn;
  bool isOn;
  int pin;
  public:
  OutputComponent(int pin);
  void setComponent();
  void turnOn();
  void turnOff();
  bool getIsOn();
};
#endif
