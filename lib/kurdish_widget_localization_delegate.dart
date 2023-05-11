import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _KurdishMaterialLocalizationsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const _KurdishMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ckb';

  @override
  Future<WidgetsLocalizations> load(Locale locale) async {
    return SynchronousFuture<WidgetsLocalizations>(
      KurdishWidgetLocalizations(),
    );
  }

  @override
  bool shouldReload(_KurdishMaterialLocalizationsDelegate old) => false;
}

class KurdishWidgetLocalizations extends WidgetsLocalizations {
  static const LocalizationsDelegate<WidgetsLocalizations> delegate =
      _KurdishMaterialLocalizationsDelegate();

  @override
  TextDirection get textDirection => TextDirection.rtl;

  @override
  String get reorderItemDown => 'ڕایبکێشەرە خوارەوە';

  @override
  String get reorderItemLeft => 'ڕایبکێشەرە لای چەپ';

  @override
  String get reorderItemRight => 'ڕایبکێشەرە لای ڕاست';

  @override
  String get reorderItemToEnd => 'بردنە کۆتا';

  @override
  String get reorderItemToStart => 'بردنە سەرەتا';

  @override
  String get reorderItemUp => 'ڕایبکێشەرە سەرەوە';
}
