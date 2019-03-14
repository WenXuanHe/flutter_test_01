import 'package:json_annotation/json_annotation.dart';

part 'userInfo.g.dart';
@JsonSerializable()
class UserInfo {
    UserInfo();

    String orderId;
    String statusDisplay;
    String imageUrl;
    String phone;
    String customerName;
    String goodsName;
    num createdTime;
    String userName;
    
    factory UserInfo.fromJson(Map<String,dynamic> json) => _$UserInfoFromJson(json);
}