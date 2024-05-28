import 'package:flutter/material.dart';
import 'package:flutter_demo/components/search_bar_widget.dart';
import 'package:flutter_demo/components/content_widget.dart';
import 'package:flutter_demo/components/bottom_bar_widget.dart';
import 'package:flutter_demo/utils/http_dio.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    HttpDio().getWanBanner().then((value) => {
      for (var item in value) {print(json.encode(item))}
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          color: Colors.white,
          child: const Column(
            children: [SearchBarWidget(), ContentWidget(), BottomBarWidget()],
          ),
        ));
  }
}