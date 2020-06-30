model CoupledQuarterCar
  parameter Real rubber_stiffness = 127200;
  parameter Real rubber_damping = 10;
  parameter Real tire_mass = 28;
  parameter Real suspension_stiffness = 18709;
  parameter Real suspension_damping = 1300;
  Modelica.Mechanics.Translational.Components.SpringDamper suspension(c=suspension_stiffness, d=suspension_damping);
  Modelica.Mechanics.Translational.Sources.ConstantForce gravity_tire(f_constant = -Modelica.Constants.g_n*tire_mass);
  Modelica.Mechanics.Translational.Components.Mass tire(m = tire_mass);
  Modelica.Mechanics.Translational.Components.SpringDamper rubber(c=rubber_stiffness, d=rubber_damping);
  Modelica.Mechanics.Translational.Sources.Position road(exact=false);
  Modelica.Blocks.Interfaces.RealInput road_profile;
  parameter Real quarter_car_mass = 208;
  Modelica.Mechanics.Translational.Sources.ConstantForce gravity_car(f_constant = -Modelica.Constants.g_n*quarter_car_mass);
  Modelica.Mechanics.Translational.Components.Mass quarter_car(m = quarter_car_mass);
  
initial equation
  quarter_car.v = 0.0;
  quarter_car.a = 0.0;
  tire.v = 0.0;
  tire.a = 0.0;

equation

// Connect input road block (a real signal) with road position (a displacement)
  connect(road_profile, road.s_ref);
  // Connect road to tire rubber
  connect(road.flange, rubber.flange_a);
  // Connect tire rubber to tire mass
  connect(rubber.flange_b, tire.flange_a);
  // Connect tire mass to suspension and gravity
  connect(tire.flange_b, suspension.flange_a);
  connect(tire.flange_b, gravity_tire.flange);  
  
  connect(quarter_car.flange_a, gravity_car.flange);
  
  // Cosim scenario
  connect(suspension.flange_b, quarter_car.flange_a);
  
end CoupledQuarterCar;
