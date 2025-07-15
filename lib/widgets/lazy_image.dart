import 'package:flutter/material.dart';

class LazyImage extends StatelessWidget {
  final String src;
  final String alt;
  final String? placeholder;
  final double? width;
  final double? height;
  final BoxFit fit;

  const LazyImage({
    super.key,
    required this.src,
    required this.alt,
    this.placeholder,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) =>
          Image.asset(placeholder ?? 'assets/images/placeholder.png', fit: fit),
    );
  }
}
  