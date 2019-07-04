import 'package:flutter/material.dart';

class BaseMapNavController extends StatelessWidget {
  final BuildContext context;
  final String appBarTitle;
  final Widget page;


  BaseMapNavController({this.context, this.appBarTitle, this.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Theme.of(context).appBarTheme.color,
      ),
      body: page,
    );
  }
}