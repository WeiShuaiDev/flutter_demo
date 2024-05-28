import 'package:flutter/material.dart';

class RouterPage extends StatefulWidget {
  const RouterPage({super.key});

  @override
  State<RouterPage> createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('打开新路由页'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: const Text(
                    '新路由页',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ));
            }));
          },
        ),
      ),
    );
  }
}
