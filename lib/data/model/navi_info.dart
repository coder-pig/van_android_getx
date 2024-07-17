import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'navi_info.g.dart';

@JsonSerializable()
class NaviInfo {
  @JsonKey(name: "articles")
  List<Article>? articles;
  @JsonKey(name: "cid")
  int? cid;
  @JsonKey(name: "name")
  String? name;

  NaviInfo({
    this.articles,
    this.cid,
    this.name,
  });

  factory NaviInfo.fromJson(Map<String, dynamic> json) => _$NaviInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NaviInfoToJson(this);
}

@JsonSerializable()
class Article {
  @JsonKey(name: "adminAdd")
  bool? adminAdd;
  @JsonKey(name: "apkLink")
  String? apkLink;
  @JsonKey(name: "audit")
  int? audit;
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "canEdit")
  bool? canEdit;
  @JsonKey(name: "chapterId")
  int? chapterId;
  @JsonKey(name: "chapterName")
  String? chapterName;
  @JsonKey(name: "collect")
  bool? collect;
  @JsonKey(name: "courseId")
  int? courseId;
  @JsonKey(name: "desc")
  String? desc;
  @JsonKey(name: "descMd")
  String? descMd;
  @JsonKey(name: "envelopePic")
  String? envelopePic;
  @JsonKey(name: "fresh")
  bool? fresh;
  @JsonKey(name: "host")
  String? host;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "isAdminAdd")
  bool? isAdminAdd;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "niceDate")
  String? niceDate;
  @JsonKey(name: "niceShareDate")
  String? niceShareDate;
  @JsonKey(name: "origin")
  String? origin;
  @JsonKey(name: "prefix")
  String? prefix;
  @JsonKey(name: "projectLink")
  String? projectLink;
  @JsonKey(name: "publishTime")
  int? publishTime;
  @JsonKey(name: "realSuperChapterId")
  int? realSuperChapterId;
  @JsonKey(name: "selfVisible")
  int? selfVisible;
  @JsonKey(name: "shareDate")
  int? shareDate;
  @JsonKey(name: "shareUser")
  String? shareUser;
  @JsonKey(name: "superChapterId")
  int? superChapterId;
  @JsonKey(name: "superChapterName")
  String? superChapterName;
  @JsonKey(name: "tags")
  List<dynamic>? tags;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "type")
  int? type;
  @JsonKey(name: "userId")
  int? userId;
  @JsonKey(name: "visible")
  int? visible;
  @JsonKey(name: "zan")
  int? zan;

  Article({
    this.adminAdd,
    this.apkLink,
    this.audit,
    this.author,
    this.canEdit,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.descMd,
    this.envelopePic,
    this.fresh,
    this.host,
    this.id,
    this.isAdminAdd,
    this.link,
    this.niceDate,
    this.niceShareDate,
    this.origin,
    this.prefix,
    this.projectLink,
    this.publishTime,
    this.realSuperChapterId,
    this.selfVisible,
    this.shareDate,
    this.shareUser,
    this.superChapterId,
    this.superChapterName,
    this.tags,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
