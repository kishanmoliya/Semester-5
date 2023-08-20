import 'package:flutter/material.dart';

class PasswordVisibiliity extends StatefulWidget {
  @override
  State<PasswordVisibiliity> createState() => _PasswordVisibilityState();
}

class _PasswordVisibilityState extends State<PasswordVisibiliity> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            obscureText: isHidden,
            decoration: InputDecoration(
              labelText: "PassWord",
              suffix: InkWell(
                onTap: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                child: const Icon( Icons.visibility),
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
