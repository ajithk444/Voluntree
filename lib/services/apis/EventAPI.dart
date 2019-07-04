class EventAPI {
  static const _databaseReference = "events";
  static String _getEndpoint({String forDocument}) => "/$_databaseReference/$forDocument";

  static Uri getAreaUri(String baseUrl, String params) {
    final Map<String, String> params = Map<String, String>();

    return Uri.https(baseUrl, _getEndpoint(forDocument: "areas"), params);
  }

  static Uri getSheltersUri(String baseUrl, String params) {
    final Map<String, String> params = Map<String, String>();

    return Uri.https(baseUrl, _getEndpoint(forDocument: "shelters"), params);
  }
}