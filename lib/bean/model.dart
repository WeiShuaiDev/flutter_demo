import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart'; // 1、指到生成的文件，当前文件.g.dart

@JsonSerializable(explicitToJson: true) // 2.添加注解，告知此类是要生成Model类的
class BannerResponse {
  final List<Banner>? data;
  final int? errorCode;
  final String? errorMsg;

  BannerResponse(this.data, this.errorCode, this.errorMsg);

  // 3、_${类名}FromJson(json) json转对象固定写法
  factory BannerResponse.fromJson(Map<String, dynamic> json) => _$BannerResponseFromJson(json);

  // 4、_${类名}ToJson(json)  对象转json固定写法 }
  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}

@JsonSerializable()
class Banner {
  @JsonKey(name: 'id') // 使用此注解可以对变量进行重命名
  final int bid;
  final String desc;
  final String imagePath;
  final int isVisible;
  final String title;
  final String url;

  Banner(this.bid, this.desc, this.imagePath, this.isVisible, this.title, this.url);

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}
