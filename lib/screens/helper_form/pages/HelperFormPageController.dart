import 'package:call_for_code_2019/data/ui/HelperFormDataUI.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class HelperFormPageDelegate {
  void onHelperInfo(HelperFormDataUI withInfo);
}

class HelperFormPageController {
  HelperFormPageDelegate _view;
  int peopleCount = 1;

  final TextEditingController carModel = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController comments = TextEditingController();

  HelperFormDataUI getHelperData(HelperFormDataUI withInfo) => HelperFormDataUI(
      name: name.text,
      phoneNumber: phone.text,
      comments: comments.text,
      peopleCounter: peopleCount,
      locationAddress: withInfo.locationAddress,
      location: withInfo.location,
      carModel: carModel.text
  );

  void setHelperFormPage(HelperFormPageDelegate view) => _view = view;

  void uploadData(HelperFormDataUI info) => _view.onHelperInfo(info);
}