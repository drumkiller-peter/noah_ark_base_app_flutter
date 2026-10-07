import 'package:flutter/material.dart';

/// Semantic text roles backed by the app's church-aware theme.
enum AppTextVariant {
  display,
  headline,
  title,
  subtitle,
  label,
  body,
  supporting,
  caption,
}

class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    super.key,
    this.variant = AppTextVariant.body,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.color,
  });

  final String data;
  final AppTextVariant variant;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final baseStyle = switch (variant) {
      AppTextVariant.display => textTheme.headlineLarge,
      AppTextVariant.headline => textTheme.headlineMedium,
      AppTextVariant.title => textTheme.titleLarge,
      AppTextVariant.subtitle => textTheme.titleMedium,
      AppTextVariant.label => textTheme.titleSmall,
      AppTextVariant.body => textTheme.bodyLarge,
      AppTextVariant.supporting => textTheme.bodyMedium,
      AppTextVariant.caption => textTheme.bodySmall,
    };

    return Text(
      data,
      style: style == null
          ? baseStyle
          : baseStyle?.merge(style).copyWith(color: color ?? baseStyle.color) ??
                style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}
