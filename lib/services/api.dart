import 'dart:convert';
import 'dart:io';

import 'package:gallery_saver/files.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Api {
  static const BASE_URL = "http://127.0.0.1:8080";
  Future<dynamic> submit(String endpoint, XFile image) async{
    File imageFile = File(image.path);
    print(image.path);
    var request = http.MultipartRequest('POST', Uri.parse('https://e501-2001-fb1-19-11d5-d8bf-3576-a1a5-10ef.ap.ngrok.io/predict'));

    var imageStream = http.ByteStream(imageFile.openRead());
    var imageLength = await imageFile.length();
    var imageMultipartFile = http.MultipartFile('outfit', imageStream, imageLength, filename: 'outfit.jpg'); // Update field name and file name
    request.files.add(imageMultipartFile);

    try {
      // Send the request and await for the response
      var response = await request.send();
      if (response.statusCode == 200) {
        // Handle response
        print('RESPONSE BODY: ');

        // Convert response to Dart's data structure (List/Map)

        // Convert Dart's data structure to model (POJO)

      } else {
        throw Exception('Server connection failed!'); // Use proper exception handling
      }
    } catch (e) {
      print('Error: $e'); // Print error for debugging
      throw Exception('Failed to upload image: $e'); // Provide meaningful error message
    }
  }
}