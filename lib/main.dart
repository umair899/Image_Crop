import 'package:flutter/material.dart';

import 'Pages/Pick_images.dart';

void main() {
  runApp(const Cropper());
}

class Cropper extends StatelessWidget {
  const Cropper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.grey[300],
              elevation: 0,
            )
          ),
          title: 'Images&Cropper',
          
          home: PickImage(),
        );
      }
  }

