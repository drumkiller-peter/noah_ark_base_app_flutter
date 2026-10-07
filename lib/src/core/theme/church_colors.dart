import 'package:flutter/material.dart';

/// One mode's complete set of church colors, each named for the job it does.
///
/// Mirrors the twelve keys of the backend's Theme. Text and icons drawn on a
/// filled color are never a church's choice: [onColor] picks black or white,
/// whichever contrasts better, so no Theme can produce an unreadable button.
///
/// Read it in a widget with `context.churchColors`.
@immutable
class ChurchColors extends ThemeExtension<ChurchColors> {
  const ChurchColors({
    required this.primary,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.background,
    required this.surface,
    required this.raised,
    required this.text,
    required this.textMuted,
    required this.border,
  });

  /// Parses one mode of the backend's `GET /theme` response, e.g. `json['light']`.
  ///
  /// The backend always sends every key, already resolved against its Default
  /// Theme, so a missing or malformed key is an error rather than a fallback.
  factory ChurchColors.fromJson(Map<String, dynamic> json) {
    Color read(String key) => _parseHex(json[key] as String);
    return ChurchColors(
      primary: read('primary'),
      secondary: read('secondary'),
      success: read('success'),
      warning: read('warning'),
      error: read('error'),
      info: read('info'),
      background: read('background'),
      surface: read('surface'),
      raised: read('raised'),
      text: read('text'),
      textMuted: read('text_muted'),
      border: read('border'),
    );
  }

  final Color primary;
  final Color secondary;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;
  final Color background;
  final Color surface;
  final Color raised;
  final Color text;
  final Color textMuted;
  final Color border;

  Color get onPrimary => onColor(primary);
  Color get onSecondary => onColor(secondary);
  Color get onSuccess => onColor(success);
  Color get onWarning => onColor(warning);
  Color get onError => onColor(error);
  Color get onInfo => onColor(info);

  /// Black or white, whichever reads better on [fill] by WCAG contrast ratio.
  static Color onColor(Color fill) {
    final luminance = fill.computeLuminance();
    final contrastWithBlack = (luminance + 0.05) / 0.05;
    final contrastWithWhite = 1.05 / (luminance + 0.05);
    return contrastWithBlack >= contrastWithWhite ? Colors.black : Colors.white;
  }

  /// The Default Theme's light colors, identical to the backend's
  /// `DEFAULT_LIGHT` in `app/models/theme.py`; change both together.
  static const defaultLight = ChurchColors(
    primary: Color(0xFF1D7A55),
    secondary: Color(0xFF315F9F),
    success: Color(0xFF1D7A55),
    warning: Color(0xFFC98B22),
    error: Color(0xFFB84737),
    info: Color(0xFF3A8C97),
    background: Color(0xFFF5F3EE),
    surface: Color(0xFFFFFFFF),
    raised: Color(0xFFFBFBF8),
    text: Color(0xFF15231F),
    textMuted: Color(0xFF62706B),
    border: Color(0xFFD8DDD8),
  );

  /// The Default Theme's dark colors, identical to the backend's `DEFAULT_DARK`.
  static const defaultDark = ChurchColors(
    primary: Color(0xFF1D7A55),
    secondary: Color(0xFF3A8C97),
    success: Color(0xFF1D7A55),
    warning: Color(0xFFC98B22),
    error: Color(0xFFB84737),
    info: Color(0xFF3A8C97),
    background: Color(0xFF171D1B),
    surface: Color(0xFF202825),
    raised: Color(0xFF26302C),
    text: Color(0xFFEEF7F3),
    textMuted: Color(0xFFA8B8B2),
    border: Color(0xFF3D4943),
  );

  @override
  ChurchColors copyWith({
    Color? primary,
    Color? secondary,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? background,
    Color? surface,
    Color? raised,
    Color? text,
    Color? textMuted,
    Color? border,
  }) {
    return ChurchColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      raised: raised ?? this.raised,
      text: text ?? this.text,
      textMuted: textMuted ?? this.textMuted,
      border: border ?? this.border,
    );
  }

  @override
  ChurchColors lerp(ChurchColors? other, double t) {
    if (other == null) return this;
    return ChurchColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      info: Color.lerp(info, other.info, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      raised: Color.lerp(raised, other.raised, t)!,
      text: Color.lerp(text, other.text, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }

  static Color _parseHex(String hex) {
    final digits = hex.startsWith('#') ? hex.substring(1) : hex;
    if (digits.length != 6) {
      throw FormatException('Expected a #RRGGBB color', hex);
    }
    return Color(0xFF000000 | int.parse(digits, radix: 16));
  }
}

/// A church's Theme: its light and dark [ChurchColors].
@immutable
class ChurchTheme {
  const ChurchTheme({required this.light, required this.dark});

  /// Parses the backend's whole `GET /theme` response.
  factory ChurchTheme.fromJson(Map<String, dynamic> json) {
    return ChurchTheme(
      light: ChurchColors.fromJson(json['light'] as Map<String, dynamic>),
      dark: ChurchColors.fromJson(json['dark'] as Map<String, dynamic>),
    );
  }

  /// The platform's Default Theme, baked in for a first launch with no signal.
  static const defaults = ChurchTheme(
    light: ChurchColors.defaultLight,
    dark: ChurchColors.defaultDark,
  );

  final ChurchColors light;
  final ChurchColors dark;
}

extension ChurchColorsContext on BuildContext {
  /// The church's colors for whichever mode, light or dark, is showing.
  ChurchColors get churchColors => Theme.of(this).extension<ChurchColors>()!;
}

extension DeviceContext on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 600;
  bool get isTablet =>
      MediaQuery.of(this).size.width >= 600 &&
      MediaQuery.of(this).size.width < 900;
  bool get isDesktop => MediaQuery.of(this).size.width >= 900;
}
