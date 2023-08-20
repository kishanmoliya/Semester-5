import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
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
                  padding: EdgeInsets.all(8),
                  child: TextButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
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
      margin: EdgeInsets.only(top: 12),
      child: Text(
        field,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget getCard(String tLable, controller) {
    return Card(
      elevation: 4,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: tLable,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
