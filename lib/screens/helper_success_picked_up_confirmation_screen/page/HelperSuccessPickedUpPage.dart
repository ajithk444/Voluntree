import 'package:call_for_code_2019/screens/helper_corfirmation_victim_is_safe/nav_controller/HelperConfirmationVictimIsSafeNavController.dart';
import 'package:flutter/material.dart';

import 'HelperSuccessPickedUpPageIB.dart';

class HelperSuccessPickedUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => HelperSuccessPickedUpPageState();
}

class HelperSuccessPickedUpPageState extends State<HelperSuccessPickedUpPage>{
  @override
  Widget build(BuildContext context) => HelperSuccessPickedUpPageIB.build(onPressedButton);
  
  void onPressedButton() => Navigator.pushNamed(context, HelperConfirmationVictimIsSafeNavController.routeName);
}