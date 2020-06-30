model Suspension
  parameter Real rubber_stiffness = 127200;
  parameter Real rubber_damping = 10;
  parameter Real tire_mass = 28;
  parameter Real suspension_stiffness = 18709;
  parameter Real suspension_damping = 1300;
  parameter Real f_gravity = 9.81 * tire_mass;
  Real tire_x, tire_v, F_rubber;
  input Real car_x, car_v;
  output Real F_suspension;
  Real F_total;
equation
  der(tire_x) = tire_v;
  F_total = F_rubber + F_suspension - f_gravity;
  tire_mass * der(tire_v) = F_total;
  F_rubber = - rubber_stiffness*tire_x - rubber_damping * tire_v;
  F_suspension = suspension_stiffness*(car_x - tire_x) + suspension_damping*(car_v - tire_v);
end Suspension;
