import 'package:call_for_code_2019/data/ui/ShelterUI.dart';
import 'package:call_for_code_2019/screens/map/viewmodels/P2PMapController.dart';
import 'package:call_for_code_2019/screens/map/views/P2PMap.dart';
import 'package:call_for_code_2019/utils/NoGlowScrollBehaviour.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShelterMapPageIB {
  static Widget build({
    BuildContext context,
    Function(GoogleMapController) onMapCreated,
    Function({int at}) onShelterSelected,
    Set<Circle> circles,
    Set<Marker> shelterMarkers,
    Set<Polyline> polylines,
    Set<ShelterUI> shelters,
    LatLng cameraCenter,
    bool isMock,
    P2PMapController p2pMapController,
    CarouselSlider carousel
  }) {
    final _stackList = <Widget>[
      P2PMap(p2pMapController,
        onMapCreated: (controller) => onMapCreated(controller),
        circles: circles,
        markers: shelterMarkers,
        polylines: polylines,
        cameraCenter: cameraCenter,
        isMock: isMock,
        myLocationEnabled: true,
      ),
      Positioned(
        bottom: 36.0,
        left: 0.0,
        right: 0.0,
        child: carousel == null ? Container(width: 0.0, height: 0.0) : carousel
      )
    ];
    return Stack(children: _stackList,);
  }
}