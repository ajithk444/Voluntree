import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:call_for_code_2019/screens/map/viewmodels/P2PMapController.dart';
import 'package:call_for_code_2019/screens/map/views/P2PMapDelegate.dart';
import 'package:call_for_code_2019/screens/map/views/injectors/MapInjector.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class P2PMap extends StatefulWidget {
  final P2PMapController controller;

  final bool isMock;
  final Function(GoogleMapController) onMapCreated;
  final Set<Circle> circles;
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  final LatLng cameraCenter;
  final bool myLocationEnabled;

  const P2PMap(this.controller,
      {Key key,
      this.isMock = true,
      this.onMapCreated,
      this.circles,
      this.markers,
      this.polylines,
      this.cameraCenter,
      this.myLocationEnabled = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => P2PMapState();
}

class P2PMapState extends State<P2PMap> implements P2PMapDelegate {
  final Set<Circle> stateCircles = Set<Circle>();

  @override
  void initState() {
    widget.controller.mapView = this;

    if (widget.isMock) {
      widget.controller.repository = MapInjector.injectMockRepository();
    } else {
      widget.controller.repository = MapInjector.injectRepository();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final totalCircles = Set<Circle>()
      ..addAll(widget.circles != null ? widget.circles : {})
      ..addAll(stateCircles);

    return GoogleMap(
      onMapCreated: widget.onMapCreated,
      circles: totalCircles,
      markers: widget.markers,
      polylines: widget.polylines,
      initialCameraPosition: CameraPosition(
        target:
            widget.cameraCenter != null ? widget.cameraCenter : LatLng(0, 0),
        zoom: 14.0,
      ),
      myLocationEnabled: widget.myLocationEnabled,
      myLocationButtonEnabled: false,
    );
  }

  @override
  void onCircleReceived(Circle circle) {
    setState(() {
      final styledCircle = Circle(
          circleId: circle.circleId,
          center: circle.center,
          radius: circle.radius,
          onTap: circle.onTap,
          fillColor: ColorsManager.mapCircleColor,
          strokeColor: ColorsManager.mapCircleColor,
          strokeWidth: 3);
      stateCircles.add(styledCircle);
    });
  }
}
