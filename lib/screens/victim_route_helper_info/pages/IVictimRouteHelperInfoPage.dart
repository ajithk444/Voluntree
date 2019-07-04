import 'package:call_for_code_2019/data/ui/GoogleMapsDirectionsResponseUI.dart';
import 'package:call_for_code_2019/data/ui/ShelterUI.dart';

abstract class IVictimRouteHelperInfoPage {
  void onVictimsReceived(Set<ShelterUI> shelters);
  void onRouteReceived(GoogleMapsDirectionsResponseUI directions);
}