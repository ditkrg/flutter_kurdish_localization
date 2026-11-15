import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:intl/date_symbol_data_custom.dart' as date_symbol_data_custom;
import 'package:intl/date_symbols.dart' as intl;
import 'package:intl/intl.dart' as intl;

import 'flutter_kurdish_localization.dart';
import 'src/kurmanji_material_strings.dart';

class _KurmanjiMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _KurmanjiMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'kmr';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    const String localeName = 'kmr';

    date_symbol_data_custom.initializeDateFormattingCustom(
      locale: localeName,
      patterns: kmLocaleDatePatterns,
      symbols: intl.DateSymbols.deserializeFromMap(kmDateSymbols),
    );
    return SynchronousFuture<MaterialLocalizations>(
      KurmanjiMaterialLocalizations(
        fullYearFormat: intl.DateFormat('y', localeName),
        shortDateFormat: intl.DateFormat('MM/DD/YY', localeName),
        compactDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        shortMonthDayFormat: intl.DateFormat('MM/DD', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        longDateFormat: intl.DateFormat('EEEE, MMMM d, y', localeName),
        yearMonthFormat: intl.DateFormat('MMMM y', localeName),
        // Same rationale as KurdishMaterialLocalizations: `intl`'s NumberFormat
        // is generated from CLDR data with no 'kmr' entry, so we reuse the 'ar'
        // digit/decimal symbols (Western digits, matching kmDateSymbols below).
        decimalFormat: intl.NumberFormat('#,##0.###', 'ar'),
        twoDigitZeroPaddedFormat: intl.NumberFormat('00', 'ar'),
      ),
    );
  }

  @override
  bool shouldReload(_KurmanjiMaterialLocalizationsDelegate old) => false;
}

/// Material strings for Badini / Behdini Kurmanji ('kmr'), written in Arabic
/// script and anchored to Central Kurdish (ckb) word choices where the two
/// dialects share a concept, with Badini grammar (verbal nouns in `-کرن`,
/// izafe endings, `پێدڤی`/`دڤێت`, etc.) rather than a literal translation of
/// the English source.
class KurmanjiMaterialLocalizations extends GlobalMaterialLocalizations
    with KurmanjiMaterialStrings {
  const KurmanjiMaterialLocalizations({
    super.localeName = 'kmr',
    required super.fullYearFormat,
    required super.shortDateFormat,
    required super.compactDateFormat,
    required super.shortMonthDayFormat,
    required super.mediumDateFormat,
    required super.longDateFormat,
    required super.yearMonthFormat,
    required super.decimalFormat,
    required super.twoDigitZeroPaddedFormat,
  });
  static const LocalizationsDelegate<MaterialLocalizations> delegate =
      _KurmanjiMaterialLocalizationsDelegate();

  @override
  ScriptCategory get scriptCategory => ScriptCategory.tall;

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.h_colon_mm_space_a;
}
