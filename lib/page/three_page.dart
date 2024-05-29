import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/shared_preference.dart';

class ThreePage extends StatefulWidget {
  const ThreePage({super.key});

  @override
  State<ThreePage> createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  var _resultShow = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThreePage页面'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: _saveData2Sp, child: const Text('保存数据')),
          ElevatedButton(onPressed: _getDataFromSp, child: const Text('获取数据')),
          ElevatedButton(onPressed: _deleteDataInSp, child: const Text('删除数据')),
          Text(_resultShow),
          CachedNetworkImage(
            imageUrl: "http://via.placeholder.com/350x150",
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        ],
      ),
    );
    ;
  }

  void _saveData2Sp() async {
    await SharedPreference.saveData('Test', 'Test');
    setState(() {
      _resultShow = "保存成功";
    });
  }

  void _getDataFromSp() async {
    var value = await SharedPreference.getData('Test');
    setState(() {
      _resultShow = "Test：$value";
    });
  }

  void _deleteDataInSp() async {
    await SharedPreference.deleteAllData();
    setState(() {
      _resultShow = "删除成功";
    });
  }
}
