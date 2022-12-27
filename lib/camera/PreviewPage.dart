import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PreviewPage extends StatelessWidget {
  final XFile image;

  const PreviewPage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final color = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: const Text('Preview Page')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.file(File(image.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
        ]),
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    final imagePath = this.image.path;
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: 250,
          height: 250,

        ),
      ),
    );
  }
}
