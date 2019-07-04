import 'package:call_for_code_2019/data/ui/GoogleMapsDirectionsResponseUI.dart';
import 'package:call_for_code_2019/data/ui/VictimInfoUI.dart';
import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:call_for_code_2019/screens/helper_reached_destination_confirmation/nav_controller/HelperReachedDestinationNavController.dart';
import 'package:call_for_code_2019/screens/helper_waiting_victim/nav_controllers/HelperWaitingNavController.dart';
import 'package:call_for_code_2019/screens/map/viewmodels/HelperMapViewModel.dart';
import 'package:call_for_code_2019/screens/map/viewmodels/P2PMapController.dart';
import 'package:call_for_code_2019/utils/GoogleMapsUtils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:call_for_code_2019/data/ui/GoogleMapsRouteUI.dart';

import 'HelperMapViewPageIB.dart';
import 'IHelperMapViewPage.dart';
import 'injectors/HelperMapInjector.dart';

class HelperMapViewPage extends StatefulWidget {
  final List<VictimInfoUI> victims;
  final bool confirmHelp;

  const HelperMapViewPage({Key key, this.victims, this.confirmHelp})
      : super(key: key);

  @override
  _HelperMapViewPageState createState() => _HelperMapViewPageState();
}

class _HelperMapViewPageState extends State<HelperMapViewPage>
    implements IHelperMapViewPage {
  GoogleMapController gmController;
  final P2PMapController mapController = P2PMapController();
  HelperMapViewModel helperMapViewModel;
  double _carouselHeight = 110;

  List<GoogleMapsRouteUI> routes = [];

  final Set<Marker> markers = {};
  final Set<Polyline> polylines = {};

  LatLngBounds cameraBounds;

  BitmapDescriptor _shelterIcon;
  BitmapDescriptor _personIcon;
  BitmapDescriptor _personIconSelected;
  BitmapDescriptor _carMarker;

  //Card data
  bool isLoaded = false;
  int victimSelected = 0;

  @override
  void initState() {
    _loadMarkerImages();
    helperMapViewModel = HelperMapInjector.injectMockViewModel(this);
    super.initState();
  }

  @override
  void didUpdateWidget(HelperMapViewPage oldWidget) {
    if (widget.confirmHelp) setState(() => _carouselHeight = 162);
    super.didUpdateWidget(oldWidget);
  }

  void _loadMarkerImages() async {
    _shelterIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), Images.shelterMarkerSelected());
    _personIconSelected = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), Images.personMarkerSelected());
    _personIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), Images.personMarkerUnselected());
    _carMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), Images.carMarker());
  }

  void onMapCreated(GoogleMapController controller) {
    this.gmController = controller;

    helperMapViewModel.getNearVictims(LatLng(0, 0));
    mapController.loadAffectedAreas();
  }

  @override
  void onRouteReceived(GoogleMapsDirectionsResponseUI routeResponse) {
    setState(() {
      this.routes = routeResponse.routes;

      this.cameraBounds =
          GoogleMapsUtils.addLatitudeOffset(to: routeResponse.bounds);
    });
  }

  void mapRoutesInfoToGoogleMapsItems(List<GoogleMapsRouteUI> routes) {
    markers.clear();
    polylines.clear();

    routes.forEach((route) {
      if (route.startMarker != null) markers.add(route.startMarker);
      if (route.endMarker != null) {
        final icon = routes.last == route
            ? _shelterIcon
            : routes.indexOf(route) == victimSelected
                ? _personIconSelected
                : _personIcon;

        markers.add(route.endMarker.copyWith(iconParam: icon));
      }

      if (route.polyline != null)
        this
            .polylines
            .add(route.polyline.copyWith(colorParam: ColorsManager.routeColor));

      _animateCameraToBounds();

      //Set data to card
      isLoaded = true;

      // MARK - Mocked Origin/Start marker
      final _originLocation = LatLng(41.6203035, -4.7584862);
      final Marker _originMarker = Marker(
          markerId: MarkerId("OriginMarker"),
          position: _originLocation,
          consumeTapEvents: true,
          onTap: () => gmController.animateCamera(CameraUpdate.newLatLng(_originLocation)),
          icon: _carMarker);
      setState(() => markers.add(_originMarker));

      print("IsLoaded: $isLoaded");
    });
  }

  void _animateCameraToBounds() {
    if (this.gmController != null && this.cameraBounds != null)
      this
          .gmController
          .animateCamera(CameraUpdate.newLatLngBounds(this.cameraBounds, 20));
  }

  void onStartPressed() {

  }

  void onCallPressed(String phone) {}

  void onCardChanged(int index) {
    setState(() {
      victimSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (routes.length > 0)
      mapRoutesInfoToGoogleMapsItems(routes);

     return HelperMapViewPageIB.build(mapController,
      isLoaded: isLoaded,
      onMapCreated: onMapCreated,
      markers: markers,
      polylines: polylines,
      victims: widget.victims,
      confirmed: widget.confirmHelp,
      carouselHeight: _carouselHeight,
      onStartPressed: onStartPressed,
      onCallPressed: onCallPressed,
      onPageChanged: onCardChanged);
  }
}
