import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileNotFoundException implements Exception {}

class FileSystemUtils {
  static Future<Directory> getLocalDirectory(String folderName) async {
    Directory? externalStorage = await getExternalStorageDirectory();
    final Directory appDocDir = Directory('${externalStorage?.path}/$folderName/');

    if (!appDocDir.existsSync()) {
      appDocDir.create(recursive: true);
    }
    return appDocDir;
  }

  static Future<List<String>> getExternalDirectoriesList() async {
    Directory? directory = await getExternalStorageDirectory();
    List<FileSystemEntity> appExtDocDirs = directory!.listSync();
    List<String> appDocDirs = [];
    for (var appExtDocDir in appExtDocDirs) {
      appDocDirs.add(appExtDocDir.path);
    }
    return appDocDirs;
  }

  static Future<List<String>> getExternalFolderList(String folderName) async {
    Directory? directory = await getExternalStorageDirectory();
    Directory folderDirectory = Directory('${directory!.path}/$folderName/');
    List<FileSystemEntity> folderFiles = folderDirectory.listSync();
    List<String> paths = [];
    for (var folderFile in folderFiles) {
      paths.add(folderFile.path);
    }
    return paths;
  }

  static Future<File> getImageFileFromStorage(String imagePath) async {
    File imageFile = File(imagePath);

    if (await imageFile.exists()) {
      return imageFile;
    }
    throw FileNotFoundException();
  }
}
