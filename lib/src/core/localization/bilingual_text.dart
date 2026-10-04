import 'package:flutter/widgets.dart';

/// Helper for bilingual strings matching backend parallel fields (e.g. title_en / title_ne).
class BilingualText {
  final String en;
  final String ne;

  const BilingualText({
    required this.en,
    required this.ne,
  });

  /// Resolves the text string according to the active locale, falling back to English if Nepali is empty.
  String resolve(Locale locale) {
    if (locale.languageCode == 'ne' && ne.trim().isNotEmpty) {
      return ne;
    }
    return en;
  }

  /// Convenience helper resolving from BuildContext.
  String of(BuildContext context) {
    return resolve(Localizations.localeOf(context));
  }
}
