import 'package:call_for_code_2019/data/ui/GoogleMapsDirectionsResponseUI.dart';
import 'package:call_for_code_2019/data/ui/ShelterUI.dart';
import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:call_for_code_2019/screens/map/viewmodels/P2PMapController.dart';
import 'package:call_for_code_2019/screens/victim_destination_reached_confirmation_screen/nav_controller/VictimDestinationReachedNavController.dart';
import 'package:call_for_code_2019/screens/victim_route_shelter/viewmodels/VictimRouteShelterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'IVictimRouteShelterPage.dart';
import 'VictimRouteShelterInjector.dart';
import 'VictimRouteShelterPageIB.dart';

class VictimRouteShelterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VictimRouteShelterPageState();
}

class VictimRouteShelterPageState extends State<VictimRouteShelterPage>
    implements IVictimRouteShelterPage {
  VictimRouteShelterViewModel _viewModel;
  GoogleMapController _mapController;
  final P2PMapController _p2pMapController = P2PMapController();
  LatLng _currentLocation = LatLng(41.646063, -4.722433);
  final Set<Polyline> _routes = {};
  final Set<Marker> _markers = {};

  //Mock Card Data.
  final String title = "12 min left";
  final String subtitle = "Travelling with Lisa to nearest Shelter";
  final String trailing = "0,9 km";

  @override
  void initState() {
    _viewModel = VictimRouteShelterInjector.injectMockViewModel(this);
    _viewModel.getVictims();
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      VictimRouteShelterPageIB.build(
          title,
          subtitle,
          trailing,
          _currentLocation,
          _markers,
          _p2pMapController,
          _routes,
          onMapCreated,
          _onCallButtonPressed);

  void onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    _p2pMapController.loadAffectedAreas();
    _centerMap(on: _currentLocation);
  }

  void _centerMap({LatLng on}) =>
      _mapController.animateCamera(CameraUpdate.newLatLng(on));

  void _onCallButtonPressed() => Navigator.pushNamed(context, VictimDestinationReachedNavController.routeName);


  void _buildBoundedPolyline({GoogleMapsDirectionsResponseUI from}) {
    from.routes.forEach((route) {
      if (route.polyline != null) setState(() {
        _routes.add(
            route.polyline.copyWith(colorParam: ColorsManager.routeColor));
      });
    });
    if (from.bounds != null) {
      _mapController.animateCamera(CameraUpdate.newLatLngBounds(
          from.bounds,
          65.0)
      );
    }
  }

  @override
  void onRouteReceived(GoogleMapsDirectionsResponseUI directions) =>
      _buildBoundedPolyline(from: directions);

  @override
  void onSheltersReceived(Set<ShelterUI> victims) {
    final shelter = victims.elementAt(0);
    final shelterLocation = LatLng(shelter.latitude, shelter.longitude);
    setState(() => _markers.addAll({
      Marker(
          markerId: MarkerId("currentLocation"),
          position: _currentLocation,
          icon: BitmapDescriptor.fromAsset(Images.carMarker()),
          consumeTapEvents: true,
          onTap: () => _mapController.animateCamera(CameraUpdate.newLatLng(_currentLocation))
      ),
      Marker(
          markerId: MarkerId("shelterLocation"),
          position: shelterLocation,
          icon: BitmapDescriptor.fromAsset(Images.shelterMarkerSelected()),
          consumeTapEvents: true,
          onTap: () => _mapController.animateCamera(CameraUpdate.newLatLng(shelterLocation))
      )
    }));
    _viewModel.getRoute(from: _currentLocation, to: shelterLocation);
  }
}