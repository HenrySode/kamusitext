import 'package:flutter/material.dart';
import 'package:kamusitest/dictionary/dictionary.dart';
import 'package:kamusitest/translation/services.dart';
import 'package:kamusitest/translation/translationModel.dart';

class Translation extends StatefulWidget {
  const Translation({super.key});

  @override
  State<Translation> createState() => _TranslationState();
}

class _TranslationState extends State<Translation> {
  TranslationModel? translationModel;
  bool isLoading = false;
  String noDataFound = "Now you can search";

  searchContain(String name) async {
    setState(() {
      isLoading = true;
    });
    try {
      translationModel = await APIServices.fetchData(name);
    } catch (e) {
      translationModel = null;
      noDataFound = "Meaning can't found";
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translation'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //button toward dictionary page
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dictionary()),
                );
              },
              child: const Text('DICTIONARY')),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: noDataFound,
              ),
              onSubmitted: (value) {
                searchContain(value);
              },
            ),
          ),
          if (isLoading)
            const LinearProgressIndicator()
          else if (translationModel != null)
            Expanded(
                child: Column(
              children: [
                Text(translationModel!.name),
                Text(translationModel!.description)
              ],
            ))
        ],
      ),
    );
  }
}
