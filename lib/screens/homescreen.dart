import 'package:cryptorsa/Widgets/buttonwidget.dart';
import 'package:cryptorsa/constants/constants.dart';
import 'package:cryptorsa/screens/rsadecryptionscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cryptorsa/screens/rsaencryptionscreen.dart';

const scaffoldBodyText =
    'You can Encrypt or Decrypt your message Here. Please note that You need to ask public key from the receiver to encrypt your Message for him/her.';
const buttonTextOne = 'RSA Encryption';
const buttonTextTwo = 'RSA Decryption';

class HomeScreenRsa extends StatefulWidget {
  const HomeScreenRsa({Key? key}) : super(key: key);

  @override
  State<HomeScreenRsa> createState() => _HomeScreenRsaState();
}

class _HomeScreenRsaState extends State<HomeScreenRsa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff5A29C3),
              Color(0xff3B0F99),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/rsa_logo.png',
              width: 180.0,
            ),
            const Text(
              scaffoldBodyText,
              textAlign: TextAlign.center,
              style: scaffoldBodyTextStyleDec,
            ),
            const SizedBox(height: 50.0),
            AppButtonWidget(
              buttonTitle: buttonTextOne,
              buttonFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RsaEncryptionScreen()));
              },
            ),
            const SizedBox(height: 20.0),
            AppButtonWidget(
              buttonTitle: buttonTextTwo,
              buttonFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RsaDecryptionScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
