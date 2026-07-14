import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _KurmanjiWidgetLocalizationsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const _KurmanjiWidgetLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'kmr';

  @override
  Future<WidgetsLocalizations> load(Locale locale) async {
    return SynchronousFuture<WidgetsLocalizations>(
      KurmanjiWidgetLocalizations(),
    );
  }

  @override
  bool shouldReload(_KurmanjiWidgetLocalizationsDelegate old) => false;
}

/// Widgets strings for Badini / Behdini Kurmanji ('kmr').
class KurmanjiWidgetLocalizations extends WidgetsLocalizations {
  static const LocalizationsDelegate<WidgetsLocalizations> delegate =
      _KurmanjiWidgetLocalizationsDelegate();

  @override
  TextDirection get textDirection => TextDirection.rtl;

  @override
  String get reorderItemDown => 'بچۆ خوارێ';

  @override
  String get reorderItemLeft => 'بچۆ لای چەپ';

  @override
  String get reorderItemRight => 'بچۆ لای ڕاست';

  @override
  String get reorderItemToEnd => 'بچۆ کۆتایی';

  @override
  String get reorderItemToStart => 'بچۆ سەرەتا';

  @override
  String get reorderItemUp => 'بچۆ سەرێ';

  @override
  String get copyButtonLabel => 'کۆپی';

  @override
  String get cutButtonLabel => 'بڕین';

  @override
  String get lookUpButtonLabel => 'گەڕان';

  @override
  String get pasteButtonLabel => 'پەیست';

  @override
  String get searchWebButtonLabel => 'گەڕان د وێبێ دا';

  @override
  String get selectAllButtonLabel => 'هەمی هەلبژێرە';

  @override
  String get shareButtonLabel => 'پارڤەکرن';

  @override
  String get radioButtonUnselectedLabel => 'هەلنەبژارتی';
}
