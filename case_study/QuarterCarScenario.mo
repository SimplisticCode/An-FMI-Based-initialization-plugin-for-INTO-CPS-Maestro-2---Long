
model QuarterCarScenario
  QuarterCar quarter_car;
  Modelica.Blocks.Sources.TimeTable road_profile_table(table=[0, 0;
                                                              1, 0;
                                                              2, -0.04;
                                                              3, -0.04;
                                                              4, 0;
                                                              5, 0
                                                              ]);
initial equation
  quarter_car.v = 0.0;
  quarter_car.a = 0.0;
  tire.v = 0.0;
  tire.a = 0.0;
equation
  connect(quarter_car.road_profile, road_profile_table.y);
end QuarterCarScenario;
