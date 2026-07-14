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
      // Badini هەڵوەشاندن, not the ckb form هەڵوەشاندنەوه.
      expect(loc.cancelButtonLabel, 'هەڵوەشاندن');
      expect(loc.okButtonLabel, 'باشە');
      expect(loc.saveButtonLabel, 'پاشکەفتکرن');
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
  });
}
