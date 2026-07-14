import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_custom.dart' as date_symbol_data_custom;
import 'package:intl/date_symbols.dart' as intl;
import 'package:intl/intl.dart' as intl;

import 'flutter_kurdish_localization.dart';

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
class KurmanjiMaterialLocalizations extends GlobalMaterialLocalizations {
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
  String get aboutListTileTitleRaw => 'دەربارەی \$applicationName';

  @override
  String get alertDialogLabel => 'ئاگادارکرن';

  @override
  String get anteMeridiemAbbreviation => 'ب.ن';

  @override
  String get backButtonTooltip => 'ڤەگەڕان';

  @override
  String get calendarModeButtonLabel => 'گۆڕین بۆ ڕۆژژمێرێ';

  @override
  String get cancelButtonLabel => 'هەڵوەشاندن';

  @override
  String get closeButtonLabel => 'داخستن';

  @override
  String get closeButtonTooltip => 'داخستن';

  @override
  String get collapsedIconTapHint => 'فراوانکرن';

  @override
  String get continueButtonLabel => 'بەردەوامبوون';

  @override
  String get copyButtonLabel => 'کۆپی';

  @override
  String get cutButtonLabel => 'بڕین';

  @override
  String get dateHelpText => 'mm/dd/yyyy';

  @override
  String get dateInputLabel => 'بەروار بنڤیسە';

  @override
  String get dateOutOfRangeLabel => 'ل دەرڤەی مەودایێ یە';

  @override
  String get datePickerHelpText => 'بەروار دیاری بکە';

  @override
  String get dateRangeEndDateSemanticLabelRaw => 'بەرواری کۆتایی \$fullDate';

  @override
  String get dateRangeEndLabel => 'بەرواری کۆتایی';

  @override
  String get dateRangePickerHelpText => 'مەودایێ دیاری بکە';

  @override
  String get dateRangeStartDateSemanticLabelRaw =>
      'بەرواری دەستپێک \$fullDate';

  @override
  String get dateRangeStartLabel => 'بەرواری دەستپێک';

  @override
  String get dateSeparator => '/';

  @override
  String get deleteButtonTooltip => 'ژێبرن';

  @override
  String get dialModeButtonLabel => 'گۆڕین بۆ دۆخێ هەلبژارتنێ';

  @override
  String get dialogLabel => 'دیالۆگ';

  @override
  String get drawerLabel => 'لیستا ڕینیشاندەری';

  @override
  String get expandedIconTapHint => 'بچووککرن';

  @override
  String get hideAccountsLabel => 'شاردنا هژماران';

  @override
  String get inputDateModeButtonLabel => 'گۆڕین بۆ نڤیسینێ';

  @override
  String get inputTimeModeButtonLabel => 'گۆڕین بۆ دۆخێ نڤیسینا دەقی';

  @override
  String get invalidDateFormatLabel => 'فۆرمات نادروستە.';

  @override
  String get invalidDateRangeLabel => 'مەودایەکا نادروستە.';

  @override
  String get invalidTimeLabel => 'کاتەکا دروست بنڤیسە';

  @override
  String get licensesPackageDetailTextOne => '١ مۆڵەت';

  @override
  String get licensesPackageDetailTextOther => '\$licenseCount مۆڵەت';

  @override
  String get licensesPackageDetailTextZero => 'مۆڵەت نینە';

  @override
  String get licensesPageTitle => 'مۆڵەت';

  @override
  String get modalBarrierDismissLabel => 'دەرکرن';

  @override
  String get moreButtonTooltip => 'زیاتر';

  @override
  String get nextMonthTooltip => 'مانگێ داهاتوو';

  @override
  String get nextPageTooltip => 'پەڕا داهاتوو';

  @override
  String get okButtonLabel => 'باشە';

  @override
  String get openAppDrawerTooltip => 'ڤەکرنا لیستا ڕینیشاندەری';

  @override
  String get pageRowsInfoTitleRaw => '\$firstRow–\$lastRow ژ \$rowCount';

  @override
  String get pageRowsInfoTitleApproximateRaw =>
      '\$firstRow–\$lastRow تا \$rowCount';

  @override
  String get pasteButtonLabel => 'پەیست';

  @override
  String get popupMenuLabel => 'لیستا دەرکەوتی';

  @override
  String get postMeridiemAbbreviation => 'پ.ن';

  @override
  String get previousMonthTooltip => 'مانگێ پێشتر';

  @override
  String get previousPageTooltip => 'پەڕا پێشتر';

  @override
  String get refreshIndicatorSemanticLabel => 'نویکرن';

  @override
  String? get remainingTextFieldCharacterCountFew => null;

  @override
  List<String> get narrowWeekdays => ['ی', 'د', 'س', 'چ', 'پ', 'ئ', 'ش'];

  @override
  String? get remainingTextFieldCharacterCountMany => null;

  @override
  String get remainingTextFieldCharacterCountOne => '١ پیت ماوە';

  @override
  String get remainingTextFieldCharacterCountOther => '\$remainingCount پیت ماون';

  @override
  String? get remainingTextFieldCharacterCountTwo => null;

  @override
  String get remainingTextFieldCharacterCountZero => 'هیچ پیتەک نەماوە';

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
  String get rowsPerPageTitle => 'ڕیز بۆ هەر پەڕەیێ:';

  @override
  String get saveButtonLabel => 'پاشکەفتکرن';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.tall;

  @override
  String get searchFieldLabel => 'گەڕان';

  @override
  String get selectAllButtonLabel => 'هەمی هەلبژێرە';

  @override
  String get selectYearSemanticsLabel => 'ساڵ هەلبژێرە';

  @override
  String? get selectedRowCountTitleFew => null;

  @override
  String? get selectedRowCountTitleMany => null;

  @override
  String get selectedRowCountTitleOne => '١ دانە هاتە هەلبژارتن';

  @override
  String get selectedRowCountTitleOther => '\$selectedRowCount هاتنە هەلبژارتن';

  @override
  String? get selectedRowCountTitleTwo => null;

  @override
  String get selectedRowCountTitleZero => 'هیچ نەهاتییە هەلبژارتن';

  @override
  String get showAccountsLabel => 'پیشاندانا هژماران';

  @override
  String get showMenuTooltip => 'پیشاندانا لیستێ';

  @override
  String get signedInLabel => 'چوونەژوورڤە';

  @override
  String get tabLabelRaw => 'خشتەبەندی \$tabIndex ژ \$tabCount';

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.h_colon_mm_space_a;

  @override
  String get timePickerDialHelpText => 'کات هەلبژێرە';

  @override
  String get timePickerHourLabel => 'کاتژمێر';

  @override
  String get timePickerHourModeAnnouncement => 'کاتژمێر هەلبژێرە';

  @override
  String get timePickerInputHelpText => 'کات بنڤیسە';

  @override
  String get timePickerMinuteLabel => 'خولەک';

  @override
  String get timePickerMinuteModeAnnouncement => 'خولەک هەلبژێرە';

  @override
  String get unspecifiedDate => 'بەروار';

  @override
  String get unspecifiedDateRange => 'مەودایا بەروار';

  @override
  String get viewLicensesButtonLabel => 'پیشاندانا مۆڵەتان';

  @override
  String get firstPageTooltip => 'پەڕا سەرەتا';

  @override
  String get lastPageTooltip => 'پەڕا کۆتایی';

  @override
  String get keyboardKeyAlt => 'Alt';

  @override
  String get keyboardKeyAltGraph => 'AltGr';

  @override
  String get keyboardKeyBackspace => 'Backspace';

  @override
  String get keyboardKeyCapsLock => 'Caps Lock';

  @override
  String get keyboardKeyChannelDown => 'Channel Down';

  @override
  String get keyboardKeyChannelUp => 'Channel Up';

  @override
  String get keyboardKeyControl => 'Ctrl';

  @override
  String get keyboardKeyDelete => 'Del';

  @override
  String get keyboardKeyEject => 'Eject';

  @override
  String get keyboardKeyEnd => 'End';

  @override
  String get keyboardKeyEscape => 'Esc';

  @override
  String get keyboardKeyFn => 'Fn';

  @override
  String get keyboardKeyHome => 'Home';

  @override
  String get keyboardKeyInsert => 'Insert';

  @override
  String get keyboardKeyMeta => 'Meta';

  @override
  String get keyboardKeyMetaMacOs => 'Command';

  @override
  String get keyboardKeyMetaWindows => 'Win';

  @override
  String get keyboardKeyNumLock => 'Num Lock';

  @override
  String get keyboardKeyNumpad1 => 'Num 1';

  @override
  String get keyboardKeyNumpad2 => 'Num 2';

  @override
  String get keyboardKeyNumpad3 => 'Num 3';

  @override
  String get keyboardKeyNumpad4 => 'Num 4';

  @override
  String get keyboardKeyNumpad5 => 'Num 5';

  @override
  String get keyboardKeyNumpad6 => 'Num 6';

  @override
  String get keyboardKeyNumpad7 => 'Num 7';

  @override
  String get keyboardKeyNumpad8 => 'Num 8';

  @override
  String get keyboardKeyNumpad9 => 'Num 9';

  @override
  String get keyboardKeyNumpad0 => 'Num 0';

  @override
  String get keyboardKeyNumpadAdd => 'Num +';

  @override
  String get keyboardKeyNumpadComma => 'Num ,';

  @override
  String get keyboardKeyNumpadDecimal => 'Num .';

  @override
  String get keyboardKeyNumpadDivide => 'Num /';

  @override
  String get keyboardKeyNumpadEnter => 'Num Enter';

  @override
  String get keyboardKeyNumpadEqual => 'Num =';

  @override
  String get keyboardKeyNumpadMultiply => 'Num *';

  @override
  String get keyboardKeyNumpadParenLeft => 'Num (';

  @override
  String get keyboardKeyNumpadParenRight => 'Num )';

  @override
  String get keyboardKeyNumpadSubtract => 'Num -';

  @override
  String get keyboardKeyPageDown => 'PgDown';

  @override
  String get keyboardKeyPageUp => 'PgUp';

  @override
  String get keyboardKeyPower => 'Power';

  @override
  String get keyboardKeyPowerOff => 'Power Off';

  @override
  String get keyboardKeyPrintScreen => 'Print Screen';

  @override
  String get keyboardKeyScrollLock => 'Scroll Lock';

  @override
  String get keyboardKeySelect => 'Select';

  @override
  String get keyboardKeySpace => 'Space';

  @override
  String get menuBarMenuLabel => 'مێنیوا شریتی';

  @override
  String get bottomSheetLabel => 'پەڕا خوارێ';

  @override
  String get currentDateLabel => 'ئیرۆ';

  @override
  String get keyboardKeyShift => 'Left Shift';

  @override
  String get scrimLabel => 'پەردا تاریککەر';

  @override
  String get scrimOnTapHintRaw => 'پەنجە لێدە بۆ لابرنێ';

  @override
  String get collapsedHint => 'بچووککری';

  @override
  String get expandedHint => 'گەورەکری';

  @override
  String get expansionTileCollapsedHint => 'بچووککری';

  @override
  String get expansionTileCollapsedTapHint => 'پەنجە لێدە بۆ گەورەکرنێ';

  @override
  String get expansionTileExpandedHint => 'گەورەکری';

  @override
  String get expansionTileExpandedTapHint => 'پەنجە لێدە بۆ بچووککرنێ';

  @override
  String get lookUpButtonLabel => 'گەڕان';

  @override
  String get menuDismissLabel => 'لابرنا مێنیوی';

  @override
  String get scanTextButtonLabel => 'سکانکرنا دەقی';

  @override
  String get searchWebButtonLabel => 'گەڕان د وێبێ دا';

  @override
  String get shareButtonLabel => 'پارڤەکرن';

  @override
  String get clearButtonTooltip => 'پاککرن';

  @override
  String get selectedDateLabel => 'بەرواری هەلبژارتی';
}
