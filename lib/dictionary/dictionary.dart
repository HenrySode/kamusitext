import 'package:flutter/material.dart';

class Dictionary extends StatefulWidget {
  const Dictionary({super.key});

  @override
  State<Dictionary> createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary'),
        centerTitle: true,
      ),
      body: const Column(
        children: [Center(child: Text('Dictionary'))],
      ),
    );
  }
}
