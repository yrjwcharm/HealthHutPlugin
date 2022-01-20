
import 'dart:async';

import 'package:flutter/services.dart';

class Healthhutplugin {
  static const MethodChannel _channel = MethodChannel('healthhutplugin');

   Future <String?> jumpHealthHut(userIdPara) async {
     final String? ocrResult =  await _channel.invokeMethod('jumpHealthHutModular',userIdPara);
     return ocrResult;
  }
}
