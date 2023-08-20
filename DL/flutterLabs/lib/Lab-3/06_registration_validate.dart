import 'package:flutter/material.dart';

class RegistrationValidation extends StatefulWidget {
  @override
  State<RegistrationValidation> createState() => _RegistrationValidation();
}

class _RegistrationValidation extends State<RegistrationValidation> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Page Validation"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //First Name Field.
                getField("Enter Name"),
                getCard("Name", nameController),

                //City Field.
                getField("Enter City"),
                getCard("City", cityController),

                //Age Field
                getField("Enter Age"),
                getCard("Age", ageController),

                //Email Field
                getField("Enter Email"),
                getCard("Email", emailController),

                //PassWord Field
                getField("Enter PassWord"),
                Card(
                  elevation: 4,
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please Enter Password";
                      }
                    },
                    controller: passWordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "PassWord",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue,),
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _formKey.currentState!.validate();
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Create an Account',
                          style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getField(String field) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Text(
        field,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget getCard(String tLable, controller) {
    return Card(
      elevation: 4,
      child: TextFormField(
        validator: (value) {
          if(value!.isEmpty){
            return "Please Enter $tLable";
          }
        },
        controller: controller,
        decoration: InputDecoration(
          labelText: tLable,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
