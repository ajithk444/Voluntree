import 'package:call_for_code_2019/data/ui/HelperFormDataUI.dart';
import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/screens/helper_form/pages/HelperFormPageIB.dart';
import 'package:call_for_code_2019/screens/helper_form/viewmodels/HelperFormViewModel.dart';
import 'package:call_for_code_2019/screens/map/viewmodels/P2PMapController.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'HelperFormInjector.dart';
import 'HelperFormPageController.dart';
import 'IHelperFormPage.dart';

class HelperFormPage extends StatefulWidget {
  final HelperFormPageController controller;
  final Function() onHelperInfoUploaded;

  const HelperFormPage({Key key, this.controller, this.onHelperInfoUploaded}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HelperFormPageState();
}

class HelperFormPageState extends State<HelperFormPage> implements IHelperFormPage, HelperFormPageDelegate {
  HelperFormViewModel _viewModel;

  GoogleMapController mapController;
  final P2PMapController p2pMapController = P2PMapController();
  final Set<Marker> _markers = Set<Marker>();
  LatLng _currentLocation = LatLng(41.646063, -4.722433);

  final TextEditingController locationAddress = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _carModelFocusNode = FocusNode();
  final FocusNode _additionalInfoFocusNode = FocusNode();

  @override
  void initState() {
    _viewModel = HelperFormInjector.injectViewModel(this);
    widget.controller.setHelperFormPage(this);
    locationAddress.text = "Plaza San Pablo, S/N";
    super.initState();
  }

  @override
  Widget build(BuildContext context) => HelperFormPageIB.build(
      widget.controller.name,
      widget.controller.phone,
      widget.controller.carModel,
      widget.controller.comments,
      locationAddress,
      p2pMapController,
      widget.controller.peopleCount,
      _currentLocation,
      _markers,
      _nameFocusNode,
      _phoneFocusNode,
      _carModelFocusNode,
      _additionalInfoFocusNode,
      onNameSubmitted,
      onPhoneSubmitted,
      onCarModelSubmitted,
      onAdditionalInfoSubmitted,
      onMapCreated,
      onStepperChanged
  );

  void onNameSubmitted() => FocusScope.of(context).requestFocus(_phoneFocusNode);
  void onPhoneSubmitted() => FocusScope.of(context).requestFocus(_carModelFocusNode);
  void onCarModelSubmitted() => FocusScope.of(context).requestFocus(_additionalInfoFocusNode);
  void onAdditionalInfoSubmitted() => FocusScope.of(context).requestFocus(FocusNode());

  void onStepperChanged(int number) => widget.controller.peopleCount = number;

  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;
 //   final LatLng currentLocation = await p2pMapController.getCurrentLocation();
 //   _currentLocation = currentLocation;
    setState(() => _markers.add(Marker(
        position: _currentLocation,
        icon: BitmapDescriptor.fromAsset(
            Images.carMarker()),
        markerId: MarkerId("helperLocation"))
    ));
    _centerCamera(on: _currentLocation);
  }

  void _centerCamera({LatLng on}) => mapController.animateCamera(CameraUpdate.newLatLng(on));

  @override
  void onHelperInfoUploaded() =>  widget.onHelperInfoUploaded();

  @override
  void onHelperInfo(HelperFormDataUI withInfo) => _viewModel.uploadHelper(withInfo);
}
