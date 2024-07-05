import 'package:get/get_navigation/src/root/internacionalization.dart';

//Flutter GetX localization & Change App Language
class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'message': 'Hello, How Are You?',
          'name': 'Ram Sharma',
        },
        'np_NEP': {
          'message': 'नमस्ते, कस्तो छ ?',
          'name': 'राम शर्मा',
        }
      };
}
