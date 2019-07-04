import 'package:call_for_code_2019/data/ui/GoogleMapsDirectionsResponseUI.dart';
import 'package:call_for_code_2019/data/ui/ShelterUI.dart';
import 'package:call_for_code_2019/data/ui/VictimFormDataUI.dart';
import 'package:call_for_code_2019/screens/victim_form/nav_controllers/IShelterPickerNavController.dart';
import 'package:call_for_code_2019/screens/victim_form/nav_controllers/ShelterPickerNavControllerIB.dart';
import 'package:call_for_code_2019/screens/victim_form/pages/ShelterInjector.dart';
import 'package:call_for_code_2019/screens/victim_form/viewmodels/ShelterPickerViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'VictimFormNavController.dart';

class ShelterPickerNavController extends StatefulWidget  {
  static final String routeName = "ShelterPickerNavController";
  @override
  _ShelterPickerNavControllerState createState() => _ShelterPickerNavControllerState();
}

class _ShelterPickerNavControllerState extends State<ShelterPickerNavController>
    with SingleTickerProviderStateMixin
    implements IShelterPickerNavController {

  final String _screenTitle = "Shelter Picker";
  ShelterPickerViewModel _viewModel;
  TabController _tabController;
  int _shelterIndex = 0;
  final Set<ShelterUI> _shelters = Set<ShelterUI>();
  final LatLng initialLocation = LatLng(41.65516, -4.7237);
  Set<GoogleMapsDirectionsResponseUI> _directions = Set<GoogleMapsDirectionsResponseUI>();

  @override
  void initState() {
    _viewModel = ShelterInjector.injectMockViewModel(this);
    _tabController = TabController(length: 2, vsync: this);
    _viewModel.getShelters();
    super.initState();
  }

  void onShelterSelected(int index, bool fromMapView, LatLng currentLocation, LatLng shelterLocation) {
    if (fromMapView == false) _tabController.animateTo(0, curve: Curves.easeInOut);
    _viewModel.getRoute(from: currentLocation, to: shelterLocation);
    setState(() => _shelterIndex = index);
  }

  void onContinue(LatLng victimLocation, LatLng destination, String destinationAddress) {
    final victimData = VictimFormDataUI(
        destinationAddress: destinationAddress,
        destination: destination,
        victimLocation: victimLocation
    );
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => VictimFormNavController(victimData)));
  }

  @override
  Widget build(BuildContext context) => ShelterPickerNavControllerIB.build(
      controller: _tabController,
      appTitle: _screenTitle,
      shelters: _shelters,
      shelterIndex: _shelterIndex,
      directions: _directions,
      onShelterSelected: onShelterSelected,
      onContinue: onContinue,
      initialLocation: initialLocation
  );

  @override
  void onSheltersReceived(Set<ShelterUI> shelters) {
    setState(() {
      _shelters.addAll(shelters);
      onShelterSelected(
          0,
          true,
          initialLocation,
          LatLng(shelters.first.latitude, shelters.first.longitude));
    });
  }

  @override
  void onRouteReceived(GoogleMapsDirectionsResponseUI directions) => setState(() => _directions = {directions});

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}