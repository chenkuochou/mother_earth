enum ListenableItem {
  polAirRenewable,
  polAirEV,
  polAirRegulation,
  polWaterReducing,

  chaClimateChange,
  challengePollution,

  devEducation,

  resMoney,
  resTech,
  resPeople,
  resIndustry,
  resGift,
  ;

  get myIndex => switch (this) {
        ListenableItem.polAirRenewable => 0,
        ListenableItem.polAirEV => 1,
        ListenableItem.polAirRegulation => 2,
        ListenableItem.polWaterReducing => 3,
        ListenableItem.chaClimateChange => 0,
        ListenableItem.challengePollution => 1,
        ListenableItem.devEducation => 0,
        ListenableItem.resMoney => 0,
        ListenableItem.resTech => 1,
        ListenableItem.resPeople => 2,
        ListenableItem.resIndustry => 3,
        ListenableItem.resGift => 4,
      };
}
