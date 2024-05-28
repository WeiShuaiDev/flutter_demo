// 如果Data是列表类型用这个
import 'package:json_annotation/json_annotation.dart';

part 'list_response.g.dart'; // 1、指到生成的文件，当前文件.g.dart

@JsonSerializable(genericArgumentFactories: true)
class ListResponse<T> {
  final List<T> data;
  final int errorCode;
  final String errorMsg;

  ListResponse(
      {required this.data, required this.errorCode, required this.errorMsg});

  // 使用泛型方法的工厂构造方法来创建一个响应实例
  factory ListResponse.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$ListResponseFromJson(json, fromJsonT);

  // 使用泛型方法将实例转换为Json
  Map<String, dynamic> toJson(dynamic Function(T value) toJsonT) =>
      _$ListResponseToJson(this, toJsonT);
}
