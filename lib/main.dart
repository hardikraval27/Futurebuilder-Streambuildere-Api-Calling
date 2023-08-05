import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: futureee(),
    debugShowCheckedModeBanner: false,
  ));
}

class futureee extends StatefulWidget {
  const futureee({Key? key}) : super(key: key);

  @override
  State<futureee> createState() => _futureeeState();
}

class _futureeeState extends State<futureee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Demom(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${snapshot.data![index]['albumId']}"),
                      leading: Image.network(
                          "${snapshot.data![index]['thumbnailUrl']}"),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<List> Demom() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List bb = jsonDecode(response.body);

    return bb;
  }
}
