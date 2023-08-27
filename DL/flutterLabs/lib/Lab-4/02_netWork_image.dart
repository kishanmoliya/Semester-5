import 'package:flutter/material.dart';

class NetWorkImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NetWork Image"),
      ),
      body: Image.network(
            'https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d5f8845dc.jpeg'),
    );
  }
}
