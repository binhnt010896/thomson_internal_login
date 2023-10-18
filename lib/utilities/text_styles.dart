import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const semiBold = FontWeight.w600;
const medium = FontWeight.w500;

abstract class TextStyles {
  /// Headlines
  ///
  static final TextStyle headlineL = TextStyle(
    letterSpacing: 1.28,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static final TextStyle headlineM = TextStyle(
    letterSpacing: 1.04,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static final TextStyle headlineS = TextStyle(
    letterSpacing: 0.88,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static final TextStyle headlineXS = TextStyle(
    letterSpacing: 0.72,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static final TextStyle headlineXXS = TextStyle(
    letterSpacing: 0.56,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.7,
  );

  /// Paragraphs
  ///
  static final TextStyle paragraphL = TextStyle(
    letterSpacing: 0.64,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.7,
  );

  static final TextStyle paragraphM = TextStyle(
    letterSpacing: 0.56,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.7,
  );

  /// Labels
  ///
  static final TextStyle labelL = TextStyle(
    letterSpacing: 0.56,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.7,
  );

  static final TextStyle labelM = TextStyle(
    letterSpacing: 0.48,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  /// Captions
  ///
  static final TextStyle captionL = TextStyle(
    letterSpacing: 0.24,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.25,
  );

  static final TextStyle captionM = TextStyle(
    letterSpacing: 0.2,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.25,
  );

  /// Buttons
  ///
  static final TextStyle buttonL = TextStyle(
    letterSpacing: 0.72,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static final TextStyle buttonM = TextStyle(
    letterSpacing: 0.56,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static final TextStyle buttonS = TextStyle(
    letterSpacing: 0.2,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  /// Body
  ///
  static final TextStyle bodyM = TextStyle(
    letterSpacing: 0.24,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.7,
  );
}
