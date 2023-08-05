import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class newapi extends StatefulWidget {
  const newapi({Key? key}) : super(key: key);

  @override
  State<newapi> createState() => _newapiState();
}

class _newapiState extends State<newapi> {
  List<apicalling> mydata = [];

  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mydemo();
  }

  Future<void> mydemo() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List hh = jsonDecode(response.body);

    for (int i = 0; i < hh.length; i++) {
      apicalling uu = apicalling.fromJson(hh[i]);
      setState(() {
        mydata.add(uu);
        status = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: status
          ? ListView.builder(
              itemCount: mydata.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${mydata[index].id}"),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class apicalling {
  int? userId;
  int? id;
  String? title;

  apicalling({this.userId, this.id, this.title});

  apicalling.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
