import 'package:call_for_code_2019/screens/help_type_selector_victim/pages/HelpTypeSelectorPageIB.dart';
import 'package:call_for_code_2019/screens/helper_form/nav_controllers/HelperFormNavController.dart';
import 'package:flutter/material.dart';


class HelpTypeSelectorHelperPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HelpTypeSelectorHelperPageState();
}

class HelpTypeSelectorHelperPageState
    extends State<HelpTypeSelectorHelperPage> {
  @override
  Widget build(BuildContext context) => HelpTypeSelectorPageIB.build(
    title: "What type of help\ncan you give?",
      context: context,
      onTapLeftTopCard: onTopLeftButtonSelected
  );

  void onTopLeftButtonSelected() => Navigator.pushNamed(context, HelperFormNavController.routeName);
}
