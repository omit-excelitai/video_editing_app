import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_editing_app/screens/edit/edit_screen.dart';
import 'package:video_editing_app/screens/test_editing_screen.dart';

import '../../main.dart';

class PickVideoScreen extends StatefulWidget {
  const PickVideoScreen({Key? key}) : super(key: key);

  @override
  State<PickVideoScreen> createState() => _PickVideoScreenState();
}

class _PickVideoScreenState extends State<PickVideoScreen> {
  final ImagePicker _picker = ImagePicker();

  void _pickVideo() async {
    final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
    if (mounted && file != null) {
      filePath = File(file.path);
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => EditScreen(isfromCreateButton: true,),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Click on the button to select video"),
            ElevatedButton(
              onPressed: _pickVideo,
              child: const Text("Pick Video From Gallery"),
            ),
          ],
        ),
      ),
    );
  }
}
