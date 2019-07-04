class VictimAPI {
  static const _databaseReference = "victims";
  static String _getEndpoint({String forDocument}) => "/$_databaseReference/$forDocument";

  static Uri getVictimsUri(String baseUrl, String params, int id) {
    final Map<String, String> params = Map<String, String>();

    return Uri.https(baseUrl, _getEndpoint(forDocument: "victim_$id"), params);
  }
}