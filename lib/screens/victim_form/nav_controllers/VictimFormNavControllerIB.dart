import 'package:call_for_code_2019/data/ui/VictimFormDataUI.dart';
import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:call_for_code_2019/screens/victim_form/pages/VictimFormPageController.dart';
import 'package:flutter/material.dart';

import './../pages/VictimFormPage.dart';

abstract class VictimFormNavControllerIB {
  static Widget build(
      void Function() onPressed,
      VictimFormPageController controller,
      VictimFormDataUI victimFormData,
      final Function() onVictimInfoUploaded
      ) => Scaffold(
      appBar: AppBar(
        title: (Text("Ask for help")),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "REQUEST",
              style: TextStyle(color: ColorsManager.lightBlue),
            ),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: onPressed,
          )
        ],
      ),
      body: VictimFormPage(victimFormData: victimFormData, controller: controller, onVictimInfoUploaded: onVictimInfoUploaded,));
}
