import 'package:cryptorsa/Widgets/buttonwidget.dart';
import 'package:cryptorsa/Widgets/popupwidget.dart';
import 'package:cryptorsa/Widgets/textfieldwidget.dart';
import 'package:cryptorsa/constants/constants.dart';
import 'package:cryptorsa/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cryptorsa/constants/global.dart' as global;

const buttonTextRSAScreen = 'Submit';
String encrytedData = 'Encrypted String';

class KeySubmittionScreen extends StatefulWidget {
  const KeySubmittionScreen({Key? key}) : super(key: key);

  @override
  _KeySubmittionScreenState createState() => _KeySubmittionScreenState();
}

class _KeySubmittionScreenState extends State<KeySubmittionScreen> {
  String prikeyString = '';
  String pbKeyString = '';
  String newPrikeyString = '';
  String newPbKeyString = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3B0F99),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'CryptoRSA',
          style: TextStyle(
            fontFamily: 'Rajdhani',
            fontSize: 26.0,
          ),
        ),
        backgroundColor: const Color(0xff5A29C3),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff5A29C3),
              Color(0xff3B0F99),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Keys Submission', style: scaffoldBodyTextStyle),
            const SizedBox(height: 20.0),
            TextFieldWidget(
              hintTexts: 'Enter Your Public Key',
              textFieldFunction: (value) {
                pbKeyString = value;
              },
            ),
            const SizedBox(height: 20.0),
            TextFieldWidget(
                hintTexts: 'Enter Your Private Key',
                textFieldFunction: (value) {
                  prikeyString = value;
                }),
            const SizedBox(height: 20.0),
            AppButtonWidget(
              buttonTitle: buttonTextRSAScreen,
              buttonFunction: () async {
                newPbKeyString = '-----BEGIN PUBLIC KEY-----\n' +
                    pbKeyString +
                    '\n-----END PUBLIC KEY-----';

                newPrikeyString = '-----BEGIN RSA PRIVATE KEY-----\n' +
                    prikeyString +
                    '\n-----END RSA PRIVATE KEY-----';
                if (pbKeyString != '' && prikeyString != '') {
                  setState(() {
                    global.pbKeyForEncrypt = newPbKeyString;
                    global.priKeyForDecrypt = newPrikeyString;
                  });
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreenRsa()));
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => const PopUpWidget(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
