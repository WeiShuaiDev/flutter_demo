// 顶层属性，记录饭馆的总服务次数

import 'package:flutter_demo/utils/event_bus.dart';

int totalServeCount = 0;

// 顶层方法，每次服务一个顾客时，服务次数就增加
void serveCustomer() {
  totalServeCount++;
  print('服务了一个顾客。现在一共服务了$totalServeCount 个顾客。');
}

// 厨师类
class Chef {
  // 静态属性，记录厨师做了多少道菜
  static int dishesCooked = 0;

  // 静态方法，每次厨师做完一道菜，这个数字就增加
  static void cookDish() {
    dishesCooked++;
    print('厨师做了一道菜。到现在一共做了$dishesCooked 道菜。');
  }
}

//定义一个top-level（全局）变量，页面引入该文件后可以直接使用bus
var bus = EventBus();