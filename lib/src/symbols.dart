part of 'id_generator.dart';

/// Numeric character set used for generating numeric IDs.
///
/// Contains digits 1-9. Note that '0' is intentionally excluded to avoid
/// potential confusion in contexts where '0' and 'O' might be ambiguous.
const _numSymbols = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

/// Alphabetic character set used for generating alphabetic IDs.
///
/// Contains all lowercase letters from 'a' to 'z'. These characters are
/// randomly converted to uppercase during ID generation to provide mixed case.
const _alphaSymbols = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z',
];

/// Special character set used for generating special character IDs.
///
/// Contains commonly used special characters that are safe for most contexts
/// including URLs, file names, and database identifiers. The set includes:
/// hyphen (-), underscore (_), and various symbols (!@#$%^&*).
const _specialSymbols = ['-', '_', '!', '@', '#', '\$', '%', '^', '&', '*'];
