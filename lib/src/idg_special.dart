part of 'id_generator.dart';

/// Internal implementation for generating special character IDs.
///
/// This class generates random IDs using common special characters
/// that are safe for most use cases including URLs, file names, and
/// database identifiers. The character set includes: - _ ! @ # $ % ^ & *
///
/// **Note:** This is an internal class. Use [IDGenerator.generateSpecial] instead.
class _IDGSpecial extends _IDGeneratorInterface {
  /// Generates a special character ID by randomly selecting symbols.
  ///
  /// Each position in the ID is filled with a randomly selected special
  /// character from the predefined safe character set.
  @override
  String generate(idLength) {
    var id = '';
    // Build ID character by character using random special character selection
    for (var i = 0; i < idLength; i++) {
      id += _specialSymbols[_random.nextInt(_specialSymbols.length)];
    }
    return id;
  }

  /// Returns a single random special character.
  ///
  /// Selects and returns one special character from the safe character set.
  @override
  String symbol() {
    return _specialSymbols[_random.nextInt(_specialSymbols.length)];
  }
}
