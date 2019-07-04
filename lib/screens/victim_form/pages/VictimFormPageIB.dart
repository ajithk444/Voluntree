import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/screens/map/viewmodels/P2PMapController.dart';
import 'package:call_for_code_2019/screens/map/views/P2PMap.dart';
import 'package:call_for_code_2019/widgets/FormTextField.dart';
import 'package:call_for_code_2019/widgets/StepperForm.dart';
import 'package:call_for_code_2019/widgets/TitledFormSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class VictimFormPageIB {
  static Widget build(
      TextEditingController destinationAddress,
      bool disability,
      bool kids,
      bool injuries,
      int peopleCounter,
      P2PMapController mapController,
      LatLng victimLocation,
      FocusNode phoneFocusNode,
      FocusNode commentsFocusNode,
      TextEditingController name,
      void Function() onNameSubmitted,
      TextEditingController phone,
      void Function() onPhoneSubmitted,
      TextEditingController comments,
      void Function() onCommentsSubmitted,
      void Function(bool value) onChangedHasDisability,
      void Function(bool value) onChangedHasKids,
      void Function(bool value) onChangedHasInjuries,
      void Function(int number) onChangedPeopleCounter,
      void Function(GoogleMapController p2pMapController) onMapCreated) {

    final _separationBox = SizedBox(height: 12.0,);

    return Container(
        child: ListView(
            padding: const EdgeInsets.only(top: 6.0, bottom: 32.0),
            children: <Widget>[
              //Contact info Section
              mapSection(
                  destinationAddress, victimLocation, mapController, onMapCreated),
              _separationBox,
              TitledFormSection("Contact info", [
                Container(
                    child: FormTextField(
                      "Name:",
                      TextInputType.text,
                      30,
                      controller: name,
                      onSubmitted: () => onNameSubmitted(),
                    )
                ),
                Container(
                    child: FormTextField(
                      "Phone number:",
                      TextInputType.phone,
                      30,
                      controller: phone,
                      focusNode: phoneFocusNode,
                      onSubmitted: () => onPhoneSubmitted(),
                    )
                )
              ]
              ),

              //People section
              _separationBox,
              TitledFormSection(
                "How many people are you?",
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "People",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("10 people max.",
                              style: TextStyle(fontSize: 12, color: Colors.grey))
                        ],
                      ),
                      StepperForm(peopleCounter, (number) {
                        onChangedPeopleCounter(number);
                      }
                      )
                    ]
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Disability"),
                        Switch(
                          value: disability,
                          onChanged: (value) {
                            onChangedHasDisability(value);
                          },
                        )
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Kids"),
                        Switch(
                          value: kids,
                          onChanged: (value) {
                            onChangedHasKids(value);
                          },
                        )
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Injuries"),
                        Switch(
                          value: injuries,
                          onChanged: (value) {
                            onChangedHasInjuries(value);
                          },
                        )
                      ]
                  ),
                ],
              ),
              _separationBox,
              TitledFormSection(
                  "Comments", [FormTextField(
                "Additional info",
                TextInputType.text,
                140,
                controller: comments,
                focusNode: commentsFocusNode,
                onSubmitted: () => onCommentsSubmitted(),
              )
              ]
              ),
            ]
        )
    );
  }

  static Widget mapSection(
      TextEditingController controller,
      LatLng onLocation,
      P2PMapController p2pMapController,
      void Function(GoogleMapController controller) onMapCreated) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 18.0, left: 18.0),
            child: Text(
              "Route",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            height: 230,
            child: P2PMap(
              P2PMapController(),
              markers: {
                Marker(
                    position: onLocation,
                    markerId: MarkerId("victimPosition"),
                    icon: BitmapDescriptor.fromAsset(
                        Images.shelterMarkerSelected()))
              },
              cameraCenter: onLocation,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              style: TextStyle(fontSize: 16),
              controller: controller,
              enabled: false,
              decoration: InputDecoration(labelText: 'Destination'),
            ),
          )
        ]);
  }
}
