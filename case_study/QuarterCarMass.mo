model QuarterCarMass
  parameter Real quarter_car_mass = 208;
  Modelica.Mechanics.Translational.Sources.ConstantForce gravity_car(f_constant = -Modelica.Constants.g_n*quarter_car_mass);
  Modelica.Mechanics.Translational.Components.Mass quarter_car(m = quarter_car_mass);
  Modelica.Mechanics.Translational.Sensors.PositionSensor mass_position_sensor;
  Real mass_position;
  Real suspension_force_input;
  Modelica.Mechanics.Translational.Sources.Force suspension_force;
initial equation
  quarter_car.a = 0.0;
  quarter_car.v = 0.0;
equation
  // Connect quarter car mass with gravity
  connect(quarter_car.flange_a, gravity_car.flange);
  connect(mass_position_sensor.flange, quarter_car.flange_a);
  mass_position = mass_position_sensor.s;
  suspension_force_input = suspension_force.f;
  connect(suspension_force.flange, quarter_car.flange_b);
end QuarterCarMass;
