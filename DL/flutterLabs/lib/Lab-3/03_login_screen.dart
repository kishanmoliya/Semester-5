import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Name Field.
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),

            //PassWord Field
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "PassWord",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Submit'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
