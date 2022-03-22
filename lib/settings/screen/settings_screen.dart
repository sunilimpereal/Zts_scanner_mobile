import 'package:flutter/material.dart';
import 'package:zts_scanner_mobile/authentication/login/bloc/login_bloc.dart';
import 'package:zts_scanner_mobile/authentication/login/widgets/button.dart';
import 'package:zts_scanner_mobile/authentication/login/widgets/text_field.dart';
import 'package:zts_scanner_mobile/utils/shared_pref.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController baseUrlController = TextEditingController();
  FocusNode baseUrlFocus = FocusNode();


  @override
  void initState() {
    baseUrlController.text = sharedPrefs.getbaseUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginBloc? loginBloc = LoginProvider.of(context);
    loginBloc!.changebaseUrl(baseUrlController.text);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.green),
          title: Text("Settings",
              style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 20)),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              //base url
              baseUrl(loginBloc),
              saveButton(loginBloc)
            ],
          ),
        ));
  }

  Widget baseUrl(LoginBloc? loginBloc) {
    return Container(
      child: Column(
        children: [
          ZTSTextField(
            width: 400,
            controller: baseUrlController,
            focusNode: baseUrlFocus,
            icon: Icons.email,
            labelText: 'Base Url',
            onChanged: (String value) {
              loginBloc!.changebaseUrl(value);
            },
            onfocus: baseUrlFocus.hasFocus,
            onTap: () {
              setState(() {});
            },
            stream: loginBloc!.baseUrl,
            heading: 'Base Url',
          ),
        ],
      ),
    );
  }

  
  Widget saveButton(LoginBloc? loginBloc) {
    return Container(
      child: Row(
        children: [
          ZTSStreamButton(
              width: 150,
              formValidationStream: loginBloc!.validateSettingsFormStream,
              submit: () {
                sharedPrefs.setbaseUrl(baseUrl: baseUrlController.text);
                Navigator.pop(context);
              },
              text: 'Save',
              errrorText: '',
              errorFlag: false)
        ],
      ),
    );
  }
}
