import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File? _imageFile;
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      cropImage(File(image.path));
    }
  }

  Future<void> cropImage(File file) async {
    final ImageCropper imageCropper = ImageCropper();
    final CroppedFile? croppedImage = await imageCropper.cropImage(
      sourcePath: file.path,
      maxWidth: 512,
      maxHeight: 512,
    );
    if (croppedImage != null) {
      setState(() {
        _imageFile = File(croppedImage.path);
      });
    }
  }

  String _enteredText = '';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          'John Wilson',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Partage tes moment de via',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Color.fromARGB(255, 230, 177, 4),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                // color: Colors.amberAccent,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Seletionne puis decris un de tess',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          'plusbeaux cliches !',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Icon(Icons.format_paint_outlined)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _imageFile != null
                          ? Image.file(
                              _imageFile!,
                              width: 200,
                              height: 200,
                            )
                          : Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.gradient_outlined,
                                    color: Colors.red,
                                    size: 45,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      'Parcourirmes photos',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Text(
                'Date',
                style: TextStyle(color: Colors.grey[900]),
              ),
              Text(
                '14 juillet 2023 09:53',
                style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 75,
              ),
              TextField(
                textAlign: TextAlign.start,
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    _enteredText = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Description',
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    hoverColor: Colors.grey,
                    border: const OutlineInputBorder(),
                    counterText: '${_enteredText.length.toString()} /300',
                    counterStyle:
                        const TextStyle(fontSize: 15, color: Colors.grey)),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * .9,
                child: ElevatedButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: Text(
                    'Publier',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    primary: Colors.red,
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
