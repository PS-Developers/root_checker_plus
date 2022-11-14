import 'package:flutter/services.dart';

class RootCheckerPlus {
  static const MethodChannel _channel = MethodChannel('root_checker_plus');

  static Future<bool?> isRootChecker() async {
    final bool? isRootChecker = await _channel.invokeMethod('isRootChecker');
    return isRootChecker ?? false;
  }

  static Future<bool?> isDeveloperMode() async {
    final bool? isDeveloperMode = await _channel.invokeMethod('isDeveloperMode');
    return isDeveloperMode ?? false;
  }

  static Future<bool?> isJailbreak() async {
    bool? isJailbreak = await _channel.invokeMethod('isJailbreak');
    return isJailbreak ?? false;
  }
}
