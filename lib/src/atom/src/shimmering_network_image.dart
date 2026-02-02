import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmeringNetworkImage extends StatelessWidget {
  const ShimmeringNetworkImage({
    super.key,
    required this.imageUrl,
    required this.errorWidgetBuilder,
    this.fit = BoxFit.contain,
  });

  final String imageUrl;
  final Widget Function(BuildContext, String, Object) errorWidgetBuilder;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(),
      ),
      errorWidget: errorWidgetBuilder,
    );
  }
}