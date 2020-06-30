model QuarterCarMass
  parameter Real quarter_car_mass = 208;
  output Real car_x, car_v;
  input Real F_suspension;
  Real F_total;
  parameter Real f_gravity = 9.81 * quarter_car_mass;
equation
  der(car_x) = car_v;
  F_total = - F_suspension - f_gravity;
  quarter_car_mass * der(car_v) = F_total;
end QuarterCarMass;
