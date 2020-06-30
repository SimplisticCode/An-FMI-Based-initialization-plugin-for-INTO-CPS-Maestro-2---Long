model Suspension
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
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b;
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
  connect(suspension.flange_b, flange_b);
end Suspension;
