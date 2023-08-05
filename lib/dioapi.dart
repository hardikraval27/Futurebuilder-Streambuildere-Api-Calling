import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dio extends StatefulWidget {
  const dio({Key? key}) : super(key: key);

  @override
  State<dio> createState() => _dioState();

}
class _dioState extends State<dio> {

  final dio = Dio();

  List<flutterr> oo = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foee();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: oo.length,
        itemBuilder: (context, index) {
        return ListTile(title: Text("${oo[index].id}"),);
      },),
    );
  }
  Future<void> foee() async {

    final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
      print(response);

      List potlu = jsonDecode(response.data);
      for(int i=0;i<potlu.length;i++)
        {
          flutterr obj = flutterr.potlo(potlu[i]);
          oo.add(obj);
        }
    }
  }
// {
// "userId": 1,
// "id": 1,
// "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
// "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
// },
  class flutterr
  {
    int userId;
    int id;
    String title;
    String body;

    flutterr(this.userId, this.id, this.title, this.body);

    factory flutterr.potlo(potlu) {
    return flutterr(potlu['userId'], potlu['id'], potlu['title'], potlu['body']);
  }
  }
