import 'dart:async';
import 'dart:convert';
import 'package:call_for_code_2019/data/network/AreaData.dart';
import 'package:call_for_code_2019/services/Client.dart';
import 'package:call_for_code_2019/services/apis/EventAPI.dart';
import 'package:call_for_code_2019/services/apis/CloudantInfo.dart';
import 'IAreaService.dart';

class CloudantAreaService implements IAreaService {
  final Client _client = CloudantInfo.getCloudantClient();
  final _streamController = StreamController<AreaData>();

  @override
  void closeStreamController() => _streamController.close();

  @override
  Stream<AreaData> getCircleAreasStream() {
    final uri = EventAPI.getAreaUri(_client.url, null);
    _client.get(uri).then((response) {
      final jsonData = json.decode(response.body);
      final areaList = jsonData["areas"];
      if (areaList != null) {
        for (var area in areaList) {
          _streamController.sink.add(AreaData.fromJson(area));
        }
      }
    });
    return _streamController.stream;
  }
}