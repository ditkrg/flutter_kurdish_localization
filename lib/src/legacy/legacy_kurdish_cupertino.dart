// ignore_for_file: deprecated_member_use
// Built on package:flutter/cupertino.dart and flutter_localizations, deprecated
// since Flutter 3.50, for widgets that have not moved to cupertino_ui.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_custom.dart' as date_symbol_data_custom;
import 'package:intl/date_symbols.dart' as intl;
import 'package:intl/intl.dart' as intl;

import '../../kurdish_cupertino_localization_delegate.dart'
    show kuDateSymbols, kuLocaleDatePatterns;
import '../kurdish_cupertino_strings.dart';

class _LegacyKurdishCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _LegacyKurdishCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ckb';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    const String localeName = 'ckb';

    date_symbol_data_custom.initializeDateFormattingCustom(
      locale: localeName,
      patterns: kuLocaleDatePatterns,
      symbols: intl.DateSymbols.deserializeFromMap(kuDateSymbols),
    );
    return SynchronousFuture<CupertinoLocalizations>(
      LegacyKurdishCupertinoLocalizations(
        fullYearFormat: intl.DateFormat('y', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        decimalFormat: intl.NumberFormat('#,##0.###', 'ar'),
        twoDigitZeroPaddedFormat: intl.NumberFormat('00', 'ar'),
        dayFormat: intl.DateFormat('d', localeName),
        doubleDigitMinuteFormat: intl.DateFormat('mm', localeName),
        singleDigitHourFormat: intl.DateFormat('h', localeName),
        singleDigitMinuteFormat: intl.DateFormat('m', localeName),
        singleDigitSecondFormat: intl.DateFormat('s', localeName),
        localeName: localeName,
        weekdayFormat: intl.DateFormat('EEEE', localeName),
      ),
    );
  }

  @override
  bool shouldReload(_LegacyKurdishCupertinoLocalizationsDelegate old) => false;
}

class LegacyKurdishCupertinoLocalizations extends GlobalCupertinoLocalizations
    with KurdishCupertinoStrings {
  const LegacyKurdishCupertinoLocalizations({
    super.localeName = 'ckb',
    required super.fullYearFormat,
    required super.mediumDateFormat,
    required super.decimalFormat,
    required super.dayFormat,
    required super.doubleDigitMinuteFormat,
    required super.singleDigitHourFormat,
    required super.singleDigitMinuteFormat,
    required super.singleDigitSecondFormat,
    required intl.NumberFormat twoDigitZeroPaddedFormat,
    required super.weekdayFormat,
  });
  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _LegacyKurdishCupertinoLocalizationsDelegate();
}
