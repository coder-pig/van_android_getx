import 'package:json_annotation/json_annotation.dart';

part 'account_login.g.dart';


@JsonSerializable()
class AccountLoginReq {
  final String username;
  final String password;

  AccountLoginReq(this.username, this.password);

  factory AccountLoginReq.fromJson(Map<String, dynamic> srcJson) => _$AccountLoginReqFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AccountLoginReqToJson(this);

}