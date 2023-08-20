import 'package:flutter/material.dart';

class AssetsImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asset Image."),
      ),
      body: const Image(
        image: AssetImage('assets/images/person.jfif'),
      ),
    );
  }
}
