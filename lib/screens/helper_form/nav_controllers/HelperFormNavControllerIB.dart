import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:call_for_code_2019/screens/helper_form/pages/HelperFormPageController.dart';
import 'package:flutter/material.dart';
import 'package:call_for_code_2019/screens/helper_form/pages/HelperFormPage.dart';

abstract class HelperFormNavControllerIB {
  static Widget build(
      Function() onPressed,
      HelperFormPageController controller,
      Function() onHelperInfoUploaded,
      ) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help someone",
            style: TextStyle(fontWeight: FontWeight.w500)),
        actions: <Widget>[
          FlatButton(onPressed: onPressed,
            child: Text("HELP",style: TextStyle(color: ColorsManager.lightBlue,fontWeight: FontWeight.w500,letterSpacing: 1.2),
            ),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
        ],
      ),
      body: HelperFormPage(controller: controller, onHelperInfoUploaded: onHelperInfoUploaded,),
    );
  }
}
