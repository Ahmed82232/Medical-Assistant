import 'package:flutter/material.dart';

class ocrPage extends StatefulWidget {
  const ocrPage({super.key});

  @override
  State<ocrPage> createState() => _ocrPageState();
}

class _ocrPageState extends State<ocrPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          child: Text(
            'Soon...',
            style: TextStyle(
                fontSize: 40, color: Colors.grey, ),
          ),
        ),
      ),
    );
  }
}
