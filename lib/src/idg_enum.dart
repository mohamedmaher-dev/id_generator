part of 'id_generator.dart';

/// Enumeration defining the available character types for ID generation.
///
/// This enum is used with [IDGenerator.customMix] and [IDGenerator.listOfCustomMix]
/// to specify which character sets should be included in the generated IDs.
///
/// **Values:**
/// - [nums]: Include numeric characters (1-9)
/// - [alpha]: Include alphabetic characters (a-z, A-Z with random case)
/// - [special]: Include special characters (- _ ! @ # $ % ^ & *)
enum IdgEnum {
  /// Numeric characters: 1, 2, 3, 4, 5, 6, 7, 8, 9
  nums,

  /// Alphabetic characters: a-z, A-Z (with random case mixing)
  alpha,

  /// Special characters: - _ ! @ # $ % ^ & *
  special,
}
