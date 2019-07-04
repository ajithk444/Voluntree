import 'package:call_for_code_2019/PushNotifications/PushNotifications.dart';
import 'package:call_for_code_2019/screens/help_type_selector_helper/nav_controllers/HelpTypeSelectorHelperNavController.dart';
import 'package:call_for_code_2019/screens/help_type_selector_victim/nav_controllers/HelpTypeSelectorVictimNavController.dart';
import 'package:call_for_code_2019/screens/home/viewmodels/HomePageViewModel.dart';
import 'package:flutter/material.dart';
import 'HomePageIB.dart';
import 'IHomePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements IHomePage {
  HomePageViewModel viewModel;
  FirebasePushNotifications enabledPush;

  @override
  void initState() {
    this.viewModel = HomePageViewModel(this);
    this.enabledPush = FirebasePushNotifications();
    enabledPush.firebaseCloudMessaging_Listeners();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      HomePageIB.build(context: context, onTappedNeedHelpButton: onTappedNeedHelpButton,onTappedWantHelpButton: onTappedWantHelpButton);

  void onTappedNeedHelpButton() => Navigator.pushNamed(context, HelpTypeSelectorVictimNavController.routeName);

  void onTappedWantHelpButton() => Navigator.pushNamed(context, HelpTypeSelectorHelperNavController.routeName);
}
