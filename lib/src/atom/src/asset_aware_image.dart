import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A widget that displays an image from an asset path, automatically
/// choosing between [Image.asset] and [SvgPicture.asset] based on the file extension.
class AssetAwareImage extends StatelessWidget {
  const AssetAwareImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.gaplessPlayback = false,
    this.filterQuality = FilterQuality.high,
    this.color,
    this.errorBuilder,
    this.frameBuilder,
    this.package,
    this.colorFilter,
  });

  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final bool gaplessPlayback;
  final FilterQuality filterQuality;
  final Color? color;
  final Widget Function(BuildContext, Widget, int?, bool)? frameBuilder;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  final String? package;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    if (path.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        key: key,
        width: width,
        height: height,
        fit: fit,
        colorFilter: colorFilter,
      );
    } else {
      return Image.asset(
        path,
        key: key,
        width: width,
        height: height,
        color: color,
        fit: fit,
        gaplessPlayback: gaplessPlayback,
        filterQuality: filterQuality,
        errorBuilder: errorBuilder,
        package: package,
      );
    }
  }
}
