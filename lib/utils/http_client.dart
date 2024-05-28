import 'dart:io';
import 'dart:convert';

void testHttpClient() async {
  var url = Uri.parse('http://www.baidu.com');
  //1、创建HttpClient 对象
  var httpClient = HttpClient();
  try {
    //2、构建请求
    var request = await httpClient.getUrl(url);
    //3、设置请求头
    request.headers.add('User-Agent', 'MyDartApp/1.0');
    //4、发起请求，等待响应
    var response = await request.close();
    //5、检查响应和读取数据
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = await response.transform(utf8.decoder).join();
      print('Response Body:\n$responseBody');
    } else {
      //处理错误
      print('${response.statusCode}');
    }
  } catch (exception) {
    //处理异常
    print('Failed getting IP address');
  } finally {
    //6、关闭HttpClient,释放所有资源
    httpClient.close();
  }
}
