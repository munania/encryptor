class CaesarCipher {
  // Encrypt the given text by shifting each letter by the specified shift amount
  static String encrypt(String text, int shift) {
    StringBuffer result = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      String char = text[i];

      // Only shift alphabetic characters
      if (char.contains(RegExp(r'[A-Za-z]'))) {
        // Determine whether the character is uppercase or lowercase
        bool isUpper = char == char.toUpperCase();

        // Convert to ASCII code
        int ascii = char.codeUnitAt(0);

        // Calculate the shift
        int baseAscii =
            isUpper ? 65 : 97; // ASCII for 'A' or 'a' - Uppercase and lowercase
        int shifted = ((ascii - baseAscii + shift) % 26) + baseAscii;

        result.write(String.fromCharCode(shifted));
      } else {
        // Keep non-alphabetic characters unchanged
        result.write(char);
      }
    }

    return result.toString();
  }

  // Decrypt by shifting in the opposite direction
  static String decrypt(String text, int shift) {
    // Decrypting is the same as encrypting with a negative shift
    return encrypt(text, -shift);
  }
}
