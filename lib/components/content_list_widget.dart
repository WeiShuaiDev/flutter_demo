import 'package:flutter/material.dart';
import 'package:flutter_demo/global/constants.dart';

class ContentListWidget extends StatelessWidget {
  const ContentListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bus.on("jump", (arg) {
      print("跳转成功");
    });
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      '一起学Flutter',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    )
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 4),
                    Text('coder_pig')
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Expanded(
                        child: Text(
                          '时代峰峻了思考的放开了教师节快乐地方就是看漏点击福克斯搭建开发手机打开发送点击开发技术的开发律师代理费是劳动法',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.lightbulb_outline),
                    const Text('999+'),
                    const SizedBox(width: 18),
                    const Icon(Icons.keyboard_voice),
                    const Text('999+'),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/second',
                              arguments: "test");
                          bus.emit("jump", "test");
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: const Text(
                            'Flutter',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    const Icon(Icons.more_vert)
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Color(0XFFF3F4F6),
            thickness: 8.0,
          );
        },
        itemCount: 20);
  }
}
