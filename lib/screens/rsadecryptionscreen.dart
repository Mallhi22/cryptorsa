import 'package:cryptorsa/Widgets/buttonwidget.dart';
import 'package:cryptorsa/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:pointycastle/asymmetric/api.dart';
import 'package:cryptorsa/constants/global.dart' as global;
import 'package:cryptorsa/Widgets/textfieldwidget.dart';

const buttonTextRSADScreen = 'Decrypt';
String encrytedData = 'Decrypted String';

class RsaDecryptionScreen extends StatefulWidget {
  const RsaDecryptionScreen({Key? key}) : super(key: key);

  @override
  _RsaDecryptionScreenState createState() => _RsaDecryptionScreenState();
}

class _RsaDecryptionScreenState extends State<RsaDecryptionScreen> {
  String encryptedString = '';
  late final mainText;
  Future rsaEncryption(
      String plainText, String rsaPbKey, String rsaPriKey) async {
    final publicKey = encrypt.RSAKeyParser().parse(rsaPbKey) as RSAPublicKey;
    final privKey = encrypt.RSAKeyParser().parse(rsaPriKey) as RSAPrivateKey;
    final encrypter = encrypt.Encrypter(
        encrypt.RSA(publicKey: publicKey, privateKey: privKey));
    final newPlainText = encrypt.Encrypted.fromBase64(plainText);
    final decrypted = encrypter.decrypt(newPlainText);
    return decrypted;
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
            const Text('RSA Decryption', style: scaffoldBodyTextStyle),
            const SizedBox(height: 20.0),
            TextFieldWidget(
              hintTexts: 'Enter Encrypted Text to Decrypt',
              textFieldFunction: (value) {
                encryptedString = value;
              },
            ),
            const SizedBox(height: 20.0),
            AppButtonWidget(
              buttonTitle: buttonTextRSADScreen,
              buttonFunction: () async {
                print('Decrypt Button Pressed.');
                mainText = await rsaEncryption(encryptedString,
                    global.pbKeyForEncrypt, global.priKeyForDecrypt);
                print(mainText);
                FocusScope.of(context).requestFocus(FocusNode());
                setState(() {
                  encrytedData = mainText;
                });
              },
            ),
            const SizedBox(height: 20.0),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20.0, top: 20.0, right: 20.0, bottom: 70.0),
                child: SingleChildScrollView(
                  child: Text(
                    encrytedData,
                    style: inputTextStyle,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
            //const SizedBox(height: 250.0),
          ],
        ),
      ),
    );
  }
}
