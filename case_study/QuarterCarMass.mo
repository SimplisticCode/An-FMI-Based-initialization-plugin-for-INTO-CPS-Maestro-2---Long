model QuarterCarMass
  parameter Real quarter_car_mass = 208;
  Modelica.Mechanics.Translational.Sources.ConstantForce gravity_car(f_constant = -Modelica.Constants.g_n*quarter_car_mass);
  Modelica.Mechanics.Translational.Components.Mass quarter_car(m = quarter_car_mass);
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a;
equation
  // Connect quarter car mass with gravity
  connect(quarter_car.flange_b, gravity_car.flange);
  connect(flange_a, quarter_car.flange_a);
end QuarterCarMass;
