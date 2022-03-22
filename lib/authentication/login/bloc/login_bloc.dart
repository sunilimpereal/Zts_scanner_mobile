import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:zts_scanner_mobile/authentication/login/bloc/validation_mixin.dart';

class LoginBloc with ValidationMixin {
  final _mobile = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _baseUrl = BehaviorSubject<String>();

  //gettters
  Function(String) get changeMobile => _mobile.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changebaseUrl => _baseUrl.sink.add;

  //streams
  Stream<String> get mobile => _mobile.stream.transform(validatorMobile);
  Stream<String> get password => _password.stream.transform(validatorPassword);
  Stream<String> get baseUrl => _baseUrl.stream.transform(validatorbaseUrl);

  Stream<bool> get submitValidForm => Rx.combineLatest2(mobile, password, (e, n) => true);
  Stream<List<String>> get validateFormStream => Rx.combineLatestList(
        [
          mobile,
          password,
        ],
      );
          Stream<List<String>> get validateSettingsFormStream => Rx.combineLatestList(
        [
          baseUrl,
        ],
      );

  dispose() {
    _mobile.close();
    _password.close();
    _baseUrl.close();
  }
}

class LoginProvider extends InheritedWidget {
  final bloc = LoginBloc();
  LoginProvider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static LoginBloc? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<LoginProvider>())!.bloc;
  }
}
