import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class fiveapi extends StatefulWidget {
  const fiveapi({Key? key}) : super(key: key);

  @override
  State<fiveapi> createState() => _fiveapiState();
}

class _fiveapiState extends State<fiveapi> {
  grtapi? oo;

  bool satus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dumy();
  }

  Future<void> dumy() async {
    var url = Uri.parse('https://dummyjson.com/posts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var uu = jsonDecode(response.body);

    setState(() {
      oo = grtapi.fromJson(uu);
      satus = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: satus
          ? ListView.builder(
              itemCount: oo!.posts!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${oo!.posts![index].id}"),
                );
              },
            )
          : const CircularProgressIndicator(),
    );
  }
}

class grtapi {
  List<Posts>? posts;
  int? total;
  int? skip;
  int? limit;

  grtapi({this.posts, this.total, this.skip, this.limit});

  grtapi.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Posts {
  int? id;
  String? title;
  String? body;
  int? userId;
  List<String>? tags;
  int? reactions;

  Posts(
      {this.id, this.title, this.body, this.userId, this.tags, this.reactions});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
    tags = json['tags'].cast<String>();
    reactions = json['reactions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['userId'] = this.userId;
    data['tags'] = this.tags;
    data['reactions'] = this.reactions;
    return data;
  }
}
