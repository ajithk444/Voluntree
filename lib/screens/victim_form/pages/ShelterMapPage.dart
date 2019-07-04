import 'dart:io';

import 'package:call_for_code_2019/data/ui/GoogleMapsDirectionsResponseUI.dart';
import 'package:call_for_code_2019/data/ui/ShelterUI.dart';
import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:call_for_code_2019/screens/victim_form/pages/ShelterMapPageIB.dart';
import 'package:call_for_code_2019/screens/map/viewmodels/P2PMapController.dart';
import 'package:call_for_code_2019/utils/GoogleMapsUtils.dart';
import 'package:call_for_code_2019/widgets/MapCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShelterMapPage extends StatefulWidget {
  final Set<ShelterUI> _shelters;
  final int _shelterIndex;
  final void Function(int, bool, LatLng, LatLng) onShelterSelected;
  final void Function(LatLng, LatLng, String) onContinue;
  final Set<GoogleMapsDirectionsResponseUI> _directions;
  final LatLng initialLocation;

  ShelterMapPage(this._shelters, this._shelterIndex, this._directions, this.initialLocation,
      {Key key, this.onShelterSelected, this.onContinue}) : super(key: key);

  @override
  _ShelterMapPageState createState() => _ShelterMapPageState();
}

class _ShelterMapPageState extends State<ShelterMapPage>
    with AutomaticKeepAliveClientMixin<ShelterMapPage> {
  int _shelterIndex;

  GoogleMapController _mapController;
  P2PMapController _p2pMapController = P2PMapController();
  LatLng _camCenter = LatLng(0.0, 0.0);
  Set<Marker> _shelterMarkers = Set<Marker>();
  Set<Polyline> _shelterPolylines = Set<Polyline>();
  CarouselSlider _shelterCarousel;
  BitmapDescriptor _shelterIcon;
  BitmapDescriptor _selectedIcon;
  bool _keepAlive = true;
  LatLng currentLocation;

  @override
  void initState() {
    _loadMarkerImages();
    currentLocation = widget.initialLocation;
    super.initState();
  }

  @override
  void didUpdateWidget(ShelterMapPage oldWidget) {
    _updateIndexSelectionFrom(oldWidget);
    _updateShownRoute();
    super.didUpdateWidget(oldWidget);
  }

  void _buildShelterMarkers() {
    _shelterMarkers = mapToMarkers(from: widget._shelters, selectedAt: widget._shelterIndex);
  }

  void _updateIndexSelectionFrom(ShelterMapPage oldWidget) {
    _shelterIndex = widget._shelterIndex;
    final indexDiff = oldWidget._shelterIndex - widget._shelterIndex;
    if (indexDiff.abs() > 1) _jumpCarouselToShelterIndex();
  }

  void _updateShownRoute() {
    _shelterPolylines.clear();
    if (widget._directions != null && widget._directions.isNotEmpty) _buildBoundedPolyline(from: widget._directions.last);
  }

  void _buildBoundedPolyline({GoogleMapsDirectionsResponseUI from}) {
    from.routes.forEach((route) {
      if (route.polyline != null) _shelterPolylines.add(route.polyline.copyWith(colorParam: ColorsManager.routeColor));
    });
    if (from.bounds != null) {
      _mapController.animateCamera(CameraUpdate.newLatLngBounds(
          GoogleMapsUtils.addLatitudeOffset(to: from.bounds),
          35.0)
      );
    }
  }

  Future<void> _loadMarkerImages() async {
    _shelterIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(),
        Images.shelterMarkerUnselected());
    _selectedIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(1.2, 1.2)),
        Images.shelterMarkerSelected());
  }

  void _jumpCarouselToShelterIndex() =>
      _shelterCarousel.animateToPage(_shelterIndex,
          duration: Duration(microseconds: 1), curve: Curves.easeInOut);

  void onMarkerTapped({int at}) async {
    setState(() => _shelterIndex = at);
    _jumpCarouselToShelterIndex();
  }

  Set<Marker> mapToMarkers({Set<ShelterUI> from, int selectedAt = 0}) => widget
      ._shelters.map((shelter) => Marker(
      markerId: MarkerId(shelter.id),
      position: LatLng(shelter.latitude, shelter.longitude),
      consumeTapEvents: true,
      onTap: () =>
          onMarkerTapped(at: widget._shelters.toList().indexOf(shelter)),
      icon: widget._shelters.elementAt(selectedAt) == shelter
          ? _selectedIcon
          : _shelterIcon))
      .toSet();

  void onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    _p2pMapController.loadAffectedAreas();
    _centerCamera(on: currentLocation);
  }

  void onShelterTapped(LatLng markerCoordinates) =>
      _centerCamera(on: markerCoordinates);

  void onShelterSelected({int at}) async {
    _shelterMarkers = mapToMarkers(from: widget._shelters, selectedAt: at);

    final LatLng shelterLocation = _shelterMarkers.elementAt(at).position;

    _centerCamera(on: shelterLocation);
    widget.onShelterSelected(at, true, currentLocation, shelterLocation);
  }

  void _centerCamera({LatLng on}) =>
      _mapController.animateCamera(CameraUpdate.newLatLng(on));

  CarouselSlider _buildCarousel({Set<ShelterUI> from}) {
    final _carouselItems = from
        .map((shelter) => Builder(
      builder: (context) {
        final shelterLatLng = LatLng(shelter.latitude, shelter.longitude);
        return MapCard(
          title: shelter.title,
          subtitle: shelter.address,
          trailing: "${shelter.distance} m.",
          bottomButtons: <Widget>[
            RaisedButton(
              elevation: 1.0,
              child: Text("SELECT", style: TextStyle(color: Colors.white),),
              onPressed: () => widget.onContinue(currentLocation, shelterLatLng, shelter.address),
            )
          ],
        );
      }
    )).toList();

    return CarouselSlider(
      enableInfiniteScroll: false,
      enlargeCenterPage: false,
      height: 146,
      onPageChanged: (index) => onShelterSelected(at: index),
      items: _carouselItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    _buildShelterMarkers();
    _shelterCarousel = _buildCarousel(from: widget._shelters);

    return ShelterMapPageIB.build(
        context: context,
        cameraCenter: _camCenter,
        onMapCreated: onMapCreated,
        p2pMapController: _p2pMapController,
        isMock: true,
        shelterMarkers: _shelterMarkers,
        shelters: widget._shelters,
        onShelterSelected: onShelterSelected,
        carousel: _shelterCarousel,
        polylines: _shelterPolylines,
    );
  }

  @override
  // TODO review keepAlive logic, check if this page is alive even during navController navigation
  bool get wantKeepAlive => _keepAlive;

  @override
  void dispose() {
    _keepAlive = false;
    updateKeepAlive();
    super.dispose();
  }
}
