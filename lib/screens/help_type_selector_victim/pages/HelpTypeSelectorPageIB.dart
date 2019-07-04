import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:call_for_code_2019/widgets/HelpTypeCard.dart';
import 'package:flutter/material.dart';

class HelpTypeSelectorPageIB {
  static Widget build({BuildContext context,
    String title,
    void Function() onTapLeftTopCard,
    void Function() onTapRightTopCard,
    void Function() onTapLeftBottomCard,
    void Function() onTapRightBottomCard,
  }) => Container(
    padding: EdgeInsets.only(bottom: 44),
    color: ColorsManager.backgroundGrey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:24.0, bottom: 20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.body2,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HelpTypeCard(Images.transportImageButton,"Transportation", onTapLeftTopCard),
            HelpTypeCard(Images.suppliesImageButton ,"Food & supplies", onTapRightTopCard)
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HelpTypeCard(Images.assistanceImageButton,"Medical assistance", onTapLeftBottomCard),
            HelpTypeCard(Images.houseImageButton,"Housing", onTapRightBottomCard)
          ],
        ),
      ],
    ),
  );
}


