model CoupledQuarterCar
  parameter Real rubber_stiffness = 127200;
  parameter Real rubber_damping = 10;
  parameter Real tire_mass = 28;
  parameter Real suspension_stiffness = 18709;
  parameter Real suspension_damping = 1300;
  Real car_mass_position;
  Modelica.Mechanics.Translational.Sources.Position car_mass(exact=false);
  Modelica.Mechanics.Translational.Components.SpringDamper suspension(c=suspension_stiffness, d=suspension_damping);
  Modelica.Mechanics.Translational.Sources.ConstantForce gravity_tire(f_constant = -Modelica.Constants.g_n*tire_mass);
  Modelica.Mechanics.Translational.Components.Mass tire(m = tire_mass);
  Modelica.Mechanics.Translational.Components.SpringDamper rubber(c=rubber_stiffness, d=rubber_damping);
  Modelica.Mechanics.Translational.Sources.Position road(exact=false);
  Real road_profile;
  Real suspension_force_output;
  
  parameter Real quarter_car_mass = 208;
  Modelica.Mechanics.Translational.Sources.ConstantForce gravity_car(f_constant = -Modelica.Constants.g_n*quarter_car_mass);
  Modelica.Mechanics.Translational.Components.Mass quarter_car(m = quarter_car_mass);
  Real mass_position;
  Real suspension_force_input;
  Modelica.Mechanics.Translational.Sources.Force suspension_force;

initial equation

  quarter_car.v = 0.0;
  quarter_car.a = 0.0;
  tire.v = 0.0;
  tire.a = 0.0;
  
  
equation

  // Connect input road block (a real signal) with road position (a displacement)
  road.s_ref = road_profile;
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
  
  
  // Connect quarter car mass with gravity
  connect(quarter_car.flange_b, gravity_car.flange);
  mass_position = quarter_car.s;
  suspension_force.f = suspension_force_input;
  connect(suspension_force.flange, quarter_car.flange_a);
  
  // Cosim scenario
  road_profile = 0.0;
  car_mass_position = mass_position;
  suspension_force_output = suspension_force_input;
  
end CoupledQuarterCar;
