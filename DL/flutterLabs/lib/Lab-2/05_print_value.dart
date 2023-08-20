import 'package:flutter/material.dart';

class PrintTextFormFieldValue extends StatefulWidget {
  @override
  State<PrintTextFormFieldValue> createState() => _PrintTextFormFieldValueState();
}

class _PrintTextFormFieldValueState extends State<PrintTextFormFieldValue> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Print Form Field Value"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Enter Something"),
            ),
            ElevatedButton(
                onPressed: () {setState(() {});},
                child: const Text("Display")
            ),

            Text('Details: ${controller.text}')
          ],
        ),
      ),
    );
  }
}
