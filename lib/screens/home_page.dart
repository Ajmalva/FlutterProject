import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app0/model/photos_model.dart';
import 'widgets/top_bar.dart';
import 'package:flutter_app0/env/keys.dart' as config;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PhotosModel> _photosData = [];

  Future<void> _fetchPhotos() async {
    final _dioInstance = Dio();

    _dioInstance.options.headers['Authorization'] =
        "Client-ID ${config.unsplashkey}";

    final _fetchData =
        await _dioInstance.get('https://api.unsplash.com/photos');

    for (var _item in _fetchData.data) {
      setState(() {
        _photosData.add(
            PhotosModel(id: _item['id'], imgURL: _item['urls']['regular']));
      });
    }
  }

  @override
  void initState() {
    _fetchPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                title: 'Ajmal VA',
                subtitle: 'Developer',
                color: Color(0xff0B3D2E),
              ),
              const SizedBox(height: 10),
              Text(
                'Photograpghy',
                style: TextStyle(fontSize: 22, color: Color(0xff0B3D2E)),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: _photosData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (ctx, index) => Container(
                  child: Image.network(
                    _photosData[index].imgURL,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
