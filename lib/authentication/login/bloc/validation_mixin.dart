import 'dart:async';

class ValidationMixin {
  final validatorMobile = StreamTransformer<String, String>.fromHandlers(handleData: (mobile, sink) {
    if (mobile.contains(' ')) {
      sink.addError('Enter valid Mobile number');
    } else if (mobile.contains(r'a-z')) {
      sink.addError('Enter valid Mobile number');
    } else {
      sink.add(mobile);
    }
  });
  final validatorPassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (password, sink1) {
    if (password.length < 1) {
      sink1.addError('Please Enter Valid password');
    } else {
      sink1.add(password);
    }
  });
  final validatorNumber =
      StreamTransformer<String, String>.fromHandlers(handleData: (number, sink1) {
    if (number.length > 10) {
      sink1.addError('Please Enter Valid number');
    } else {
      sink1.add(number);
    }
  });
}
