import 'package:call_for_code_2019/data/ui/ShelterUI.dart';
import 'package:call_for_code_2019/screens/victim_form/pages/ShelterListPageIB.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShelterListPage extends StatefulWidget {
  final Set<ShelterUI> _shelters;
  final void Function(int, bool, LatLng, LatLng) onShelterSelected;
  final int _shelterIndex;
  final LatLng initialLocation;


  const ShelterListPage(this._shelters, this._shelterIndex, this.initialLocation, {Key key, this.onShelterSelected})
      : super(key: key);

  @override
  _ShelterListPageState createState() => _ShelterListPageState();
}

class _ShelterListPageState extends State<ShelterListPage> {
  @override
  Widget build(BuildContext context) => ShelterListPageIB.build(
      shelters: widget._shelters,
      shelterIndex: widget._shelterIndex,
      onListTilePressed: widget.onShelterSelected,
      initialLocation: widget.initialLocation
  );
}