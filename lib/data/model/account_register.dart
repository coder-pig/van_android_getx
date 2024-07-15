import 'package:json_annotation/json_annotation.dart';

part 'account_register.g.dart';


@JsonSerializable()
class AccountRegisterReq {
  final String username;
  final String password;
  final String repassword;

  AccountRegisterReq(this.username, this.password, this.repassword);

  factory AccountRegisterReq.fromJson(Map<String, dynamic> srcJson) => _$AccountRegisterReqFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AccountRegisterReqToJson(this);

}