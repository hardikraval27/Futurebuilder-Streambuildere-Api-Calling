import 'package:flutter/material.dart';

class gridviewbuilder extends StatefulWidget {
  const gridviewbuilder({Key? key}) : super(key: key);

  @override
  State<gridviewbuilder> createState() => _gridviewbuilderState();
}

class _gridviewbuilderState extends State<gridviewbuilder> {
  get sample => List.generate(30, (i) => i);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: sample.length, // <-- required
        itemBuilder: (_, i) => Container(
          margin: const EdgeInsets.all(5),
          color: Colors.grey,
          child: Center(child: Text('${sample[i]}')),
        ),
      ),
    );
  }
}
