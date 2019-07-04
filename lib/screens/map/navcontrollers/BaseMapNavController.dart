import 'package:call_for_code_2019/widgets/BaseMapNavController.dart';
import 'package:flutter/material.dart';


abstract class BaseMapNavControllerState<T extends StatefulWidget> extends State<T> {
  Widget build(BuildContext context) => BaseMapNavController(
    context: context,
    appBarTitle: "People to help",
    page: getPages()[0],
  );

  List<Widget> getPages();

  List<BottomNavigationBarItem> getBottomNavBarItems();
}