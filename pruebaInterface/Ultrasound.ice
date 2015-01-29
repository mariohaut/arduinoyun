#ifndef ULTRASOUND_ICE
#define ULTRASOUND_ICE

module RoboCompUltrasound
{
 exception HardwareFailedException{ string what; };
 exception UnknownSensorException{ string what; };

 struct BusParams
 {
 int numSensors;
 int baudRate;
 int basicPeriod;
 };
 struct SensorParams
 {
 string device;
 int busId;
 string name;

 };
 sequence<SensorParams> SensorParamsList;

 sequence<int> SensorsState;

 interface Ultrasound
 {
 BusParams getBusParams();
 SensorParams getSensorParams(string sensor);
 SensorParamsList getAllSensorParams();

 int getSensorDistance(string sensor) throws UnknownSensorException, HardwareFailedException; 
 SensorsState getAllSensorDistances() throws UnknownSensorException, HardwareFailedException; 

 };
};

#endif
