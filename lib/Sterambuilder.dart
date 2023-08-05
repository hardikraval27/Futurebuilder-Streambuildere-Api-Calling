import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class sterambuilder extends StatefulWidget {
  const sterambuilder({Key? key}) : super(key: key);

  @override
  State<sterambuilder> createState() => _sterambuilderState();
}

class _sterambuilderState extends State<sterambuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: chetan(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${snapshot.data![index]['albumId']}"),
                      subtitle: Text("${snapshot.data![index]['title']}"),
                    );
                  },
                )
              : CircularProgressIndicator();
        },
      ),
    );
  }

  Stream<List> chetan() async* {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List bb = jsonDecode(response.body);

    yield bb;
  }

// Future<List>chetan() async {
//   var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
//   var response = await http.get(url);
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
//
//   List bb = jsonDecode(response.body);
//
//   yield bb!;
// }
}

class newapi {
  int? userId;
  int? id;
  String? title;
  String? body;

  newapi({this.userId, this.id, this.title, this.body});

  newapi.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
