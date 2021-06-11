import 'package:flutter/material.dart';
import 'package:flutter_app0/core/coltroller/api.dart';
import 'package:flutter_app0/model/photos_model.dart';
import 'package:flutter_app0/screens/widgets/photo_tile.dart';

class PhotoGrid extends StatefulWidget {
  @override
  _PhotoGridState createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  List<PhotosModel> _photosData = [];

  Future<void> _fetchPhotos() async {
    PhotoAPI _photosAPI = PhotoAPI();
    List<PhotosModel> _tempPhotoData =
        await _photosAPI.fetchPhotos().catchError((err) => print(err));
    setState(() => _photosData = _tempPhotoData);
  }

  @override
  void initState() {
    _fetchPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: _photosData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
      itemBuilder: (ctx, index) => photoTile(url: _photosData[index].imgURL),
    );
  }
}
