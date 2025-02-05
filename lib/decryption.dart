import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ceaser_cipher.dart';

class Decryption extends StatefulWidget {
  const Decryption({super.key});

  @override
  State<Decryption> createState() => _HomepageState();
}

class _HomepageState extends State<Decryption> {
  // Text controllers
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _shiftController = TextEditingController();

  String? displayText;

  void _displayMessage() {
    setState(() {
      int shift = int.parse(_shiftController.text);
      String encrypted = CaesarCipher.decrypt(_controller.text, shift);
      displayText = encrypted;
    });
  }

  // Copy decrypted message to clipboard
  void _copyToClipboard() {
    if (displayText != null && displayText!.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: displayText!));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Text copied to clipboard'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: _shiftController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter number to decrypt message with',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your message',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _displayMessage,
              child: const Text('Decrypt your message'),
            ),
            if (displayText != null && displayText!.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(displayText!),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: _copyToClipboard,
                      tooltip: 'Copy to clipboard',
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
