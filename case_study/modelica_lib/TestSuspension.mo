model TestSuspension
  Suspension suspension();
  Real p;
initial equation
  suspension.tire.v = 0;
  suspension.tire.a = 0.0;
  p = 0;
equation
  suspension.road_profile = 0.0;
  suspension.car_mass_position = p;
  der(p) = -1 + suspension.suspension_force_output;
end TestSuspension;
