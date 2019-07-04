import 'package:call_for_code_2019/services/Client.dart';
import 'package:call_for_code_2019/services/apis/CloudantInfo.dart';
import 'package:call_for_code_2019/services/apis/HelperAPI.dart';
import 'IHelperService.dart';

class CloudantHelperService implements IHelperService {
  final Client _client = CloudantInfo.getCloudantClient();

  @override
  Future<Response> putHelper(int id, {Map<String, dynamic> info}) {
    final uri = HelperAPI.getHelpersUri(_client.url, null, id);
    return _client.putJson(uri, info);
  }
}