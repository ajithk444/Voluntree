import 'package:flutter/foundation.dart';
import '../Client.dart';

abstract class IHelperService {
  Future<Response> putHelper(int id, {@required Map<String, dynamic> info});
}