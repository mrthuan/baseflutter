import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String resultImageUrl;

  const ResultScreen({super.key, required this.resultImageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Image.network(resultImageUrl),
      ),
    );
  }
}
