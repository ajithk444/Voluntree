import 'package:call_for_code_2019/widgets/FramedPolyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VictimInfoUI {
  final String name;
  final String lastName;
  final DateTime requestTimeStamp;
  final String phoneNumber;
  final int peopleCount;
  final String notes;
  final LatLng currentLocation;
  final String addressInfo;
  final FramedPolyline desiredRoute;

  VictimInfoUI(
      this.name,
      this.lastName,
      this.requestTimeStamp,
      this.phoneNumber,
      this.peopleCount,
      this.notes,
      this.currentLocation,
      this.addressInfo,
      this.desiredRoute);
}
