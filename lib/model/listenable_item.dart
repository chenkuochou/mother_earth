enum ListenableItem {
  cliMitReduce,
  cliMitNature,
  cliMitEfficient,
  cliActFootprint,
  cliActMonitoring,
  cliActGlobal,

  polAirRenewable,
  polAirEV,
  polAirRegulation,
  polWaterReduce,
  polWaterTreatment,
  polWaterFarming,
  polSoiOrganic,
  polSoiRemediation,
  polSoiPlanning,

  bioProProtection,
  bioProHabitat,
  bioProSpecies,
  bioEduAwareness,
  bioEduEngagement,
  bioEduFinancial,

  challengeClimateChange,
  challengePollution,
  challengeBiodiversity,

  devEducation,
  devResearch,
  devFairness,
  devPeaceful,

  resMoney,
  resTech,
  resWildlife,
  resPolitics,
  resHappiness,

  non;

  get myIndex => switch (this) {
        ListenableItem.cliMitReduce => 0,
        ListenableItem.cliMitNature => 1,
        ListenableItem.cliMitEfficient => 2,
        ListenableItem.cliActFootprint => 3,
        ListenableItem.cliActMonitoring => 4,
        ListenableItem.cliActGlobal => 5,
        //
        ListenableItem.polAirRenewable => 0,
        ListenableItem.polAirEV => 1,
        ListenableItem.polAirRegulation => 2,
        ListenableItem.polWaterReduce => 3,
        ListenableItem.polWaterTreatment => 4,
        ListenableItem.polWaterFarming => 5,
        ListenableItem.polSoiOrganic => 6,
        ListenableItem.polSoiRemediation => 7,
        ListenableItem.polSoiPlanning => 8,
        //
        ListenableItem.bioProProtection => 0,
        ListenableItem.bioProHabitat => 1,
        ListenableItem.bioProSpecies => 2,
        ListenableItem.bioEduAwareness => 3,
        ListenableItem.bioEduEngagement => 4,
        ListenableItem.bioEduFinancial => 5,
        //
        ListenableItem.challengeClimateChange => 0,
        ListenableItem.challengePollution => 1,
        ListenableItem.challengeBiodiversity => 2,
        //
        ListenableItem.devEducation => 0,
        ListenableItem.devResearch => 0,
        ListenableItem.devFairness => 0,
        ListenableItem.devPeaceful => 0,
        //
        ListenableItem.resMoney => 0,
        ListenableItem.resTech => 1,
        ListenableItem.resWildlife => 2,
        ListenableItem.resPolitics => 3,
        ListenableItem.resHappiness => 4,
        ListenableItem.non => 0,
      };
}
