import 'package:call_for_code_2019/data/ui/ShelterUI.dart';
import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:call_for_code_2019/resources/images/Images.dart';

class ShelterListPageIB {
  static Widget build({
    Set<ShelterUI> shelters,
    int shelterIndex,
    LatLng initialLocation,
    void Function(int, bool, LatLng, LatLng) onListTilePressed
  }) {
    return ListView.separated(
        itemCount: shelters.length,
        separatorBuilder: (context, index) => Center(
          child: Container(
            width: 3*MediaQuery.of(context).size.width/5,
            height: 1.0,
            color: ColorsManager.headlineTextColor,
          ),
        ),
        itemBuilder: (BuildContext context, int index) {
          final LatLng shelterCoordinates = LatLng(shelters.elementAt(index).latitude, shelters.elementAt(index).longitude);
          return InkWell(
            //TODO Get device's current location and pass it to onListTilePressed
            highlightColor: ColorsManager.shelterSelectedBlue,
            splashColor: ColorsManager.lightBlue,
            onTap: () => onListTilePressed(index, false, initialLocation, shelterCoordinates),
            child: Container(
              color: index == shelterIndex ? ColorsManager.shelterSelectedBlue : Colors
                  .white,
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Image.asset(Images.houseIcon),
                ),
                title: Text(shelters
                    .elementAt(index)
                    .title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),),
                subtitle: Text("${shelters
                    .elementAt(index)
                    .distance} m."),
              ),
            ),
          );
        }
    );
  }
}