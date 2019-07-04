import 'package:call_for_code_2019/utils/NoGlowScrollBehaviour.dart';
import 'package:flutter/material.dart';

class MapCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final Widget leading;
  final String body;
  final List<Widget> bottomButtons;

  const MapCard({Key key, this.title, this.subtitle, this.trailing, this.leading, this.body, this.bottomButtons})
      : super(key: key);

  // If there are buttons and one line of body, optimal card height is 160.
  // If there's only list tile with subtitle, optimal card height is 144.
  @override
  Widget build(BuildContext context) {
    if (bottomButtons.length > 0)
     bottomButtons.insert(1, SizedBox(width: 12.0,));
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Colors.white),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: ListTile(
                dense: true,
                enabled: false,
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 6),
                  child: Text(title, style: Theme.of(context).textTheme.title,overflow: TextOverflow.ellipsis, maxLines: 1,),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 6),
                  child: Text(subtitle, style: Theme.of(context).textTheme.body1, overflow: TextOverflow.ellipsis, maxLines: 1,),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 6),
                  child: Text(trailing, style: Theme.of(context).textTheme.headline),
                ),
                leading: leading,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22.0, bottom: 0.0, top: 6.0),
              child: body == null ? Container(width: 0, height: 0,)
                  : Text(body, style: Theme.of(context).textTheme.body1,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26.0, top: 10, bottom: 12, right: 24.0,),
              child: bottomButtons == null || bottomButtons.isEmpty ? Container(width: 0, height: 0,)
                  : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: bottomButtons),
            )
          ],
        )
    );
  }
}