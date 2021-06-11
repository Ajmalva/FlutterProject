import 'package:flutter/material.dart';
import 'package:flutter_app0/core/coltroller/database/userDB.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/ProfileScreen';
  final _formKey = GlobalKey<FormState>();
  String _name = '';

  void onFormSubmit() {
    _formKey.currentState!.save();
    UserDB _userDB = UserDB();
    _userDB.saveData(name: _name);
  }

  @override
  Widget build(BuildContext context) {
    final _arg = ModalRoute.of(context)!.settings.arguments;
    print(_arg);
    return Scaffold(
      appBar: customAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                  ),
                  onSaved: (_val) {
                    _name = _val!;
                  },
                ),
                TextButton(onPressed: onFormSubmit, child: Text("Done"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar customAppbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop("name result");
          },
          icon: Icon(Icons.arrow_back_ios)),
    );
  }
}
