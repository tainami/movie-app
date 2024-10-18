import 'package:flutter/material.dart';

extension ThemeDataExtension on BuildContext {
  /// Contains the ThemeData instance.
  ThemeData get theme {
    return Theme.of(this);
  }

  TextStyle get bodyLarge {
    return theme.textTheme.bodyLarge!;
  }

  TextStyle get bodyMedium {
    return theme.textTheme.bodyMedium!;
  }

  TextStyle get bodySmall {
    return theme.textTheme.bodySmall!;
  }

  TextStyle get labelLarge {
    return theme.textTheme.labelLarge!;
  }

  TextStyle get labelSmall {
    return theme.textTheme.labelSmall!;
  }

  TextStyle get labelMedium {
    return theme.textTheme.labelMedium!;
  }

  TextStyle get displayLarge {
    return theme.textTheme.displayLarge!;
  }

  TextStyle get displayMedium {
    return theme.textTheme.displayMedium!;
  }

  TextStyle get displaySmall {
    return theme.textTheme.displaySmall!;
  }

  TextStyle get headlineMedium {
    return theme.textTheme.headlineMedium!;
  }

  TextStyle get headlineSmall {
    return theme.textTheme.headlineSmall!;
  }

  TextStyle get headlineLarge {
    return theme.textTheme.headlineLarge!;
  }

  TextStyle get titleLarge {
    return theme.textTheme.titleLarge!;
  }

  TextStyle get titleMedium {
    return theme.textTheme.titleMedium!;
  }

  TextStyle get titleSmall {
    return theme.textTheme.titleSmall!;
  }
}
