
model QuarterCarCosimScenario
  Suspension s();
  QuarterCarMass cm();
initial equation
  //cm.quarter_car.s = 0.0;
  cm.quarter_car.v = 0.0;
  //s.tire.s = 0.0;
  s.tire.v = 0.0;
  
  //cm.quarter_car.v = 0.0;
  cm.quarter_car.a = 0.0;
  //s.tire.v = 0.0;
  s.tire.a = 0.0;
equation
  connect(s.flange_b, cm.flange_a);
  s.road_profile = 0.0;
end QuarterCarCosimScenario;
