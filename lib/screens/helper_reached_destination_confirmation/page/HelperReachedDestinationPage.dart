import 'package:call_for_code_2019/screens/helper_success_picked_up_confirmation_screen/nav_controller/HelperSuccessPickedUpNavController.dart';
import 'package:flutter/material.dart';
import 'HelperReachedDestinationPageIB.dart';

class HelperReachedDestinationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => HelperReachedDestinationPageState();
}

class HelperReachedDestinationPageState extends State<HelperReachedDestinationPage>{
  @override
  Widget build(BuildContext context) => HelperReachedDestinationPageIB.build(onPressed);

  void onPressed() => Navigator.pushNamed(context, HelperSuccessPickedUpNavController.routeName);
}