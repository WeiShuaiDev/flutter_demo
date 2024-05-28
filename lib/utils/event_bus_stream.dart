import 'dart:async';

import 'package:flutter_demo/bean/banner.dart';
import 'package:flutter_demo/utils/event_bus.dart';

class EventBusStream {
  // 使用多订阅流的形式，这种流可以有多个监听器监听
  final _streamController = StreamController.broadcast();

  static final _instance = EventBusStream._internal();

  factory EventBusStream() {
    return _instance;
  }

  EventBusStream._internal();

  // 发布事件
  void fire(event) {
    _streamController.add(event);
  }

  // 订阅事件
  StreamSubscription on<T>(void Function(T)? onData) {
    return _streamController.stream
        .where((event) => event is T)
        .listen(onData as void Function(dynamic event)?);
  }
}
/*
// 调用处：
var eventBus = EventBus();
// 发布一个事件
eventBus.fire(WanBanner());
// 在其他地方订阅这个事件：
StreamSubscription subscription =eventBus.on<WanBanner>((event){

});
//在合适的地方取消订阅
subscription.cancel();
 */
