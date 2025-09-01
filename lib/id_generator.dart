/// A comprehensive Dart library for generating secure, customizable random IDs.
///
/// This library provides various methods to generate random identifiers using different
/// character sets including numeric, alphabetic, special characters, and mixed combinations.
/// It's designed for use cases such as generating unique tokens, session IDs, passwords,
/// or any scenario requiring random string generation.
///
/// ## Features
///
/// - **Numeric IDs**: Generate IDs using digits 1-9
/// - **Alphabetic IDs**: Generate IDs using lowercase and uppercase letters
/// - **Special Character IDs**: Generate IDs using common special characters
/// - **Mixed IDs**: Generate IDs combining all character types
/// - **Custom Mix**: Generate IDs with user-defined character type combinations
/// - **Batch Generation**: Generate multiple IDs at once
///
/// ## Example Usage
///
/// ```dart
/// import 'package:id_generator/id_generator.dart';
///
/// // Generate a 10-character numeric ID
/// String numericId = IDGenerator.generateNum(10);
/// print(numericId); // Example: "4827391065"
///
/// // Generate a 8-character alphabetic ID
/// String alphaId = IDGenerator.generateAlpha(8);
/// print(alphaId); // Example: "aBcDeFgH"
///
/// // Generate a 12-character mixed ID
/// String mixedId = IDGenerator.mix(12);
/// print(mixedId); // Example: "a7$bC3@dE9!f"
///
/// // Generate multiple IDs at once
/// List<String> ids = IDGenerator.listOfMix(5, 8);
/// print(ids); // Example: ["a7$bC3@d", "E9!fG2#h", ...]
/// ```
library;

export 'src/id_generator.dart';
