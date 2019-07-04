import 'package:call_for_code_2019/screens/success_picked_up_confirmation_screen/nav_controller/SuccessPickedUpNavController.dart';
import 'package:call_for_code_2019/screens/victim_route_helper_info/nav_controller/VictimRouteHelperInfoNavController.dart';
import 'package:flutter/material.dart';

import 'VictimConfirmationPageIB.dart';

class VictimConfirmationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => VictimConfirmationPageState();
}

class VictimConfirmationPageState extends State<VictimConfirmationPage>{
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),
        () => Navigator.pushNamed(context, VictimRouteHelperInfoNavController.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => VictimConfirmationPageIB.build(onPressed);

  void onPressed() => Navigator.pushNamed(context, VictimRouteHelperInfoNavController.routeName);
}