
model QuarterCarCosimScenario
  Suspension suspension();
  QuarterCarMass car_mass();
equation
  suspension.road_profile = 0.0;
  suspension.car_mass_position = car_mass.mass_position;
  suspension.suspension_force_output = car_mass.suspension_force_input;
end QuarterCarCosimScenario;
