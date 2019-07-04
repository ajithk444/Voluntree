import 'package:call_for_code_2019/data/ui/VictimInfoUI.dart';
import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:call_for_code_2019/screens/map/viewmodels/P2PMapController.dart';
import 'package:call_for_code_2019/widgets/MapCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'P2PMap.dart';

class HelperMapViewPageIB {
  static Widget build(P2PMapController controller,
      {void Function(GoogleMapController) onMapCreated,
        Set<Marker> markers,
        Set<Polyline> polylines = const {},
        bool isLoaded = false,
        List<VictimInfoUI> victims,
        int peopleCount,
        String comments = "",
        double distance = 0,
        bool confirmed = false,
        double carouselHeight = 144,
        Function() onStartPressed,
        Function(String phone) onCallPressed,
        Function(int index) onPageChanged}) {
//    victim = "John";
//    peopleCount = 3;
//    distance = 2.9;
//    comments =
//    "My wife, my 3 years old kid and me. We are close to the bakery";

    return Stack(children: <Widget>[
      P2PMap(
        controller,
        isMock: true,
        onMapCreated: onMapCreated,
        polylines: polylines,
        markers: markers,
      ),
      Positioned(
          bottom: 30.0,
          right: 0,
          left: 0,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 350),
            curve: Curves.easeInOut,
            height: carouselHeight,
            child: CarouselSlider(
              enableInfiniteScroll: false,
              enlargeCenterPage: false,
              onPageChanged: onPageChanged,
              items: _buildCarouselItems(
                  victims, isLoaded, confirmed, onStartPressed, onCallPressed),
            ),
          )
      ),
    ]);
  }

  static List<Builder> _buildCarouselItems(
      List<VictimInfoUI> victims,
      bool isLoaded,
      bool confirmed,
      Function() onStartPressed,
      Function(String phone) onCallPressed) =>
      victims.map((victim) => Builder(builder: (context) {
        Widget cardContent;
        final buttons = <Widget>[];

        if (isLoaded) {
          if (confirmed) {
            buttons.addAll([
              _createCallButton(onCallPressed, victim.phoneNumber)
            ]);
          }

          cardContent = MapCard(
            title: victim.name,
            subtitle: "${victim.peopleCount} people",
            body: victim.notes,
            bottomButtons: buttons,
            trailing: "2.9 km.",
          );
        } else {
          cardContent = Center(
            child: CircularProgressIndicator(),
          );
        }

        return cardContent;

      }))
          .toList();

  static Widget _createStartButton(Function() onStartPressed) => MaterialButton(
    child: Row(
      children: <Widget>[
        Icon(
          Icons.navigation,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "START",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ),
    color: ColorsManager.lightBlue,
    onPressed: onStartPressed,
  );

  static Widget _createCallButton(
      Function(String) onCallPressed, String phoneNumber) =>
      MaterialButton(
        child: Row(
          children: <Widget>[
            Icon(
              Icons.phone,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "CALL",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        color: ColorsManager.buttonGreen,
        onPressed: () {
          onCallPressed(phoneNumber);
        },
      );
}
