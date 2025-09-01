import 'package:id_generator/id_generator.dart';

/// Example demonstrating the ID Generator package capabilities.
///
/// This example shows how to use all the different ID generation methods
/// available in the id_generator package.
void main() {
  print('🎯 ID Generator Example\n');

  // 🔢 Numeric ID Examples
  print('📊 Numeric IDs:');
  print('Single numeric ID (8 chars): ${IDGenerator.generateNum(8)}');
  print('Multiple numeric IDs: ${IDGenerator.listOfNums(3, 6)}');
  print('');

  // 🔤 Alphabetic ID Examples
  print('🔤 Alphabetic IDs:');
  print('Single alphabetic ID (10 chars): ${IDGenerator.generateAlpha(10)}');
  print('Multiple alphabetic IDs: ${IDGenerator.listOfAlpha(2, 8)}');
  print('');

  // 🔣 Special Character ID Examples
  print('🔣 Special Character IDs:');
  print('Single special ID (6 chars): ${IDGenerator.generateSpecial(6)}');
  print('Multiple special IDs: ${IDGenerator.listOfSpecial(2, 4)}');
  print('');

  // 🎭 Mixed ID Examples (Most Secure)
  print('🎭 Mixed IDs (All Character Types):');
  print('Single mixed ID (12 chars): ${IDGenerator.mix(12)}');
  print('Multiple mixed IDs: ${IDGenerator.listOfMix(3, 8)}');
  print('');

  // 🎯 Custom Mix Examples
  print('🎯 Custom Character Combinations:');

  // Only numbers and letters (no special chars) - good for user-friendly IDs
  print(
    'Numbers + Letters only: ${IDGenerator.customMix(10, [IdgEnum.nums, IdgEnum.alpha])}',
  );

  // Only special chars and numbers - good for secure tokens
  print(
    'Special + Numbers only: ${IDGenerator.customMix(8, [IdgEnum.special, IdgEnum.nums])}',
  );

  // Only alphabetic - good for readable codes
  print('Alphabetic only: ${IDGenerator.customMix(12, [IdgEnum.alpha])}');

  // Multiple custom IDs
  print(
    'Multiple custom IDs: ${IDGenerator.listOfCustomMix(3, 6, [IdgEnum.nums, IdgEnum.alpha])}',
  );
  print('');

  // 🚀 Use Case Examples
  print('🚀 Common Use Cases:');
  print('Session ID: ${IDGenerator.mix(16)}');
  print('API Key: ${IDGenerator.mix(32)}');
  print('File Name: file_${IDGenerator.generateAlpha(8)}.txt');
  print(
    'User Code: ${IDGenerator.customMix(6, [IdgEnum.nums, IdgEnum.alpha]).toUpperCase()}',
  );
  print('Database ID: ${IDGenerator.generateNum(10)}');
  print('Temporary Password: ${IDGenerator.mix(12)}');
  print('');

  // 📈 Performance Example
  print('📈 Batch Generation Performance:');
  final stopwatch = Stopwatch()..start();
  final batchIds = IDGenerator.listOfMix(100, 16);
  stopwatch.stop();
  print(
    'Generated 100 mixed IDs (16 chars each) in ${stopwatch.elapsedMicroseconds}μs',
  );
  print('First 5 IDs: ${batchIds.take(5).toList()}');
  print('');

  // 🔒 Security Features
  print('🔒 Security Features:');
  print('✅ Cryptographically secure random generation');
  print('✅ High entropy output (71 possible characters for mixed IDs)');
  print('✅ No predictable patterns');
  print('✅ Suitable for security-sensitive applications');
  print('');

  // 📊 Character Set Information
  print('📊 Character Sets:');
  print('Numeric: 1-9 (9 characters) - excludes 0 for clarity');
  print('Alphabetic: a-z, A-Z (52 characters) - mixed case');
  print('Special: - _ ! @ # \$ % ^ & * (10 characters) - URL safe');
  print('Mixed: All combined (71 characters) - maximum entropy');
}
