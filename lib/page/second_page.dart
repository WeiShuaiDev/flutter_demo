import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/provider/counter.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPage页面'),
      ),
      body: Column(
        children: [
          Text(args.toString()),
          Consumer<Counter>(
            builder: (context, counter, child) =>
                Text('Value: ${counter.count}'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
