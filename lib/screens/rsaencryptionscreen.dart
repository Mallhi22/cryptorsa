import 'package:cryptorsa/Widgets/buttonwidget.dart';
import 'package:cryptorsa/Widgets/textfieldwidget.dart';
import 'package:cryptorsa/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:pointycastle/asymmetric/api.dart';
import 'package:cryptorsa/constants/global.dart' as global;
import 'package:flutter/services.dart';

const buttonTextRSAScreen = 'Encrypt';
String encrytedData = 'Encrypted String';

class RsaEncryptionScreen extends StatefulWidget {
  const RsaEncryptionScreen() : super();

  @override
  _RsaEncryptionScreenState createState() => _RsaEncryptionScreenState();
}

class _RsaEncryptionScreenState extends State<RsaEncryptionScreen> {
  String newString = '';
  String pbKeyString = '';
  String newPbKeyString = '';
  late final cipher;
  var updateText;
  Future rsaEncryption(
      String plainText, String rsaPbKey, String rsaPriKey) async {
    final publicKey = encrypt.RSAKeyParser().parse(rsaPbKey) as RSAPublicKey;
    final privKey = encrypt.RSAKeyParser().parse(rsaPriKey) as RSAPrivateKey;
    final encrypter = encrypt.Encrypter(
        encrypt.RSA(publicKey: publicKey, privateKey: privKey));
    final encrypted = encrypter.encrypt(plainText);
    return encrypted.base64;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff3B0F99),
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
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
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
            const Text('RSA Encryption', style: scaffoldBodyTextStyle),
            const SizedBox(height: 20.0),
            TextFieldWidget(
              hintTexts: 'Enter Your Plain Text to Encrypt',
              textFieldFunction: (value1) {
                newString = value1;
              },
            ),
            const SizedBox(height: 20.0),
            TextFieldWidget(
                hintTexts: 'Enter Receivers Public key',
                textFieldFunction: (value2) {
                  pbKeyString = value2;
                }),
            const SizedBox(height: 20.0),
            AppButtonWidget(
              buttonTitle: buttonTextRSAScreen,
              buttonFunction: () async {
                newPbKeyString = '-----BEGIN PUBLIC KEY-----\n' +
                    pbKeyString +
                    '\n-----END PUBLIC KEY-----';
                print(newPbKeyString);
                cipher = await rsaEncryption(
                    newString, newPbKeyString, global.priKeyForDecrypt);
                FocusScope.of(context).requestFocus(FocusNode());
                setState(() {
                  encrytedData = cipher;
                  print(cipher);
                });
              },
            ),
            const SizedBox(height: 20.0),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Text(
                        encrytedData,
                        style: inputTextStyle,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                      style: newTextButtonStyle,
                      onPressed: () {
                        if (cipher != null) {
                          Clipboard.setData(ClipboardData(text: cipher));
                        }
                      },
                      child: const Text(
                        'Copy Encrypted Text',
                        style: TextStyle(fontFamily: 'Rajdhani'),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
