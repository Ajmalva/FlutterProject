import 'package:flutter_app0/model/photos_model.dart';
import 'package:flutter_app0/screens/profile_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app0/screens/widgets/photo_grid.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'widgets/top_bar.dart';

class HomepageScreen extends StatefulWidget {
  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {

  void  _profileEdit() {
    Navigator.of(context).pushNamed(ProfileScreen.routeName, arguments: "AJU")
          .then((value) => print("object $value"));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileTab(),
              const SizedBox(height: 10),
              Text(
                'Photograpghy',
                style: TextStyle(fontSize: 22, color: Color(0xff0B3D2E)),),
              const SizedBox(height: 10),
              PhotoGrid()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _profileEdit,child: Icon(Icons.edit),
      ),
    );
  }

  ValueListenableBuilder<Box<dynamic>> profileTab() {
    return ValueListenableBuilder(
              valueListenable: Hive.box('profile').listenable(),
              builder: (BuildContext context, Box value, Widget? child) =>
                  TopBar(
                title: value.get('name'),
                subtitle: 'Developer',
                color: Color(0xff0B3D2E),
              ),
          );
  }
}

