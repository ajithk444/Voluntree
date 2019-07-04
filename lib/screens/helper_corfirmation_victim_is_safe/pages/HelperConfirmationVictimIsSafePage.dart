import 'package:call_for_code_2019/screens/helper_corfirmation_victim_is_safe/pages/HelperConfirmationVictimIsSafePageIB.dart';
import 'package:call_for_code_2019/screens/helper_form/nav_controllers/HelperFormNavController.dart';
import 'package:flutter/material.dart';

class HelperConfirmationVictimIsSafePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => HelperConfirmationVictimIsSafePageState();
}

class HelperConfirmationVictimIsSafePageState extends State<HelperConfirmationVictimIsSafePage>{
  @override
  Widget build(BuildContext context) => HelperConfirmationVictimIsSafePageIB.build(onPressed);

  void onPressed() => Navigator.popUntil(context, ModalRoute.withName(HelperFormNavController.routeName));
}