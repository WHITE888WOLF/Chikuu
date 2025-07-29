import 'package:flutter/foundation.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class SecurityService {
  static Future<void> init() async {
    if (!kIsWeb) {
      // Only apply to Android; iOS handled by Info.plist
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  }
}