class HelperAPI {
  static const _databaseReference = "helpers";
  static String _getEndpoint({String forDocument}) => "/$_databaseReference/$forDocument";

  static Uri getHelpersUri(String baseUrl, String params, int id) {
    final Map<String, String> params = Map<String, String>();

    return Uri.https(baseUrl, _getEndpoint(forDocument: "helper_$id"), params);
  }
}