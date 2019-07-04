import 'package:flutter/material.dart';

class TitledFormSection extends StatelessWidget {
  String title;
  List<Widget> elementsInSection;

  TitledFormSection(this.title, this.elementsInSection);

  @override
  Widget build(BuildContext context) {
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[],
    );
    column.children.addAll(elementsInSection);

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[formTitle(title), 
        column],
      ),
    );
  }

  Widget formTitle(String title) {
    return  Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize:18.0)),
    );
  }
}
