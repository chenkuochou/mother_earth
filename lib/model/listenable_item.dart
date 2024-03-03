
enum ListenableItem {
  polAirRenewable,
  polAirEV,
  polAirRegulation,
  polWaterReducing,

  chaClimateChange,
  challengePollution,
  ;

  get notifierIndex => switch (this) {
        ListenableItem.polAirRenewable => 0,
        ListenableItem.polAirEV => 1,
        ListenableItem.polAirRegulation => 2,
        ListenableItem.polWaterReducing => 3,
        ListenableItem.chaClimateChange => 0,
        ListenableItem.challengePollution => 1,
      };
}
