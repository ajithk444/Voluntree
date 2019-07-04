import 'package:call_for_code_2019/screens/help_type_selector_helper/nav_controllers/HelpTypeSelectorHelperNavController.dart';
import 'package:call_for_code_2019/screens/help_type_selector_victim/nav_controllers/HelpTypeSelectorVictimNavController.dart';
import 'package:call_for_code_2019/screens/helper_corfirmation_victim_is_safe/nav_controller/HelperConfirmationVictimIsSafeNavController.dart';
import 'package:call_for_code_2019/screens/helper_form/nav_controllers/HelperFormNavController.dart';
import 'package:call_for_code_2019/screens/helper_reached_destination_confirmation/nav_controller/HelperReachedDestinationNavController.dart';
import 'package:call_for_code_2019/screens/helper_success_picked_up_confirmation_screen/nav_controller/HelperSuccessPickedUpNavController.dart';
import 'package:call_for_code_2019/screens/helper_waiting_victim/nav_controllers/HelperWaitingNavController.dart';
import 'package:call_for_code_2019/screens/home/nav_controllers/HomeNavController.dart';
import 'package:call_for_code_2019/screens/map/navcontrollers/HelperMapNavController.dart';
import 'package:call_for_code_2019/screens/success_picked_up_confirmation_screen/nav_controller/SuccessPickedUpNavController.dart';
import 'package:call_for_code_2019/screens/victim_confirmation_screen/nav_controller/VictimConfirmationNavController.dart';
import 'package:call_for_code_2019/screens/victim_destination_reached_confirmation_screen/nav_controller/VictimDestinationReachedNavController.dart';
import 'package:call_for_code_2019/screens/victim_form/nav_controllers/ShelterPickerNavController.dart';
import 'package:call_for_code_2019/screens/victim_route_helper_info/nav_controller/VictimRouteHelperInfoNavController.dart';
import 'package:call_for_code_2019/screens/victim_route_shelter/nav_controllers/VictimRouteShelterNavController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './resources/themes/AppTheme.dart';

Future<void> main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voluntree',
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: "HomeNavController",
      routes: {
        HelpTypeSelectorHelperNavController.routeName: (context) => HelpTypeSelectorHelperNavController(),
        HelpTypeSelectorVictimNavController.routeName: (context) => HelpTypeSelectorVictimNavController(),
        HelperConfirmationVictimIsSafeNavController.routeName: (context) => HelperConfirmationVictimIsSafeNavController(),
        HelperFormNavController.routeName: (context) => HelperFormNavController(),
        HelperReachedDestinationNavController.routeName: (context) => HelperReachedDestinationNavController(),
        HelperSuccessPickedUpNavController.routeName: (context) => HelperSuccessPickedUpNavController(),
        HomeNavController.routeName: (context) => HomeNavController(),
        SuccessPickedUpNavController.routeName: (context) => SuccessPickedUpNavController(),
        VictimConfirmationNavController.routeName: (context) => VictimConfirmationNavController(),
        VictimDestinationReachedNavController.routeName: (context) => VictimDestinationReachedNavController(),
        ShelterPickerNavController.routeName: (context) => ShelterPickerNavController(),
        HelperMapNavController.routeName: (context) => HelperMapNavController(),
        VictimRouteHelperInfoNavController.routeName: (context) => VictimRouteHelperInfoNavController(),
        VictimRouteShelterNavController.routeName: (context) => VictimRouteShelterNavController(),
        HelperWaitingNavController.routeName: (context) => HelperWaitingNavController(),
      },
    );
  }
}
