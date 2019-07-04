class MapViewport {
  final double northeastLatitude;
  final double northeastLongitude;
  final double southwestLatitude;
  final double southwestLongitude;

  MapViewport({this.northeastLatitude, this.northeastLongitude,
    this.southwestLatitude, this.southwestLongitude});

  factory MapViewport.fromJson(Map<String, dynamic> parsedJson) => MapViewport(
      northeastLatitude: parsedJson["northeastLatitude"],
      northeastLongitude: parsedJson["northeastLongitude"],
      southwestLatitude: parsedJson["southwestLatitude"],
      southwestLongitude: parsedJson["southwestLongitude"]
  );
}
