import 'package:call_for_code_2019/data/ui/GoogleMapsDirectionsResponseUI.dart';
import 'package:call_for_code_2019/data/ui/ShelterUI.dart';
import 'package:call_for_code_2019/screens/victim_form/pages/ShelterListPage.dart';
import 'package:call_for_code_2019/screens/victim_form/pages/ShelterMapPage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShelterPickerNavControllerIB {
  static const EdgeInsetsGeometry _padding = EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0);

  static Widget build({
    TabController controller,
    String appTitle,
    Set<ShelterUI> shelters,
    int shelterIndex,
    Set<GoogleMapsDirectionsResponseUI> directions,
    LatLng initialLocation,
    void Function(int, bool, LatLng, LatLng) onShelterSelected,
    void Function(LatLng, LatLng, String) onContinue
  }) => Scaffold(
    appBar: AppBar(
      bottom: TabBar(
          controller: controller,
          tabs: [
            Padding(
              padding: _padding,
              child: Text("MAP"),
            ),
            Padding(
              padding: _padding,
              child: Text("SHELTERS"),
            ),
          ]
      ),
      title: Text(appTitle),
    ),
    body: TabBarView(
      controller: controller,
      physics: NeverScrollableScrollPhysics(),
      children: [
        ShelterMapPage(shelters, shelterIndex, directions, initialLocation, onShelterSelected: onShelterSelected, onContinue: onContinue,),
        ShelterListPage(shelters, shelterIndex, initialLocation, onShelterSelected: onShelterSelected,),
      ],
    ),
  );
}