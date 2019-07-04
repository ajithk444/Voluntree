
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VictimFormDataUI {
  String name;
  String phoneNumber;
  String comments;
  String destinationAddress;

  int peopleCount;
  bool hasDisability;
  bool hasKids;
  bool hasInjuries;

  //Location info
  LatLng victimLocation;
  LatLng destination;

  VictimFormDataUI({this.name = "", this.phoneNumber = "", this.comments = "",
    this.destinationAddress = "", this.peopleCount = 1, this.hasDisability = false, this.hasKids = false, this.hasInjuries = false,
    this.victimLocation = const LatLng(0, 0), this.destination = const LatLng(0, 0)});
}