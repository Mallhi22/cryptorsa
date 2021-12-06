import 'package:cryptorsa/screens/rsakeyscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const CryptoRSA());
}

class CryptoRSA extends StatelessWidget {
  const CryptoRSA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RsaKeyScreen.id,
      routes: {
        RsaKeyScreen.id: (context) => const RsaKeyScreen(),
      },
    );
  }
}
