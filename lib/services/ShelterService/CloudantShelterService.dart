import 'dart:convert';
import 'package:call_for_code_2019/data/network/POIData.dart';
import 'package:call_for_code_2019/services/apis/CloudantInfo.dart';
import 'package:call_for_code_2019/services/apis/EventAPI.dart';
import '../Client.dart';
import 'IShelterService.dart';

class CloudantShelterService implements IShelterService {
  final Client _client = CloudantInfo.getCloudantClient();

  @override
  Future<List<POIData>> getSheltersFromNetwork() {
    final uri = EventAPI.getSheltersUri(_client.url, null);
    return _client.get(uri).then((response) {
      final jsonData = json.decode(response.body);
      final List<POIData> shelters = [];
      final shelterList = jsonData["shelters"];

      if (shelterList != null) {
        for (var area in shelterList) {
          shelters.add(POIData.fromJson(area));
        }
      }
      return shelters;
    });
  }
}