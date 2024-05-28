import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key,required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPage页面'),
      ),
      body: Center(
        child: Text(args.toString()),
      ),
    );
  }
}
