model QuarterCarMass
  parameter Real quarter_car_mass = 208;
  Modelica.Mechanics.Translational.Sources.ConstantForce gravity_car(f_constant = -Modelica.Constants.g_n*quarter_car_mass);
  Modelica.Mechanics.Translational.Components.Mass quarter_car(m = quarter_car_mass);
  //Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a;
  Modelica.Mechanics.Translational.Sources.Force suspension_force;
  Modelica.Mechanics.Translational.Sensors.PositionSensor mass_position;
equation
  // Connect quarter car mass with gravity
  connect(quarter_car.flange_b, gravity_car.flange);
  //connect(flange_a, quarter_car.flange_a);
  connect(suspension_force.flange, quarter_car.flange_a);
  connect(mass_position.flange, quarter_car.flange_a);
end QuarterCarMass;
