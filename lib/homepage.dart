import 'package:encryptor/encryption.dart';
import 'package:flutter/material.dart';

import 'decryption.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Encryptor',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Encryption()));
              },
              child: Text("Encrypt your message"),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Decryption()));
              },
              child: Text("Decrypt your message"),
            ),
          ],
        ),
      ),
    );
  }
}
