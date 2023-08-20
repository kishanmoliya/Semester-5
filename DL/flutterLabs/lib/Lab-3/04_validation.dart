  import 'package:flutter/material.dart';

  class LoginValidation extends StatefulWidget {
    @override
    State<LoginValidation> createState() => _LoginValidationState();
  }

  class _LoginValidationState extends State<LoginValidation> {
    final _formKey = GlobalKey<FormState>();
    TextEditingController passController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("LoginValidation Demo"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Name Field.
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                //PassWord Field
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please Enter Password";
                      } else if(!RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)').hasMatch(value)){
                        return " Password should contain Capital, small letter & Number & Special";
                      }
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "PassWord",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                //Email Field
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please Enter Password";
                      } else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                        return " Please Enter a Valid Email";
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.validate();
                    },
                    child: const Text(
                        'Submit'
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
