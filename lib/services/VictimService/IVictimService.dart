import 'package:call_for_code_2019/services/Client.dart';
import 'package:flutter/foundation.dart';

abstract class IVictimService {
  Future<Response> putVictim(int id, {@required Map<String, dynamic> info});
}