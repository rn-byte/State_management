import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageTranslation extends StatefulWidget {
  const LanguageTranslation({super.key});

  @override
  State<LanguageTranslation> createState() => _LanguageTranslationState();
}

class _LanguageTranslationState extends State<LanguageTranslation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Translation'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text('message'.tr),
              subtitle: Text('name'.tr),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Get.updateLocale(const Locale('en', 'US'));
                    },
                    child: const Text('English')),
                const SizedBox(
                  width: 30,
                ),
                OutlinedButton(
                    onPressed: () {
                      Get.updateLocale(const Locale('np', 'NEP'));
                    },
                    child: const Text('Nepali')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
