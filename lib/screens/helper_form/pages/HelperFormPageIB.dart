import 'package:call_for_code_2019/screens/map/viewmodels/P2PMapController.dart';
import 'package:call_for_code_2019/screens/map/views/P2PMap.dart';
import 'package:call_for_code_2019/widgets/FormTextField.dart';
import 'package:call_for_code_2019/widgets/StepperForm.dart';
import 'package:call_for_code_2019/widgets/TitledFormSection.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class HelperFormPageIB {
  static Widget build(
      TextEditingController name,
      TextEditingController phone,
      TextEditingController carModel,
      TextEditingController comments,
      TextEditingController locationAddress,
      P2PMapController mapController,
      int peopleCount,
      LatLng location,
      Set<Marker> markers,
      FocusNode nameFocusNode,
      FocusNode phoneFocusNode,
      FocusNode carModelFocusNode,
      FocusNode additionalInfoFocusNode,
      void Function() onNameSubmitted,
      void Function() onPhoneNumberSubmitted,
      void Function() onCarModelSubmitted,
      void Function() onAdditionalInfoSubmitted,
      void Function(GoogleMapController controller) onMapCreated,
      void Function(int number) onStepperChanged) {

    final _separationBox = SizedBox(height: 12.0,);

    return Container(
        child: ListView(
          padding: const EdgeInsets.only(top: 6.0, bottom: 32.0),
          children: <Widget>[
            mapSection(locationAddress, location, mapController, markers, onMapCreated),
            _separationBox,
            TitledFormSection("Contact info", [
              Container(
                child: FormTextField("Name", TextInputType.text,30, controller: name, focusNode: nameFocusNode, onSubmitted: onNameSubmitted,),
              ),
              Container(child: FormTextField("Phone number", TextInputType.phone,30, controller: phone, focusNode: phoneFocusNode, onSubmitted: onPhoneNumberSubmitted,)),
              Container(child: FormTextField("Car model", TextInputType.text,30, controller: carModel, focusNode: carModelFocusNode, onSubmitted: onCarModelSubmitted,)),
            ]),
            _separationBox,
            TitledFormSection("Capacity", [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "People",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "10 people max.",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                  StepperForm(peopleCount, (number) {
                    onStepperChanged(number);
                  })
                ],
              ),
            ]),
            _separationBox,
            TitledFormSection(
                "Comments", [FormTextField(" Additional info", TextInputType.text,140, controller: comments, focusNode: additionalInfoFocusNode, onSubmitted: onAdditionalInfoSubmitted,)])
          ],
        ));
  }

  static Widget mapSection(
      TextEditingController controller,
      LatLng onLocation,
      P2PMapController p2pMapController,
      Set<Marker> markers,
      void Function(GoogleMapController controller) onMapCreated) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 18.0, left: 18.0),
            child: Text(
              "Your location",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            height: 230,
            child: P2PMap(
              p2pMapController,
              isMock: true,
              myLocationEnabled: false,
              cameraCenter: onLocation,
              onMapCreated: (controller) => onMapCreated(controller),
              markers: markers
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              style: TextStyle(fontSize: 16),
              controller: controller,
              enabled: false,
              decoration: InputDecoration(labelText: 'Location'),
            ),
          )
        ]);
  }
}
