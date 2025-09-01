part of 'id_generator.dart';

/// Internal implementation for generating alphabetic IDs.
///
/// This class generates random IDs using alphabetic characters (a-z)
/// with random case conversion. Each character has a 50% chance of
/// being uppercase or lowercase, providing good visual variety.
///
/// **Note:** This is an internal class. Use [IDGenerator.generateAlpha] instead.
class _IDGAlpha extends _IDGeneratorInterface {
  /// Randomly determines if the next character should be uppercase.
  ///
  /// Uses a fair coin flip (50/50 chance) to decide case for each character.
  bool get _isUppercase => _random.nextBool();

  /// Generates an alphabetic ID with random case mixing.
  ///
  /// Each position in the ID is filled with a randomly selected letter
  /// that has a random case (uppercase or lowercase).
  @override
  String generate(idLength) {
    var id = '';
    // Build ID character by character with random case selection
    for (var i = 0; i < idLength; i++) {
      _isUppercase
          ? id += _alphaSymbols[_random.nextInt(_alphaSymbols.length)]
                .toUpperCase()
          : id += _alphaSymbols[_random.nextInt(_alphaSymbols.length)];
    }
    return id;
  }

  /// Returns a single random alphabetic character with random case.
  ///
  /// Selects a letter from the alphabet and randomly applies upper or lower case.
  @override
  String symbol() {
    return _isUppercase
        ? _alphaSymbols[_random.nextInt(_alphaSymbols.length)].toUpperCase()
        : _alphaSymbols[_random.nextInt(_alphaSymbols.length)];
  }
}
