import 'package:flutter/material.dart';
import 'package:flutter_demo/components/content_list_widget.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({super.key});

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabStrList = [
    '关注',
    '推荐',
    '热榜',
    '头条',
    '后端',
    '前端',
    'Android',
    'iOS',
    '人工智能',
    '开发工具'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabStrList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scaffold(
      body: Column(
        children: [
          TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: tabStrList
                .map((e) => Tab(
                      text: e,
                    ))
                .toList(),
          ),
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: tabStrList
                      .map((e) => const ContentListWidget())
                      .toList()))
        ],
      ),
    ));
  }
}
