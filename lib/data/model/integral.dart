import 'package:json_annotation/json_annotation.dart';

part 'integral.g.dart';

@JsonSerializable()
class Integral extends Object {
  @JsonKey(name: 'coinCount')
  int coinCount;

  @JsonKey(name: 'rank')
  String rank;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'username')
  String username;

  Integral(
    this.coinCount,
    this.rank,
    this.userId,
    this.username,
  );

  factory Integral.fromJson(Map<String, dynamic> srcJson) => _$IntegralFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IntegralToJson(this);
}
