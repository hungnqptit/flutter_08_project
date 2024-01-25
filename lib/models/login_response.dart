// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginResponseModel {
  final String? message;
  final int? statusCode;
  final MetaData? metadata;
  LoginResponseModel({
    this.message,
    this.statusCode,
    this.metadata,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'statusCode': statusCode,
      'metadata': metadata?.toMap(),
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      message: map['message'] != null ? map['message'] as String : null,
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      metadata: map['metadata'] != null
          ? MetaData.fromMap(map['metadata'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Shop {
  final String? id;
  final String? name;
  final String? email;
  Shop({
    this.id,
    this.name,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shop.fromJson(String source) =>
      Shop.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Token {
  final String? accessToken;
  final String? refreshToken;

  Token(this.accessToken, this.refreshToken);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      map['accessToken'] != null ? map['accessToken'] as String : null,
      map['refreshToken'] != null ? map['refreshToken'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) =>
      Token.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MetaData {
  final Shop? shop;
  final Token? tokens;
  MetaData({
    this.shop,
    this.tokens,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shop': shop?.toMap(),
      'tokens': tokens?.toMap(),
    };
  }

  factory MetaData.fromMap(Map<String, dynamic> map) {
    return MetaData(
      shop: map['shop'] != null
          ? Shop.fromMap(map['shop'] as Map<String, dynamic>)
          : null,
      tokens: map['tokens'] != null
          ? Token.fromMap(map['tokens'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MetaData.fromJson(String source) =>
      MetaData.fromMap(json.decode(source) as Map<String, dynamic>);
}
