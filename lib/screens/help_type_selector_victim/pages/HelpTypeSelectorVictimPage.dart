import 'package:call_for_code_2019/screens/help_type_selector_victim/pages/HelpTypeSelectorPageIB.dart';
import 'package:call_for_code_2019/screens/help_type_selector_victim/pages/IHelpTypeSelectorVictimPage.dart';
import 'package:call_for_code_2019/screens/victim_form/nav_controllers/ShelterPickerNavController.dart';
import './../viewmodels/HelpTypeSelectorViewModel.dart';

import 'package:flutter/material.dart';

class HelpTypeSelectorVictimPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HelpTypeSelectorVictimPageState();
}

class HelpTypeSelectorVictimPageState extends State<HelpTypeSelectorVictimPage>
    implements IHelpTypeSelectorVictimPage {
  HelpTypeSelectorVictimViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HelpTypeSelectorVictimViewModel(this);
  }

  @override
  Widget build(BuildContext context) => HelpTypeSelectorPageIB.build(
      title: "What type of help\ndo you need?",
      context: context,
      onTapLeftTopCard: onTappedTopLeftCard,
      onTapRightTopCard: onTapTopRightCard,
      onTapLeftBottomCard: onTapBottomLeftCard,
      onTapRightBottomCard: onTapBottomRightCard);

  void onTappedTopLeftCard() => Navigator.pushNamed(context, ShelterPickerNavController.routeName);

  void onTapTopRightCard() {}
  void onTapBottomRightCard() {}
  void onTapBottomLeftCard() {}
}
