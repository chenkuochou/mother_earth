import 'package:mother_earth/data/solution_data.dart';

enum ListenableItem {
  polAirRenewable,
  polAirEV,
  polAirRegulation,
  polWaterReducing
  ;

   get provider => switch (this) {
        ListenableItem.polAirRenewable => airRenewable,
        ListenableItem.polAirEV => airEV,
        ListenableItem.polAirRegulation => airRegulation,
        ListenableItem.polWaterReducing => waterReducing,
      };
}
