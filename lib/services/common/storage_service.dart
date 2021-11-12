import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class StorageService {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future<String> upload(String filePath, String name) async {
    File file = File(filePath);
    try {
      await storage.ref('images/$name').putFile(file);
      return await storage.ref('images/$name').getDownloadURL();
    } on firebase_core.FirebaseException catch (e) {
      print(e);
      return "";
    }
  }
  
}