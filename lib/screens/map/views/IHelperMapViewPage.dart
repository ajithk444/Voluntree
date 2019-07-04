
import 'package:call_for_code_2019/data/ui/GoogleMapsDirectionsResponseUI.dart';

abstract class IHelperMapViewPage {
  void onRouteReceived(GoogleMapsDirectionsResponseUI routes);
}
