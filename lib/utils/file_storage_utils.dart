import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileSystemUtils {
  static Future<Directory> getLocalDirectory(String folderName) async {
    Directory? externalStorage = await getExternalStorageDirectory();
    final Directory appDocDir =
        Directory('${externalStorage?.path}/$folderName/');

    if (!appDocDir.existsSync()) {
      appDocDir.create(recursive: true);
    }
    return appDocDir;
  }
}
