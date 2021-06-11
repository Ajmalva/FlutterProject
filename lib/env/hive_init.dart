import 'dart:io';

import 'package:flutter_app0/core/coltroller/database/userDB.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> hiveInit() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  Hive.init(appDocPath);

  await UserDB.init();
}
