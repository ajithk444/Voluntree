import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:flutter/material.dart';

class HelperMapNavControllerIB {
  static Widget build(BuildContext context, Widget page, bool confirmHelp,
          void Function() onHelpTap) =>
      Scaffold(
        appBar: AppBar(
          title: Text("People to help"),
          backgroundColor: Theme.of(context).appBarTheme.color,
          actions: <Widget>[
            confirmHelp
                ? FlatButton(
                    onPressed: onHelpTap,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.navigation,
                          color: ColorsManager.lightBlue,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "START",
                            style: TextStyle(color: ColorsManager.lightBlue),
                          ),
                        )
                      ],
                    ),
                  )
                : FlatButton(
                    onPressed: onHelpTap,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Text(
                      "HELP",
                      style: TextStyle(color: ColorsManager.lightBlue),
                    ),
                  )
          ],
        ),
        body: page,
      );
}
