part of "id_generator.dart";

/// Abstract base interface for ID generation implementations.
///
/// This interface defines the contract that all ID generators must follow.
/// It provides common functionality for generating individual IDs and
/// creating lists of IDs with consistent behavior across different
/// character set implementations.
///
/// **Note:** This is an internal class and should not be used directly.
/// Use the public [IDGenerator] class instead.
abstract class _IDGeneratorInterface {
  /// Shared random number generator for cryptographically secure randomness.
  final Random _random = Random();

  /// Generates a single ID of the specified length.
  ///
  /// **Parameters:**
  /// - [idLength]: The desired length of the generated ID
  ///
  /// **Returns:**
  /// A randomly generated string of the specified length
  String generate(int idLength);

  /// Generates a list of IDs with the specified count and length.
  ///
  /// This method provides efficient batch generation by reusing the
  /// underlying generation logic multiple times.
  ///
  /// **Parameters:**
  /// - [count]: The number of IDs to generate
  /// - [idLength]: The desired length of each ID
  ///
  /// **Returns:**
  /// A list containing the specified number of generated IDs
  List<String> listOf(int count, int idLength) =>
      List.generate(count, (_) => generate(idLength));

  /// Generates a single random character from the implementation's character set.
  ///
  /// This method is used internally for building IDs character by character.
  ///
  /// **Returns:**
  /// A single character from the specific character set
  String symbol();
}
