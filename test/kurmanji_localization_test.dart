import 'package:flutter/material.dart';
import 'package:flutter_kurdish_localization/flutter_kurdish_localization.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const kmr = Locale('kmr');
  const ckb = Locale('ckb');
  const en = Locale('en');

  group('KurmanjiMaterialLocalizations', () {
    test('delegate supports kmr only (not ckb/en)', () {
      final d = KurmanjiMaterialLocalizations.delegate;
      expect(d.isSupported(kmr), isTrue);
      expect(d.isSupported(ckb), isFalse);
      expect(d.isSupported(en), isFalse);
    });

    test('serves Badini strings, not Sorani', () async {
      final loc = await KurmanjiMaterialLocalizations.delegate.load(kmr);
      // Badini هەڵوەشاندن, not the ckb form هەڵوەشاندنەوە.
      expect(loc.cancelButtonLabel, 'هەڵوەشاندن');
      expect(loc.okButtonLabel, 'باشە');
      expect(loc.saveButtonLabel, 'پاشکەفتکرن');
    });

    test('a11y labels are Kurdish, not leftover English', () async {
      final loc = await KurmanjiMaterialLocalizations.delegate.load(kmr);
      expect(loc.bottomSheetLabel, isNot(contains(RegExp(r'[A-Za-z]'))));
      expect(loc.scrimLabel, isNot(contains(RegExp(r'[A-Za-z]'))));
      expect(loc.menuBarMenuLabel, isNot(contains(RegExp(r'[A-Za-z]'))));
    });

    test('date formatting uses Badini month names', () async {
      final loc = await KurmanjiMaterialLocalizations.delegate.load(kmr);
      // July -> Badini تەمووز, from the locale's own registered date symbols.
      expect(loc.formatMonthYear(DateTime(2026, 7)), contains('تەمووز'));
    });
  });

  group('KurmanjiCupertinoLocalizations', () {
    test('delegate supports kmr only', () {
      final d = KurmanjiCupertinoLocalizations.delegate;
      expect(d.isSupported(kmr), isTrue);
      expect(d.isSupported(ckb), isFalse);
    });

    test('serves Badini strings', () async {
      final loc = await KurmanjiCupertinoLocalizations.delegate.load(kmr);
      expect(loc.alertDialogLabel, 'ئاگەهداری');
      expect(loc.selectAllButtonLabel, 'هەمی هەلبژێرە');
    });
  });

  group('KurmanjiWidgetLocalizations', () {
    test('delegate supports kmr only and is RTL', () async {
      final d = KurmanjiWidgetLocalizations.delegate;
      expect(d.isSupported(kmr), isTrue);
      expect(d.isSupported(ckb), isFalse);
      final loc = await d.load(kmr);
      expect(loc.textDirection, TextDirection.rtl);
      expect(loc.copyButtonLabel, 'کۆپی');
    });

    test('reorderItem* directs the action at the item (transitive), not '
        'the user moving themselves', () async {
      // Regression: these once used the intransitive "بچۆ" (go), copied
      // from the Material file's own choice, which reads as "you go down"
      // rather than "drag this item down". بکێشە (pull/drag) is transitive.
      final loc = await KurmanjiWidgetLocalizations.delegate.load(kmr);
      expect(loc.reorderItemDown, startsWith('بکێشە'));
      expect(loc.reorderItemUp, startsWith('بکێشە'));
      expect(loc.reorderItemLeft, startsWith('بکێشە'));
      expect(loc.reorderItemRight, startsWith('بکێشە'));
    });
  });

  group('Kurdish (ckb) Cupertino regression coverage', () {
    // The upstream package once shipped several Cupertino strings still in
    // Zulu (leftover from whatever locale template it was originally cloned
    // from) -- e.g. 'ihora', 'Sesha', 'ezimpondweni'. Pin the fixed values so
    // this can't silently regress.
    test('date/timer picker strings are Kurdish, not Zulu', () async {
      final loc =
          await KurdishCupertinoLocalizations.delegate.load(ckb)
              as KurdishCupertinoLocalizations;
      expect(loc.searchTextFieldPlaceholderLabel, 'گەڕان');
      expect(loc.timerPickerHourLabelOther, isNot('amahora'));
      expect(loc.timerPickerMinuteLabelOther, isNot('iminithi.'));
      expect(loc.timerPickerSecondLabelOther, isNot('isekhondi.'));
      for (final s in [
        loc.searchTextFieldPlaceholderLabel,
        loc.timerPickerHourLabelOther,
        loc.timerPickerMinuteLabelOther,
        loc.timerPickerSecondLabelOther,
      ]) {
        expect(s, isNot(contains(RegExp(r'[A-Za-z]'))));
      }
    });
  });
}
