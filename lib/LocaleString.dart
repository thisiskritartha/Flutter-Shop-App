import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'homePage': 'Homepage',
          'onlineStore': 'OnlineStore',
          'cartList': 'Cart List',
          'loading': 'Loading...',
          'detailPage': 'Detail Page',
          'chooseLanguage': 'Choose a Language'
        },
        'ne_NEP': {
          'homePage': 'मुखपृष्ठ',
          'onlineStore': 'अनलाइन स्टोर',
          'cartList': 'कार्ट तालिका',
          'loading': 'लोड हुँदैछ...',
          'detailPage': 'विवरण पृष्ठ',
          'chooseLanguage': 'भाषा छनौट गर्नुहोस् |'
        }
      };
}
