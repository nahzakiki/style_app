import 'dart:convert';
import 'dart:io';

import 'package:gallery_saver/files.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Api {
  static const BASE_URL = "";
  Future<dynamic> submit(String endpoint,XFile image) async{
    var url = Uri.parse("$BASE_URL/$endpoint");
    var file = File(image.path);

    var request = await http.MultipartRequest("POST",url);
    var fileStream = http.ByteStream(file.openRead());
    var fileLength = await file.length();
    var multipartFile = http.MultipartFile("outfit",fileStream,fileLength);
    request.files.add(multipartFile);

    final response = await request.send();
    if(response.statusCode == 200){
      var responseBody = await response.stream.transform(utf8.decoder).join();
      print(responseBody);
    }
  }
}