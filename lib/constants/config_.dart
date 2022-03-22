import 'package:zts_scanner_mobile/utils/shared_pref.dart';

class Config {
   String API_ROOT = sharedPrefs.getbaseUrl + 'api/v2/';
   String API_ROOTV1 = sharedPrefs.getbaseUrl + 'api/v1/';
   String ICON_ROOT = 'https://zts.afroaves.com/icons/';

  //  String API_ROOT = 'http://zts.afroaves.com:8080/api/v2/';
  //  String API_ROOTV1 = 'http://zts.afroaves.com:8080/api/v1/';
  //  String ICON_ROOT = 'https://zts.afroaves.com/icons/';

  // String API_ROOT = 'http://192.168.43.194:8000/api/v2/';
  // String API_ROOTV1 = 'http://192.168.43.194:8000/api/v1/';
  // String ICON_ROOT = 'https://zts.afroaves.com/icons/';
}
