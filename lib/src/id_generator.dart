import 'dart:math';
part 'id_generator_base.dart';
part 'idg_nums.dart';
part 'idg_alpha.dart';
part 'idg_special.dart';
part 'symbols.dart';
part 'idg_enum.dart';

/// The main class for generating random IDs with various character sets.
///
/// This class provides static methods to generate random identifiers using
/// different character combinations. All methods are thread-safe and use
/// Dart's built-in Random class for cryptographically secure randomness.
///
/// The class supports:
/// - Numeric IDs (digits 1-9)
/// - Alphabetic IDs (mixed case letters a-z, A-Z)
/// - Special character IDs (common symbols)
/// - Mixed combinations of all character types
/// - Custom combinations with user-defined character types
class IDGenerator {
  IDGenerator._();
  static final _idgNums = _IDGNums();
  static final _idgAlpha = _IDGAlpha();
  static final _idgSpecial = _IDGSpecial();
  static final _random = Random();

  /// Generates a random numeric ID of the specified length.
  ///
  /// Creates an ID using only digits from 1 to 9. Note that '0' is excluded
  /// to avoid potential confusion in certain contexts.
  ///
  /// **Parameters:**
  /// - [idLength]: The desired length of the generated ID (must be positive)
  ///
  /// **Returns:**
  /// A string containing only numeric characters
  ///
  /// **Example:**
  /// ```dart
  /// String id = IDGenerator.generateNum(8);
  /// print(id); // Example output: "47382951"
  /// ```
  ///
  /// **Throws:**
  /// - [ArgumentError] if [idLength] is negative or zero
  static String generateNum(int idLength) => _idgNums.generate(idLength);

  /// Generates multiple random numeric IDs.
  ///
  /// Creates a list of numeric IDs, each with the specified length.
  /// This is more efficient than calling [generateNum] multiple times.
  ///
  /// **Parameters:**
  /// - [count]: The number of IDs to generate (must be positive)
  /// - [idLength]: The desired length of each ID (must be positive)
  ///
  /// **Returns:**
  /// A list of strings, each containing only numeric characters
  ///
  /// **Example:**
  /// ```dart
  /// List<String> ids = IDGenerator.listOfNums(3, 6);
  /// print(ids); // Example: ["473829", "194756", "829374"]
  /// ```
  static List<String> listOfNums(int count, int idLength) =>
      _idgNums.listOf(count, idLength);

  /// Generates a random alphabetic ID of the specified length.
  ///
  /// Creates an ID using both lowercase and uppercase letters (a-z, A-Z).
  /// The case of each character is randomly determined.
  ///
  /// **Parameters:**
  /// - [idLength]: The desired length of the generated ID (must be positive)
  ///
  /// **Returns:**
  /// A string containing only alphabetic characters with mixed case
  ///
  /// **Example:**
  /// ```dart
  /// String id = IDGenerator.generateAlpha(10);
  /// print(id); // Example output: "aBcDeFgHiJ"
  /// ```
  static String generateAlpha(int idLength) => _idgAlpha.generate(idLength);

  /// Generates multiple random alphabetic IDs.
  ///
  /// Creates a list of alphabetic IDs, each with the specified length.
  /// Each ID will contain mixed case letters.
  ///
  /// **Parameters:**
  /// - [count]: The number of IDs to generate (must be positive)
  /// - [idLength]: The desired length of each ID (must be positive)
  ///
  /// **Returns:**
  /// A list of strings, each containing only alphabetic characters
  ///
  /// **Example:**
  /// ```dart
  /// List<String> ids = IDGenerator.listOfAlpha(2, 8);
  /// print(ids); // Example: ["aBcDeFgH", "XyZaBcDe"]
  /// ```
  static List<String> listOfAlpha(int count, int idLength) =>
      _idgAlpha.listOf(count, idLength);

  /// Generates a random special character ID of the specified length.
  ///
  /// Creates an ID using common special characters: - _ ! @ # $ % ^ & *
  /// These characters are safe for most use cases including URLs and file names.
  ///
  /// **Parameters:**
  /// - [idLength]: The desired length of the generated ID (must be positive)
  ///
  /// **Returns:**
  /// A string containing only special characters
  ///
  /// **Example:**
  /// ```dart
  /// String id = IDGenerator.generateSpecial(6);
  /// print(id); // Example output: "!@#$%^"
  /// ```
  static String generateSpecial(int idLength) => _idgSpecial.generate(idLength);

  /// Generates multiple random special character IDs.
  ///
  /// Creates a list of special character IDs, each with the specified length.
  ///
  /// **Parameters:**
  /// - [count]: The number of IDs to generate (must be positive)
  /// - [idLength]: The desired length of each ID (must be positive)
  ///
  /// **Returns:**
  /// A list of strings, each containing only special characters
  ///
  /// **Example:**
  /// ```dart
  /// List<String> ids = IDGenerator.listOfSpecial(2, 4);
  /// print(ids); // Example: ["!@#$", "^&*_"]
  /// ```
  static List<String> listOfSpecial(int count, int idLength) =>
      _idgSpecial.listOf(count, idLength);

  /// Generates a random mixed ID combining all character types.
  ///
  /// Creates an ID that randomly combines numeric, alphabetic, and special
  /// characters. Each position in the ID is randomly selected from one of
  /// the three character sets, providing maximum entropy.
  ///
  /// **Parameters:**
  /// - [idLength]: The desired length of the generated ID (must be positive)
  ///
  /// **Returns:**
  /// A string containing a random mix of numeric, alphabetic, and special characters
  ///
  /// **Example:**
  /// ```dart
  /// String id = IDGenerator.mix(12);
  /// print(id); // Example output: "a7$bC3@dE9!f"
  /// ```
  static String mix(int idLength) {
    var id = '';
    for (var i = 0; i < idLength; i++) {
      final type = IdgEnum.values[_random.nextInt(IdgEnum.values.length)];
      switch (type) {
        case IdgEnum.nums:
          id += _idgNums.symbol();
          break;
        case IdgEnum.alpha:
          id += _idgAlpha.symbol();
          break;
        case IdgEnum.special:
          id += _idgSpecial.symbol();
          break;
      }
    }
    return id;
  }

  /// Generates multiple random mixed IDs.
  ///
  /// Creates a list of mixed IDs, each combining all character types.
  /// This is the most secure option for generating multiple unique identifiers.
  ///
  /// **Parameters:**
  /// - [count]: The number of IDs to generate (must be positive)
  /// - [idLength]: The desired length of each ID (must be positive)
  ///
  /// **Returns:**
  /// A list of strings, each containing mixed character types
  ///
  /// **Example:**
  /// ```dart
  /// List<String> ids = IDGenerator.listOfMix(3, 8);
  /// print(ids); // Example: ["a7$bC3@d", "E9!fG2#h", "K4%mN8&p"]
  /// ```
  static List<String> listOfMix(int count, int idLength) =>
      List.generate(count, (_) => mix(idLength));

  /// Generates a random ID with custom character type combinations.
  ///
  /// Creates an ID using only the character types specified in the [types] list.
  /// This allows for fine-grained control over the character composition.
  ///
  /// **Parameters:**
  /// - [idLength]: The desired length of the generated ID (must be positive)
  /// - [types]: List of character types to include (must not be empty)
  ///   - [IdgEnum.nums]: Include numeric characters (1-9)
  ///   - [IdgEnum.alpha]: Include alphabetic characters (a-z, A-Z)
  ///   - [IdgEnum.special]: Include special characters (- _ ! @ # $ % ^ & *)
  ///
  /// **Returns:**
  /// A string containing characters from the specified types only
  ///
  /// **Example:**
  /// ```dart
  /// // Generate ID with only numbers and letters (no special chars)
  /// String id = IDGenerator.customMix(10, [IdgEnum.nums, IdgEnum.alpha]);
  /// print(id); // Example output: "a7bC3dE9fG"
  /// ```
  ///
  /// **Throws:**
  /// - [ArgumentError] if [types] is empty
  static String customMix(int idLength, List<IdgEnum> types) {
    var id = '';
    for (var i = 0; i < idLength; i++) {
      final type = types[_random.nextInt(types.length)];
      switch (type) {
        case IdgEnum.nums:
          id += _idgNums.symbol();
          break;
        case IdgEnum.alpha:
          id += _idgAlpha.symbol();
          break;
        case IdgEnum.special:
          id += _idgSpecial.symbol();
          break;
      }
    }
    return id;
  }

  /// Generates multiple random IDs with custom character type combinations.
  ///
  /// Creates a list of IDs using only the character types specified in the [types] list.
  /// Each ID will have the same character type restrictions.
  ///
  /// **Parameters:**
  /// - [count]: The number of IDs to generate (must be positive)
  /// - [idLength]: The desired length of each ID (must be positive)
  /// - [types]: List of character types to include (must not be empty)
  ///
  /// **Returns:**
  /// A list of strings, each containing characters from the specified types only
  ///
  /// **Example:**
  /// ```dart
  /// // Generate 5 IDs with only special characters and numbers
  /// List<String> ids = IDGenerator.listOfCustomMix(
  ///   5, 6, [IdgEnum.special, IdgEnum.nums]
  /// );
  /// print(ids); // Example: ["!@1#2$", "3%4^5&", "*6_7-8"]
  /// ```
  static List<String> listOfCustomMix(
    int count,
    int idLength,
    List<IdgEnum> types,
  ) => List.generate(count, (_) => customMix(idLength, types));
}
