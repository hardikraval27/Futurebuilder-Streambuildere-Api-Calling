import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class im extends StatefulWidget {
  const im({Key? key}) : super(key: key);

  @override
  State<im> createState() => _imState();
}

class _imState extends State<im> {
  String image = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    child: CircleAvatar(
                      backgroundImage: FileImage(File(image)),
                      radius: 80,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: Container(
                      child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              builder: (BuildContext context) {
                                // UDE : SizedBox instead of Container for whitespaces
                                return Container(
                                  //  height: 100,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            final ImagePicker picker =
                                                ImagePicker();
                                            final XFile? xyz =
                                                await picker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            setState(() {
                                              image = xyz!.path;
                                            });
                                          },
                                          icon: Icon(Icons.photo)),
                                      IconButton(
                                          onPressed: () async {
                                            final ImagePicker picker =
                                                ImagePicker();
                                            final XFile? xyz =
                                                await picker.pickImage(
                                                    source: ImageSource.camera);
                                            setState(() {
                                              image = xyz!.path;
                                            });
                                          },
                                          icon: Icon(Icons.camera))
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.camera_alt_outlined)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
