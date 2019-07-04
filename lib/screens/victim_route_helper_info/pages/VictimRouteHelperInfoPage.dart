import 'package:call_for_code_2019/data/ui/GoogleMapsDirectionsResponseUI.dart';
import 'package:call_for_code_2019/data/ui/ShelterUI.dart';
import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:call_for_code_2019/screens/map/viewmodels/P2PMapController.dart';
import 'package:call_for_code_2019/screens/success_picked_up_confirmation_screen/nav_controller/SuccessPickedUpNavController.dart';
import 'package:call_for_code_2019/screens/victim_route_helper_info/pages/VictimRouteHelperInjector.dart';
import 'package:call_for_code_2019/screens/victim_route_helper_info/viewmodels/VictimRouteHelperViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'IVictimRouteHelperInfoPage.dart';
import 'VictimRouteHelperInfoPageIB.dart';

class VictimRouteHelperInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VictimRouteHelperInfoPageState();
}

class VictimRouteHelperInfoPageState extends State<VictimRouteHelperInfoPage>
    implements IVictimRouteHelperInfoPage {
  VictimRouteHelperViewModel _viewModel;
  GoogleMapController _mapController;
  final P2PMapController _p2pMapController = P2PMapController();
  LatLng _currentLocation = LatLng(41.65516, -4.7237);
  final Set<Polyline> _routes = {};
  final Set<Marker> _markers = {};

  //Mock Card Data.
  final String title = "8 min left";
  final String subtitle = "Lisa - Black Volkswagen Golf";
  final String trailing = "0,9 km";

  @override
  void initState() {
    _viewModel = VictimRouteHelperInjector.injectMockViewModel(this);
    _viewModel.getVictims();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => VictimRouteHelperInfoPageIB.build(
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

  void _centerMap({LatLng on}) => _mapController.animateCamera(CameraUpdate.newLatLng(on));

  void _onCallButtonPressed() {
    void _closeDialog(BuildContext context) {
      Navigator.of(context).pop();
    }

    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("Did Lisa pick you up?"),
              content: Text("You should be on your way to the shelter."),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "NO",
                    style: TextStyle(color: ColorsManager.lightBlue),
                  ),
                  onPressed: () {
                    _closeDialog(context);
                  },
                ),
                FlatButton(
                  child: Text(
                    "YES",
                    style: TextStyle(color: ColorsManager.lightBlue),
                  ),
                  onPressed: () {
                    _closeDialog(context);
                    Navigator.pushNamed(context, SuccessPickedUpNavController.routeName);
                  },
                ),
              ],
            )
    );
  }

  void _buildBoundedPolyline({GoogleMapsDirectionsResponseUI from}) {
    from.routes.forEach((route) {
      if (route.polyline != null) setState(() {
        _routes.add(route.polyline.copyWith(colorParam: ColorsManager.routeColor));
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
  void onRouteReceived(GoogleMapsDirectionsResponseUI directions) =>  _buildBoundedPolyline(from: directions);

  @override
  void onVictimsReceived(Set<ShelterUI> victims) {
    final victim = victims.elementAt(4);
    final helperLocation = LatLng(victim.latitude, victim.longitude);
    final markers = {
      Marker(
          markerId: MarkerId("currentLocation"),
          position: _currentLocation,
          icon: BitmapDescriptor.fromAsset(Images.carMarker()),
          consumeTapEvents: true,
          onTap: () => _mapController.animateCamera(CameraUpdate.newLatLng(_currentLocation))
      ),
      Marker(
          markerId: MarkerId("helperLocation"),
          position: helperLocation,
          icon: BitmapDescriptor.fromAsset(Images.personMarkerSelected()),
          consumeTapEvents: true,
          onTap: () => _mapController.animateCamera(CameraUpdate.newLatLng(helperLocation))
      )
    };
    setState(() => _markers.addAll(markers));

    _viewModel.getRoute(from: _currentLocation, to: helperLocation);
  }
}
