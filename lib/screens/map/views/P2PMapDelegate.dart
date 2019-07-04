import 'package:call_for_code_2019/widgets/FramedPolyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class P2PMapDelegate {
  void onCircleReceived(Circle circle);
}