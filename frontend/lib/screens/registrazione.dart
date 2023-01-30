import 'package:frontend/api/api.dart';
import 'package:frontend/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final userEmailController = TextEditingController();
  final userPwController = TextEditingController();

  void onAdd() {
    final String emailVal = userEmailController.text;
    final String pwVal = userPwController.text;

    if (emailVal.isNotEmpty && pwVal.isNotEmpty) {
      final User user = User(email: emailVal, pw: pwVal);
      Provider.of<UserProvider>(context, listen: false).registerUser(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrati')),
      body: ListView(
        children: [
          Container(
              child: Column(
            children: [
              TextField(
                controller: userEmailController,
              ),
              TextField(
                controller: userPwController,
              ),
              ElevatedButton(
                  child: Text('Add'),
                  onPressed: () {
                    onAdd();
                    Navigator.of(context).pop();
                  })
            ],
          ))
        ],
      ),
    );
  }
}
