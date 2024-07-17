import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:van_android_getx/data/model/home_article_info.dart';

part 'wx_article_list.g.dart';

@JsonSerializable()
class WxArticleList {
  @JsonKey(name: "curPage")
  int? curPage;
  @JsonKey(name: "datas")
  List<ArticleInfo>? datas;
  @JsonKey(name: "offset")
  int? offset;
  @JsonKey(name: "over")
  bool? over;
  @JsonKey(name: "pageCount")
  int? pageCount;
  @JsonKey(name: "size")
  int? size;
  @JsonKey(name: "total")
  int? total;

  WxArticleList({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  factory WxArticleList.fromJson(Map<String, dynamic> json) => _$WxArticleListFromJson(json);

  Map<String, dynamic> toJson() => _$WxArticleListToJson(this);
}

@JsonSerializable()
class Tag {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "url")
  String? url;

  Tag({
    this.name,
    this.url,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

