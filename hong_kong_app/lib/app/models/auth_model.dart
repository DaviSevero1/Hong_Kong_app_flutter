import 'dart:convert';

import 'package:flutter/foundation.dart';

class AuthModel {
  final String acessToken;
  final String refreshToken;
  AuthModel({
    required this.acessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'accessToken': acessToken,
      'refreshToken': refreshToken,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
        acessToken: map['acess_token'] ?? '',
        refreshToken: map['refresh_token'] ?? '');
  }

  String toJson() => jsonEncode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(jsonDecode(source));
}
