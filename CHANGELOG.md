# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-01-20

### Added

- Initial release of ID Generator library
- Support for numeric ID generation (digits 1-9)
- Support for alphabetic ID generation with mixed case (a-z, A-Z)
- Support for special character ID generation (- \_ ! @ # $ % ^ & \*)
- Mixed ID generation combining all character types
- Custom mix functionality with user-defined character type combinations
- Batch generation methods for efficient multiple ID creation
- Comprehensive documentation and examples
- Thread-safe implementation using Dart's Random class
- Professional API documentation with detailed examples

### Features

- `IDGenerator.generateNum()` - Generate numeric IDs
- `IDGenerator.generateAlpha()` - Generate alphabetic IDs
- `IDGenerator.generateSpecial()` - Generate special character IDs
- `IDGenerator.mix()` - Generate mixed IDs with all character types
- `IDGenerator.customMix()` - Generate IDs with custom character combinations
- `IDGenerator.listOfNums()` - Batch generate numeric IDs
- `IDGenerator.listOfAlpha()` - Batch generate alphabetic IDs
- `IDGenerator.listOfSpecial()` - Batch generate special character IDs
- `IDGenerator.listOfMix()` - Batch generate mixed IDs
- `IDGenerator.listOfCustomMix()` - Batch generate custom mix IDs
- `IdgEnum` - Enumeration for specifying character types

### Security

- Uses cryptographically secure random number generation
- High entropy output suitable for security-sensitive applications
- Carefully chosen character sets to avoid common confusion issues
