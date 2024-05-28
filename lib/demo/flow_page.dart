import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/**
 * Wrap用法
 */
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double size = 50.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Flow(
        delegate: CrossFlowDelegate(),
        children: List<Widget>.generate(
            5,
            (index) => Container(
                  width: size,
                  height: size,
                  alignment: Alignment.center,
                  color: index == 2 ? Colors.red : Colors.blue,
                  child: Text(
                    index.toString(),
                    textAlign: TextAlign.center,
                  ),
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CrossFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    final double size = context.getChildSize(0)?.width ?? 0;
    context.paintChild(2,
        transform: Matrix4.translationValues(2 * size, size, 0.0));
    context.paintChild(0,
        transform: Matrix4.translationValues(2 * size, 0.0 * size, 0.0));
    context.paintChild(1,
        transform: Matrix4.translationValues(size, size, 0.0));
    context.paintChild(3,
        transform: Matrix4.translationValues(size * 3, size, 0.0));
    context.paintChild(4,
        transform: Matrix4.translationValues(size * 2, size * 2, 0.0));
  }

  @override
  bool shouldRepaint(CrossFlowDelegate oldDelegate) => false;
}
