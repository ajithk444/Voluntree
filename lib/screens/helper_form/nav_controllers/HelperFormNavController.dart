import 'package:call_for_code_2019/data/ui/HelperFormDataUI.dart';
import 'package:call_for_code_2019/screens/helper_form/nav_controllers/HelperFormNavControllerIB.dart';
import 'package:call_for_code_2019/screens/helper_form/pages/HelperFormPageController.dart';
import 'package:call_for_code_2019/screens/helper_waiting_victim/nav_controllers/HelperWaitingNavController.dart';
import 'package:flutter/material.dart';

class HelperFormNavController extends StatefulWidget {
  static final String routeName = "HelperFormNavController";

  @override
  State<StatefulWidget> createState() => HelperFormNavControllerState();
}

class HelperFormNavControllerState extends State<HelperFormNavController> {
  final HelperFormPageController _helperFormPageController = HelperFormPageController();

  @override
  Widget build(BuildContext context) =>
      HelperFormNavControllerIB.build(onPressed, _helperFormPageController, onHelperInfoUploaded);

  void onPressed()  {
    FocusScope.of(context).requestFocus(FocusNode());
    final info = _helperFormPageController.getHelperData(HelperFormDataUI());
    _helperFormPageController.uploadData(info);
  }

  void onHelperInfoUploaded() => Navigator.pushNamed(context, HelperWaitingNavController.routeName);
}
