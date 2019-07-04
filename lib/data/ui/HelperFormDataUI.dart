import 'package:google_maps_flutter/google_maps_flutter.dart';

class HelperFormDataUI {
  final String name;
  final String phoneNumber ;
  final String carModel;
  final int peopleCounter;
  final String comments;
  final String locationAddress;
  final LatLng location;

  HelperFormDataUI({this.name = "",
    this.phoneNumber = "",
    this.carModel = "",
    this.peopleCounter = 1,
    this.comments = "",
    this.locationAddress = "",
    this.location = const LatLng(0, 0)
  });
}