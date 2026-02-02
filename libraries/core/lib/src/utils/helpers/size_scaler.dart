import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A utility for scaling dimensions from a base design size to any device screen
/// Handles automatic adaptation across different device sizes (phones, tablets)
class SizeScaler {
  SizeScaler._();

  // Base design dimensions in LOGICAL PIXELS (dp)
  static double _baseWidth = 360;
  static double _baseHeight = 800;

  // Device screen info
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _pixelRatio;
  static late double _textScaleFactor;
  static late EdgeInsets _safeAreaInsets;
  static late Orientation _orientation;
  static late double _aspectRatio;

  /// Initialize with the base design size and context
  /// Call this in your app initialization (e.g., in MaterialApp's builder)
  static void init(
    BuildContext context, {
    double baseWidth = 360,
    double baseHeight = 800,
  }) {
    final mediaQuery = MediaQuery.of(context);
    _baseWidth = baseWidth;
    _baseHeight = baseHeight;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _textScaleFactor = mediaQuery.textScaler.scale(1);
    _safeAreaInsets = mediaQuery.padding;
    _orientation = mediaQuery.orientation;
    _aspectRatio = _screenWidth / _screenHeight;
  }

  /// Width scale factor (proportional to screen width)
  static double get _widthFactor => _screenWidth / _baseWidth;

  /// Height scale factor (proportional to screen height)
  static double get _heightFactor => _screenHeight / _baseHeight;

  /// Uniform scale factor (minimum of width/height scales)
  /// Ensures content fits within both dimensions
  static double get _uniformFactor {
    final double widthFactor = _screenWidth / _baseWidth;
    final double heightFactor = _screenHeight / _baseHeight;
    return math.min(widthFactor, heightFactor);
  }

  /// Scale dimension proportionally to screen width
  static double scaleWidth(double size) => size * _widthFactor;

  /// Scale dimension proportionally to screen height
  static double scaleHeight(double size) => size * _heightFactor;

  /// Scale dimension uniformly (based on smaller of width/height factor)
  static double scale(double size) => size * _uniformFactor;

  static double get scaleMultiplier => .97; //Change this adjust size

  /// Scale font size with adaptive sizing for different devices
  /// Improved algorithm based on Sizer package but with additional adjustments
  static double fontSize(double fontSize) {
    // Width scaling factor (primary)
    final widthScale = _screenWidth / _baseWidth;

    // Height scaling factor (secondary)
    final heightScale = _screenHeight / _baseHeight;

    // Aspect ratio correction factor
    final aspectRatioCorrection =
        math.sqrt(_aspectRatio / (_baseWidth / _baseHeight));

    // Combined scaling with weights (60% width, 30% height, 10% aspect ratio)
    double scaleFactor = (0.6 * widthScale) +
        (0.3 * heightScale) +
        (0.1 * aspectRatioCorrection);

    // Adjust for pixel density (less impact than screen size)
    scaleFactor *= math.pow(_pixelRatio, 0.15);

    // Apply non-linear scaling curve for better results
    // This curve reduces scaling impact at extreme sizes
    scaleFactor = 0.5 + (scaleFactor - 0.5) * 0.8;

    // Minimum and maximum bounds
    scaleFactor = scaleFactor.clamp(0.8, 1.5);

    // Apply user's text scale preference
    return fontSize * scaleFactor * _textScaleFactor * scaleMultiplier;
  }

  /// Get safe area width (accounting for system UI intrusions)
  static double get safeWidth =>
      _screenWidth - _safeAreaInsets.left - _safeAreaInsets.right;

  /// Get safe area height (accounting for system UI intrusions)
  static double get safeHeight =>
      _screenHeight - _safeAreaInsets.top - _safeAreaInsets.bottom;

  /// Scale dimension as percentage of screen width
  static double widthPercent(double percent) {
    assert(percent >= 0 && percent <= 100,
        'Percentage should be between 0 and 100');
    return _screenWidth * percent / 100;
  }

  /// Scale dimension as percentage of screen height
  static double heightPercent(double percent) {
    assert(percent >= 0 && percent <= 100,
        'Percentage should be between 0 and 100');
    return _screenHeight * percent / 100;
  }

  /// Scale dimension as percentage of safe area width
  static double safeWidthPercent(double percent) {
    assert(percent >= 0 && percent <= 100,
        'Percentage should be between 0 and 100');
    return safeWidth * percent / 100;
  }

  /// Scale dimension as percentage of safe area height
  static double safeHeightPercent(double percent) {
    assert(percent >= 0 && percent <= 100,
        'Percentage should be between 0 and 100');
    return safeHeight * percent / 100;
  }

  /// Get current device orientation
  static Orientation get orientation => _orientation;

  /// Get device pixel ratio
  static double get pixelRatio => _pixelRatio;

  /// Get device aspect ratio
  static double get aspectRatio => _aspectRatio;

  static double gridChildAspectRatio(
      {required num height, required int numOfcolumns}) {
    assert(height > 0 && numOfcolumns > 0,
        'Height and/or number of columns should not be 0');
    return (_baseWidth / numOfcolumns) / height;
  }
}

/// Extension methods for easy scaling
extension SizeScalerExtension on num {
  /// Scale proportionally to width
  double get w => SizeScaler.scaleWidth(toDouble());

  /// Scale proportionally to height
  double get h => SizeScaler.scaleHeight(toDouble());

  /// Scale uniformly (maintains aspect ratio)
  double get scale => SizeScaler.scale(toDouble());

  /// Scale font size
  double get sp => SizeScaler.fontSize(toDouble());

  /// Calculate percentage of screen width
  double get wp => SizeScaler.widthPercent(toDouble());

  /// Calculate percentage of screen height
  double get hp => SizeScaler.heightPercent(toDouble());

  /// Calculate percentage of safe width
  double get swp => SizeScaler.safeWidthPercent(toDouble());

  /// Calculate percentage of safe height
  double get shp => SizeScaler.safeHeightPercent(toDouble());
}
