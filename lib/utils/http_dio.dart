import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/bean/banner.dart';
import 'package:flutter_demo/bean/list_response.dart';
import 'package:flutter_demo/utils/global.dart';

class HttpDio {
  /// 网络请求过程可能需要使用当前的上下文信息，如打开一个新路由
  HttpDio([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext? context; // 上下文
  late Options _options; // 附加选项
  static const bool enableProxy = true; // 是否设置代理方便调试阶段抓包

  static Dio httpDio = Dio(BaseOptions(
    baseUrl: 'https://www.wanandroid.com/',
    connectTimeout: const Duration(seconds: 60), // 请求超时
    receiveTimeout: const Duration(seconds: 60), // 响应超时
    // 自定义请求头，ua不设置默认是：Dart/3.2 (dart:io)
    headers: {
      HttpHeaders.userAgentHeader:
          'partner/7.8.0(Android;12;1080*2116;Scale=2.75;Xiaomi=Mi MIX 2S)'
    },
  ));

  static void init() {
    // 调试阶段开启抓包调试
    if (isDebug) {
      // 使用代理
      httpDio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          return HttpClient()
            // 将请求代理到 本机IP:8888，是抓包电脑的IP！！！不要直接用localhost，会报错:
            // SocketException: Connection refused (OS Error: Connection refused, errno = 111), address = localhost, port = 47972
            ..findProxy = (uri) {
              return 'PROXY 192.168.2.33:8888';
            }
            // 抓包工具一般都会提供一个自签名的证书，会通不过证书校验，这里禁用下
            ..badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
        },
      );
    }
    //初始拦截器
    httpDio.interceptors.add(
      InterceptorsWrapper(onRequest: (option, handler) {
        // 在请求发起前做一些事情
        return handler.next(option);
      }, onResponse: (response, handler) {
        // 在返回响应数据前做一些预处理
        return handler.next(response);
      }, onError: (error, handler) {
        // 请求失败时做一些预处理
        return handler.next(error);
      }),
    );
  }

  Future<List<WanBanner>> getWanBanner() async {
    var resp = await httpDio.get<String>('banner/json');
    var respDataList = ListResponse<WanBanner>.fromJson(
        json.decode(resp.data.toString()), (json) => WanBanner.formJson(json));
    //var respJosn = json.decode(resp.data.toString());
    //List dataList = respJosn['data'];
    //List<WanBanner> wanBannerList = [];
    //for (dynamic data in dataList) {
    //wanBannerList.add(WanBanner(data['id'], data['desc'], data['imagePath'],
    //    data['isVisible'], data['title'], data['url']));
    //wanBannerList.add(WanBanner.formJson(data));
    //}
    return respDataList.data;
  }
}
/*
HttpDio.init();
HttpDio().getBanner().then((value)=>
  print(value)
);
*/
