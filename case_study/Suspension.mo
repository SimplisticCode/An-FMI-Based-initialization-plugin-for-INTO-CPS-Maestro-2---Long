model Suspension
  parameter Real rubber_stiffness = 127200;
  parameter Real rubber_damping = 10;
  parameter Real tire_mass = 28;
  parameter Real suspension_stiffness = 18709;
  parameter Real suspension_damping = 1300;
  Real car_mass_position;
  Modelica.Mechanics.Translational.Sources.Position car_mass(exact=false);
  Modelica.Mechanics.Translational.Components.SpringDamper suspension(c=suspension_stiffness, d=suspension_damping);
  Modelica.Mechanics.Translational.Sources.ConstantForce gravity_tire(f_constant = -Modelica.Constants.g_n*tire_mass);
  //Modelica.Mechanics.Translational.Sources.ConstantForce gravity_tire(f_constant = 0.0);
  Modelica.Mechanics.Translational.Components.Mass tire(m = tire_mass);
  Modelica.Mechanics.Translational.Components.SpringDamper rubber(c=rubber_stiffness, d=rubber_damping);
  Modelica.Mechanics.Translational.Sources.Position road(exact=false);
  Modelica.Blocks.Interfaces.RealInput road_profile;
  Real suspension_force_output;
  //Modelica.Mechanics.Translational.Sensors.ForceSensor suspension_force;
initial equation
  tire.a = 0.0;
  tire.v = 0.0;
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
  // Connect suspension to quarter car mass
  connect(suspension.flange_b, car_mass.flange);
  car_mass.s_ref = car_mass_position;
  car_mass.flange.f = suspension_force_output;
end Suspension;
