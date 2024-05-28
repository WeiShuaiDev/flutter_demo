// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) =>
    BannerResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['errorCode'] as num?)?.toInt(),
      json['errorMsg'] as String?,
    );

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
      (json['id'] as num).toInt(),
      json['desc'] as String,
      json['imagePath'] as String,
      (json['isVisible'] as num).toInt(),
      json['title'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'id': instance.bid,
      'desc': instance.desc,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'title': instance.title,
      'url': instance.url,
    };
