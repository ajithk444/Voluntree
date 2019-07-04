import 'package:call_for_code_2019/data/ui/VictimInfoUI.dart';
import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:call_for_code_2019/screens/helper_reached_destination_confirmation/nav_controller/HelperReachedDestinationNavController.dart';
import 'package:call_for_code_2019/screens/helper_waiting_victim/nav_controllers/HelperWaitingNavController.dart';
import 'package:call_for_code_2019/screens/map/views/HelperMapViewPage.dart';
import 'package:flutter/material.dart';

import 'HelperMapArguments.dart';
import 'HelperMapNavControllerIB.dart';

class HelperMapNavController extends StatefulWidget {
  static final routeName = "HelperMapNavController";

  @override
  _HelperMapNavControllerState createState() => _HelperMapNavControllerState();
}

class _HelperMapNavControllerState extends State<HelperMapNavController> {
  List<VictimInfoUI> victims;

  HelperMapViewPage page;

  bool confirmHelp = false;

  void onHelpTap() {
    confirmHelp
    ? _onStartTap()
    : _showConfirmationDialog();
  }

  void _onStartTap() {
    Navigator.pushNamed(
        context, HelperReachedDestinationNavController.routeName);
  }

  void _showConfirmationDialog() {
    void _closeDialog(BuildContext context) {
      Navigator.of(context).pop();
    }

    String victimName = "";

    victims.forEach((victim) {
      if (victims.indexOf(victim) != 0) victimName += " & ";

      victimName += victim.name;
    });

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Help $victimName?"),
              content: Text("We will let him know you are going to help him."),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "CANCEL",
                    style: TextStyle(color: ColorsManager.lightBlue),
                  ),
                  onPressed: () {
                    _closeDialog(context);
                  },
                ),
                FlatButton(
                  child: Text(
                    "YES",
                    style: TextStyle(color: ColorsManager.lightBlue),
                  ),
                  onPressed: () {
                    _confirmHelpTap();
                    _closeDialog(context);
                  },
                ),
              ],
            ));
  }

  void _confirmHelpTap() {
    setState(() {
      confirmHelp = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final HelperMapArguments args = ModalRoute.of(context).settings.arguments;
    if (args != null) this.victims = args.victims;

    this.page = HelperMapViewPage(victims: victims, confirmHelp: confirmHelp,);

    return HelperMapNavControllerIB.build(context, page, confirmHelp, onHelpTap);
  }
}
