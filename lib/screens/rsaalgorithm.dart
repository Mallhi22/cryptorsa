import 'package:cryptorsa/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RsaAlgorithm extends StatelessWidget {
  static const String id = '/rsaalgorithm';
  const RsaAlgorithm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff5A29C3),
              Color(0xff3B0F99),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Text(
                'What is the RSA algorithm?',
                style: scaffoldBodyTextStyleDec,
              ),
              Text(
                'The RSA algorithm is an asymmetric cryptography algorithm; '
                'this means that it uses a public key and a private key (i.e two '
                'different, mathematically linked keys). As their names suggest, a '
                'public key is shared publicly, while a private key is secret and must '
                'not be shared with anyone.',
                style: scaffoldBodyTextStylealgo,
              ),
              SizedBox(height: 20.0),
              Text(
                'How it works?',
                style: scaffoldBodyTextStyleDec,
              ),
              Text(
                'The RSA algorithm ensures that the keys, in the above illustration, '
                'are as secure as possible. The following steps highlight how it works: '
                '\n\n'
                '1. Generating the keys\n'
                'a). Select two large prime numbers, x and y. The prime numbers need to be '
                'large so that they will be difficult for someone to figure out.\n'
                'b). Calculate n=x*y.\n'
                'c). Calculate the totient function; ϕ(n)=(x−1)(y−1).\n'
                'd). Select an integer e, such that e is co-prime to ϕ(n) and 1<e<ϕ(n). '
                'The pair of numbers (n,e) makes up the public key.\n'
                'e). Calculate d such that e.d = 1 mod ϕ(n).\n\n'
                '2. Encryption \n'
                'C = P^e mod n.\n\n'
                '3. Decryption \n'
                'P = C^e mod n.',
                style: scaffoldBodyTextStylealgo,
              ),
              SizedBox(height: 110.0),
            ],
          ),
        ),
      ),
    );
  }
}
