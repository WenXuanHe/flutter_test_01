// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return new UserInfo()
    ..orderId = json['orderId'] as String
    ..statusDisplay = json['statusDisplay'] as String
    ..imageUrl = json['imageUrl'] as String
    ..phone = json['phone'] as String
    ..customerName = json['customerName'] as String
    ..goodsName = json['goodsName'] as String
    ..createdTime = json['createdTime'] as num
    ..userName = json['userName'] as String;
}

abstract class _$UserInfoSerializerMixin {
  String get orderId;
  String get statusDisplay;
  String get imageUrl;
  String get phone;
  String get customerName;
  String get goodsName;
  num get createdTime;
  String get userName;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'orderId': orderId,
        'statusDisplay': statusDisplay,
        'imageUrl': imageUrl,
        'phone': phone,
        'customerName': customerName,
        'goodsName': goodsName,
        'createdTime': createdTime,
        'userName': userName
      };
}
