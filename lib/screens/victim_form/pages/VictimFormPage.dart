import 'package:call_for_code_2019/data/ui/VictimFormDataUI.dart';
import 'package:call_for_code_2019/screens/victim_form/pages/VictimFormPageIB.dart';
import 'package:call_for_code_2019/screens/map/viewmodels/P2PMapController.dart';
import 'package:call_for_code_2019/screens/victim_form/viewmodels/VictimFormViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'IVictimFormPage.dart';
import 'VictimFormInjector.dart';
import 'VictimFormPageController.dart';

class VictimFormPage extends StatefulWidget {
  final VictimFormDataUI victimFormData;
  final VictimFormPageController controller;
  final Function() onVictimInfoUploaded;

  VictimFormPage({this.victimFormData, this.controller, this.onVictimInfoUploaded});

  @override
  State<StatefulWidget> createState() => VictimFormPageState();
}

class VictimFormPageState extends State<VictimFormPage> implements IVictimFormPage, VictimFormPageDelegate {
  VictimFormViewModel _viewModel;

  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _commentsFocusNode = FocusNode();
  final P2PMapController _p2pMapController = P2PMapController();

  @override
  void initState() {
    widget.controller.setVictimFormPage(this);
    _viewModel = VictimFormInjector.injectViewModel(this);
    widget.controller.destinationAddress.text = widget.victimFormData.destinationAddress;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => VictimFormPageIB.build(
      widget.controller.destinationAddress,
      widget.victimFormData.hasDisability,
      widget.victimFormData.hasKids,
      widget.victimFormData.hasInjuries,
      widget.victimFormData.peopleCount,
      _p2pMapController,
      widget.victimFormData.victimLocation,
      _phoneFocusNode,
      _commentsFocusNode,
      widget.controller.name,
      onNameSubmitted,
      widget.controller.phone,
      onPhoneSubmitted,
      widget.controller.comments,
      onCommentsSubmitted,
      onChangedHasDisability,
      onChangedHasKids,
      onChangedHasInjuries,
      onChangedPeopleCounter, onMapCreated);

  void onNameSubmitted() => FocusScope.of(context).requestFocus(_phoneFocusNode);

  void onPhoneSubmitted() => FocusScope.of(context).requestFocus(_commentsFocusNode);

  void onCommentsSubmitted() => FocusScope.of(context).requestFocus(FocusNode());

  void onChangedHasDisability(bool state) => widget.victimFormData.hasDisability = state;

  void onChangedPeopleCounter(int number) => widget.victimFormData.peopleCount = number;

  void onChangedHasKids(bool state) => widget.victimFormData.hasKids = state;

  void onChangedHasInjuries(bool state) => widget.victimFormData.hasInjuries = state;

  void onMapCreated(GoogleMapController controller) async =>
      widget.victimFormData.victimLocation = LatLng(41.646063, -4.722433);

  // MARK - VictimFormViewModel methods
  @override
  void onVictimInfoUploaded() => widget.onVictimInfoUploaded();

  // MARK - VictimFormPageControllerDelegate methods
  @override
  void onVictimInfo(VictimFormDataUI withInfo) => _viewModel.uploadVictim(withInfo);
}
