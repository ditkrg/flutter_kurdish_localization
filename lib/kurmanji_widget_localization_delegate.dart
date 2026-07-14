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

  // Directs the drag action AT the item (transitive), matching the ckb
  // sibling file's own "ڕایبکێشەرە" (pull/drag) semantics -- not the
  // intransitive "go" phrasing used for the identical getters in
  // kurmanji_material_localization_delegate.dart, which reads as an
  // instruction to the user to move themselves, not the list item.
  @override
  String get reorderItemDown => 'بکێشە خوارێ';

  @override
  String get reorderItemLeft => 'بکێشە لای چەپ';

  @override
  String get reorderItemRight => 'بکێشە لای ڕاست';

  @override
  String get reorderItemToEnd => 'بکێشە بۆ کۆتایی';

  @override
  String get reorderItemToStart => 'بکێشە بۆ سەرەتا';

  @override
  String get reorderItemUp => 'بکێشە سەرێ';

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
