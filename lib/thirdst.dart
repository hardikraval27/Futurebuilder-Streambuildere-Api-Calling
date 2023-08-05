import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class thiedst extends StatefulWidget {
  const thiedst({Key? key}) : super(key: key);

  @override
  State<thiedst> createState() => _thiedstState();
}

class _thiedstState extends State<thiedst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: virat(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${snapshot.data![index]['albumId']}"),
                leading:
                    Image.network("${snapshot.data![index]['thumbnailUrl']}"),
              );
            },
          );
        },
      ),
    );
  }

  Stream<List> virat() async* {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List mm = jsonDecode(response.body);

    yield mm;
  }
}

class st2 {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  st2({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  st2.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
