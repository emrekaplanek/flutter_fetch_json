import 'package:flutter/material.dart';

class RequestService {
  static Future<String> getJson(BuildContext context, String assetUrl) async {
    String dataString;
    try {
      dataString = await DefaultAssetBundle.of(context).loadString(assetUrl);
      return dataString;
    } catch (e) {
      throw Exception();
    }
  }
}
