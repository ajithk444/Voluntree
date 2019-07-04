import 'package:call_for_code_2019/services/apis/CloudantInfo.dart';
import 'package:call_for_code_2019/services/apis/VictimAPI.dart';
import 'package:flutter/foundation.dart';
import '../Client.dart';
import 'IVictimService.dart';

class CloudantVictimService implements IVictimService {
  final Client _client = CloudantInfo.getCloudantClient();

  @override
  Future<Response> putVictim(int id, {@required Map<String, dynamic> info}) async {
    final uri = VictimAPI.getVictimsUri(_client.url, null, id);
    return _client.putJson(uri, info);
  }
}