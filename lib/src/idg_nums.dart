part of 'id_generator.dart';

/// Internal implementation for generating numeric IDs.
///
/// This class generates random IDs using only numeric characters (1-9).
/// Note that '0' is intentionally excluded to avoid potential confusion
/// in certain use cases.
///
/// **Note:** This is an internal class. Use [IDGenerator.generateNum] instead.
class _IDGNums extends _IDGeneratorInterface {
  /// Generates a numeric ID by randomly selecting digits.
  ///
  /// Each position in the ID is filled with a randomly selected digit
  /// from the available numeric character set (1-9).
  @override
  String generate(idLength) {
    var id = '';
    // Build ID character by character using random digit selection
    for (var i = 0; i < idLength; i++) {
      id += _numSymbols[_random.nextInt(_numSymbols.length)];
    }
    return id;
  }

  /// Returns a single random numeric character.
  ///
  /// Selects and returns one digit from the numeric character set.
  @override
  String symbol() {
    return _numSymbols[_random.nextInt(_numSymbols.length)];
  }
}
