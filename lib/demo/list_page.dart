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
 * ListView用法
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
      body: ListView.custom(
          childrenDelegate: SliverChildListDelegate([
        const ListTile(title: Text("Item 1")),
        const ListTile(title: Text("Item 2"))
      ]))
      /*ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(title: Text("Item $index"));
          },
          separatorBuilder: (context, index) => const Divider(
                height: .5,
              ),
          itemCount: 10)
      ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(title: Text("Item $index"));
          })
      ListView(
        children: const <Widget>[
          ListTile(title: Text("Item 1")),
          ListTile(title: Text("Item 2")),
          ListTile(title: Text("Item 3")),
        ],
      )*/
      ,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
