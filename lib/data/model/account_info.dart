import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'account_info.g.dart';


@JsonSerializable()
class AccountInfo {
  @JsonKey(name: "admin")
  bool? admin;
  @JsonKey(name: "chapterTops")
  List<dynamic>? chapterTops;
  @JsonKey(name: "coinCount")
  int? coinCount;
  @JsonKey(name: "collectIds")
  List<int>? collectIds;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "icon")
  String? icon;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "nickname")
  String? nickname;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "publicName")
  String? publicName;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "type")
  int? type;
  @JsonKey(name: "username")
  String? username;

  AccountInfo({
    this.admin,
    this.chapterTops,
    this.coinCount,
    this.collectIds,
    this.email,
    this.icon,
    this.id,
    this.nickname,
    this.password,
    this.publicName,
    this.token,
    this.type,
    this.username,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) => _$AccountInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountInfoToJson(this);
}
