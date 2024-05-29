import 'package:flutter/material.dart';
import 'package:flutter_demo/provider/counter.dart';
import 'package:flutter_demo/utils/http_dio.dart';
import 'package:flutter_demo/page/home_page.dart';
import 'package:flutter_demo/demo/router_page.dart';
import 'package:flutter_demo/page/second_page.dart';
import 'package:flutter_demo/page/three_page.dart';
import 'package:flutter_demo/global/constants.dart';
import 'package:provider/provider.dart';

void main() {
  HttpDio.init();
  // 使用顶层方法服务顾客
  print('欢迎来到饭馆!');
  serveCustomer(); // 输出：服务了一个顾客。现在一共服务了1个顾客。
  serveCustomer(); // 输出：服务了一个顾客。现在一共服务了2个顾客。

  // 让厨师做菜
  print('让我们的厨师开始工作吧！');
  Chef.cookDish(); // 输出：厨师做了一道菜。到现在一共做了1道菜。
  Chef.cookDish(); // 输出：厨师做了一道菜。到现在一共做了2道菜。

  runApp(ChangeNotifierProvider(
      create: (context) => Counter(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/second': (context) => const SecondPage(
              data: 'test',
            ),
        '/three': (context) => const ThreePage()
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/second') {
          final String args = settings.arguments.toString() ?? '';
          return MaterialPageRoute(
              builder: (context) => SecondPage(data: args));
        }
        return null;
      },
      home: const HomePage(),
    );
  }
}
