import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:call_for_code_2019/screens/map/viewmodels/P2PMapController.dart';
import 'package:call_for_code_2019/screens/map/views/P2PMap.dart';
import 'package:call_for_code_2019/widgets/MapCard.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VictimRouteShelterPageIB {
  static Widget build(
      String title,
      String subtitle,
      String trailing,
      LatLng onLocation,
      Set<Marker> markers,
      P2PMapController mapController,
      Set<Polyline> routes,
      void Function(GoogleMapController) onMapCreated,
      void Function() onCallButtonPressed) {
    return Column(
      children: <Widget>[
        Flexible(
            flex: 1,
            child: Container(
                  child: P2PMap(
                  mapController,
                  cameraCenter: onLocation,
                  onMapCreated: onMapCreated,
                  markers: markers,
                  polylines: routes,
                ))
        ),
        Container(
          alignment: Alignment.bottomCenter,
            child: MapCard(
                title: title,
                subtitle: subtitle,
                bottomButtons: <Widget>[
                  FlatButton(
                    color: ColorsManager.buttonGreen,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Text(
                          "CALL",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    onPressed: onCallButtonPressed,
                  )
                ],
                trailing: trailing))
      ],
    );
  }
}