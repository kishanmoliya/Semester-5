import 'package:diploma_projects/Lab-1/02_horizontal_part.dart';
import 'package:diploma_projects/Lab-2/06_second_screen.dart';
import 'package:flutter/material.dart';

class MaterialPageRoutee extends StatefulWidget {
  const MaterialPageRoutee({Key? key}) : super(key: key);

  @override
  State<MaterialPageRoutee> createState() => _MaterialPageRouteeState();
}

class _MaterialPageRouteeState extends State<MaterialPageRoutee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HorizontalPart_1_2(),
              ),
            );
          },
          child: const Text("Chick to Navigate"),
        ),
      ),
    );
  }
}
