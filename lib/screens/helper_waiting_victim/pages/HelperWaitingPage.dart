import 'package:flutter/material.dart';

import 'HelperWaitingPageIB.dart';

class HelperWaitingPage extends StatefulWidget {

  final Function() onContinue;

  const HelperWaitingPage(this.onContinue, {Key key}) : super(key: key);

  @override
  _HelperWaitingPageState createState() => _HelperWaitingPageState();
}

class _HelperWaitingPageState extends State<HelperWaitingPage> {

  @override
  void initState() {
    navigateAfterDelay();
    super.initState();
  }

  void navigateAfterDelay() async {
    await Future.delayed(Duration(seconds: 3));
    widget.onContinue();
  }

  @override
  Widget build(BuildContext context) => HelperWaitingPageIB.build();
}
