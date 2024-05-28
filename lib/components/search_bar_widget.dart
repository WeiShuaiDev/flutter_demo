import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
                child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6), // 圆角背景色
                  borderRadius: BorderRadius.circular(8.0)),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Color(0xFF8C8D92)),
                  SizedBox(
                    width: 8.0,
                  ), // 图标和文本之间的间距
                  Text(
                    '搜索稀土掘金',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF8C8D92),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            )),
            const SizedBox(width: 8.0),
            const Icon(Icons.assistant_photo)
          ],
        ));
  }
}
