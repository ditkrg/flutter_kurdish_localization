import 'dart:async';

import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/date_symbol_data_custom.dart' as date_symbol_data_custom;
import 'package:intl/date_symbols.dart' as intl;
import 'package:intl/intl.dart' as intl;

import 'src/kurmanji_cupertino_strings.dart';

class _KurmanjiCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _KurmanjiCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'kmr';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    const String localeName = 'kmr';

    date_symbol_data_custom.initializeDateFormattingCustom(
      locale: localeName,
      patterns: kmLocaleDatePatterns,
      symbols: intl.DateSymbols.deserializeFromMap(kmDateSymbols),
    );
    return SynchronousFuture<CupertinoLocalizations>(
      KurmanjiCupertinoLocalizations(
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
  bool shouldReload(_KurmanjiCupertinoLocalizationsDelegate old) => false;
}

/// Cupertino strings for Badini / Behdini Kurmanji ('kmr'). See
/// [KurmanjiMaterialLocalizations] for the word-choice/grammar rationale.
class KurmanjiCupertinoLocalizations extends GlobalCupertinoLocalizations
    with KurmanjiCupertinoStrings {
  const KurmanjiCupertinoLocalizations({
    super.localeName = 'kmr',
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
      _KurmanjiCupertinoLocalizationsDelegate();
}

/// Badini ('kmr') date symbols — Western digits (ZERODIGIT '0') and a
/// 24-hour clock, matching the policy already established for this app's
/// general-purpose `intl` registration (see kmr_intl_data.dart in the
/// consuming app): Kurdish text renders with Western digits by default,
/// with Arabic-Indic digits applied only as an explicit, context-dependent
/// post-processing step where the product calls for it. Month/weekday names
/// are Behdini spellings of the standard Iraqi-Kurdish calendar.
const kmDateSymbols = {
  'NAME': 'kmr',
  'ERAS': ['پ.ز', 'ز'],
  'ERANAMES': ['پێش زایینی', 'زایینی'],
  'NARROWMONTHS': [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ],
  'STANDALONENARROWMONTHS': [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ],
  'MONTHS': [
    'کانوونا دووێ',
    'شوبات',
    'ئازار',
    'نیسان',
    'ئایار',
    'حوزەیران',
    'تەمووز',
    'ئاب',
    'ئەیلوول',
    'تشرینا ئێکێ',
    'تشرینا دووێ',
    'کانوونا ئێکێ',
  ],
  'STANDALONEMONTHS': [
    'کانوونا دووێ',
    'شوبات',
    'ئازار',
    'نیسان',
    'ئایار',
    'حوزەیران',
    'تەمووز',
    'ئاب',
    'ئەیلوول',
    'تشرینا ئێکێ',
    'تشرینا دووێ',
    'کانوونا ئێکێ',
  ],
  'SHORTMONTHS': [
    'کانوونا دووێ',
    'شوبات',
    'ئازار',
    'نیسان',
    'ئایار',
    'حوزەیران',
    'تەمووز',
    'ئاب',
    'ئەیلوول',
    'تشرینا ئێکێ',
    'تشرینا دووێ',
    'کانوونا ئێکێ',
  ],
  'STANDALONESHORTMONTHS': [
    'کانوونا دووێ',
    'شوبات',
    'ئازار',
    'نیسان',
    'ئایار',
    'حوزەیران',
    'تەمووز',
    'ئاب',
    'ئەیلوول',
    'تشرینا ئێکێ',
    'تشرینا دووێ',
    'کانوونا ئێکێ',
  ],
  'WEEKDAYS': [
    'یەکشەم',
    'دووشەم',
    'سێشەم',
    'چوارشەم',
    'پێنجشەم',
    'ئینی',
    'شەممی',
  ],
  'STANDALONEWEEKDAYS': [
    'یەکشەم',
    'دووشەم',
    'سێشەم',
    'چوارشەم',
    'پێنجشەم',
    'ئینی',
    'شەممی',
  ],
  'SHORTWEEKDAYS': [
    'یەکشەم',
    'دووشەم',
    'سێشەم',
    'چوارشەم',
    'پێنجشەم',
    'ئینی',
    'شەممی',
  ],
  'STANDALONESHORTWEEKDAYS': [
    'یەکشەم',
    'دووشەم',
    'سێشەم',
    'چوارشەم',
    'پێنجشەم',
    'ئینی',
    'شەممی',
  ],
  'NARROWWEEKDAYS': ['ی', 'د', 'س', 'چ', 'پ', 'ئ', 'ش'],
  'STANDALONENARROWWEEKDAYS': ['ی', 'د', 'س', 'چ', 'پ', 'ئ', 'ش'],
  'SHORTQUARTERS': ['چ.۱', 'چ.۲', 'چ.۳', 'چ.۴'],
  'QUARTERS': ['چارەکا ئێکێ', 'چارەکا دووێ', 'چارەکا سێیێ', 'چارەکا چارێ'],
  'AMPMS': ['پ.ن', 'د.ن'],
  'DATEFORMATS': ['y MMMM d, EEEE', 'y MMMM d', 'y MMM d', 'y-MM-dd'],
  'TIMEFORMATS': ['HH:mm:ss zzzz', 'HH:mm:ss z', 'HH:mm:ss', 'HH:mm'],
  'AVAILABLEFORMATS': null,
  'DATETIMEFORMATS': ['{1} {0}', '{1} {0}', '{1} {0}', '{1} {0}'],
  'ZERODIGIT': '0',
  'FIRSTDAYOFWEEK': 5,
  'WEEKENDRANGE': [4, 5],
  'FIRSTWEEKCUTOFFDAY': 5,
};

/// Skeleton -> pattern map for 'kmr'. Field codes (d, M, y, EEEE, ...) are
/// locale-agnostic; the localized text comes from [kmDateSymbols]. 24-hour
/// clock (no AM/PM skeletons), matching [kmDateSymbols]'s TIMEFORMATS.
const kmLocaleDatePatterns = {
  'd': 'd', // DAY
  'E': 'ccc', // ABBR_WEEKDAY
  'EEEE': 'cccc', // WEEKDAY
  'LLL': 'LLL', // ABBR_STANDALONE_MONTH
  'LLLL': 'LLLL', // STANDALONE_MONTH
  'M': 'L', // NUM_MONTH
  'Md': 'M/d', // NUM_MONTH_DAY
  'MEd': 'EEE, M/d', // NUM_MONTH_WEEKDAY_DAY
  'MMM': 'LLL', // ABBR_MONTH
  'MMMd': 'MMM d', // ABBR_MONTH_DAY
  'MMMEd': 'EEE, MMM d', // ABBR_MONTH_WEEKDAY_DAY
  'MMMM': 'LLLL', // MONTH
  'MMMMd': 'MMMM d', // MONTH_DAY
  'MMMMEEEEd': 'EEEE, MMMM d', // MONTH_WEEKDAY_DAY
  'QQQ': 'QQQ', // ABBR_QUARTER
  'QQQQ': 'QQQQ', // QUARTER
  'y': 'y', // YEAR
  'yM': 'M/y', // YEAR_NUM_MONTH
  'yMd': 'M/d/y', // YEAR_NUM_MONTH_DAY
  'yMEd': 'EEE, M/d/y', // YEAR_NUM_MONTH_WEEKDAY_DAY
  'yMMM': 'MMM y', // YEAR_ABBR_MONTH
  'yMMMd': 'MMM d, y', // YEAR_ABBR_MONTH_DAY
  'yMMMEd': 'EEE, MMM d, y', // YEAR_ABBR_MONTH_WEEKDAY_DAY
  'yMMMM': 'MMMM y', // YEAR_MONTH
  'yMMMMd': 'MMMM d, y', // YEAR_MONTH_DAY
  'yMMMMEEEEd': 'EEEE, MMMM d, y', // YEAR_MONTH_WEEKDAY_DAY
  'yQQQ': 'QQQ y', // YEAR_ABBR_QUARTER
  'yQQQQ': 'QQQQ y', // YEAR_QUARTER
  'H': 'HH', // HOUR24
  'Hm': 'HH:mm', // HOUR24_MINUTE
  'Hms': 'HH:mm:ss', // HOUR24_MINUTE_SECOND
  'j': 'HH', // HOUR (24-hour, no dayPeriod — see kmDateSymbols TIMEFORMATS)
  'jm': 'HH:mm', // HOUR_MINUTE
  'jms': 'HH:mm:ss', // HOUR_MINUTE_SECOND
  'jmv': 'HH:mm v', // HOUR_MINUTE_GENERIC_TZ
  'jmz': 'HH:mm z', // HOUR_MINUTETZ
  'jz': 'HH z', // HOURGENERIC_TZ
  'm': 'm', // MINUTE
  'ms': 'mm:ss', // MINUTE_SECOND
  's': 's', // SECOND
  'v': 'v', // ABBR_GENERIC_TZ
  'z': 'z', // ABBR_SPECIFIC_TZ
  'zzzz': 'zzzz', // SPECIFIC_TZ
  'ZZZZ': 'ZZZZ', // ABBR_UTC_TZ
};
