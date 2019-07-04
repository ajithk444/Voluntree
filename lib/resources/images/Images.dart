import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class Images {
  static String personMarkerSelected() => Platform.isIOS ? "lib/resources/images/personMarkeriOS.png" : "lib/resources/images/personMarker.png";
  static String personMarkerUnselected() => Platform.isIOS ? "lib/resources/images/personMarker_unselectediOS.png" : "lib/resources/images/personMarker_unselected.png";
  static String shelterMarkerSelected() => Platform.isIOS ? "lib/resources/images/shelterMarkeriOS.png" : "lib/resources/images/shelterMarker.png";
  static String shelterMarkerUnselected() => Platform.isIOS ? "lib/resources/images/unselectedShelterMarkeriOS.png": "lib/resources/images/unselectedShelterMarker.png";
  static String helperImageButton = "lib/resources/images/helperImageButton.png";
  static String victimImageButton = "lib/resources/images/victimImageButton.png";
  static String transportImageButton = "lib/resources/images/route.png";
  static String suppliesImageButton = "lib/resources/images/parachute.png";
  static String assistanceImageButton = "lib/resources/images/medicalAssistance.png";
  static String houseImageButton = "lib/resources/images/house.png";
  static String houseIcon = "lib/resources/images/houseIcon.png";
  static String carMarker() => Platform.isIOS ? "lib/resources/images/carMarkeriOS.png" : "lib/resources/images/carMarker.png" ;
  static String victimConfirmationImage = "lib/resources/images/victim_confirmation.png";
  static String bellConfirmationImage = "lib/resources/images/bell.png";
  static String successPickedUpImage = "lib/resources/images/helpervictim.png";
  static String victimSavedImage = "lib/resources/images/victimSaved.png";
  static String confirmationImage = "lib/resources/images/confirmation.png";

}

