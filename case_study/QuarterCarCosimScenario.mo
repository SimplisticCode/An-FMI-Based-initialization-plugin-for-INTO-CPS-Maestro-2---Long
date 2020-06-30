
model QuarterCarCosimScenario
  Suspension s();
  QuarterCarMass cm();
initial equation
  //cm.car_x = 0.0;
  cm.car_v = 0.0;
  //s.tire_x = 0.0;
  s.tire_v = 0.0;
  cm.a = 0.0;
  s.a = 0.0;
equation
  s.car_x = cm.car_x;
  s.car_v = cm.car_v;
  cm.F_suspension = s.F_suspension;  
end QuarterCarCosimScenario;
