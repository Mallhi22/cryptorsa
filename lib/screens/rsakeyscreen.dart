import 'package:cryptorsa/Widgets/buttonwidget.dart';
import 'package:cryptorsa/constants/constants.dart';
import 'package:cryptorsa/screens/keysubmittionscreen.dart';
import 'package:cryptorsa/screens/rsaalgorithm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const scaffoldBodyText =
    'This App is basically just for an educational purpose.';
const buttonTextrsa = 'Submit Your Keys';

class RsaKeyScreen extends StatefulWidget {
  static const String id = '/rsakeyscreen';
  const RsaKeyScreen({Key? key}) : super(key: key);

  @override
  _RsaKeyScreenState createState() => _RsaKeyScreenState();
}

class _RsaKeyScreenState extends State<RsaKeyScreen> {
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
              style: scaffoldBodyTextStyle,
            ),
            const SizedBox(height: 50.0),
            AppButtonWidget(
              buttonTitle: buttonTextrsa,
              buttonFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const KeySubmittionScreen()));
              },
            ),
            const SizedBox(height: 5.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RsaAlgorithm()));
              },
              child: const Text(
                'What is the RSA Algorithm?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            const Text(
              '© 2021 MR Group',
              style: TextStyle(
                fontFamily: 'Rajdhani',
                color: Color(0xffDCC1F8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
