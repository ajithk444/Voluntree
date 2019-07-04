import 'package:call_for_code_2019/data/ui/VictimFormDataUI.dart';
import 'package:call_for_code_2019/screens/victim_confirmation_screen/nav_controller/VictimConfirmationNavController.dart';
import 'package:call_for_code_2019/screens/victim_form/pages/VictimFormPageController.dart';
import 'package:flutter/material.dart';
import './VictimFormNavControllerIB.dart';

class VictimFormNavController extends StatefulWidget {
  final VictimFormDataUI victimFormData;
  VictimFormNavController(this.victimFormData);

  @override
  State<StatefulWidget> createState() => VictimFormNavControllerState();
}

class VictimFormNavControllerState extends State<VictimFormNavController> {
  final VictimFormPageController _victimFormPageController = VictimFormPageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => VictimFormNavControllerIB.build(
      onRequestPressed,
      _victimFormPageController,
      widget.victimFormData,
      onVictimInfoUploaded
  );

  void onRequestPressed() {
    FocusScope.of(context).requestFocus(FocusNode());
    final info = _victimFormPageController.getVictimData(widget.victimFormData);
    _victimFormPageController.uploadData(info);
  }

  void onVictimInfoUploaded() => Navigator.pushNamed(context, VictimConfirmationNavController.routeName);
}
