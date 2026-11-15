// ignore_for_file: deprecated_member_use
// The legacy delegates exist for widgets on the deprecated libraries, so the
// test reads them through those libraries.

import 'package:flutter/cupertino.dart' as legacy_cupertino;
import 'package:flutter/material.dart' as legacy;
import 'package:flutter_kurdish_localization/flutter_kurdish_localization.dart';
import 'package:flutter_kurdish_localization/legacy.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    as legacy_global;
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  Future<({BuildContext context, MaterialLocalizations modern})> pumpBridged(
    WidgetTester tester,
    Locale locale,
  ) async {
    late BuildContext captured;
    late MaterialLocalizations modern;
    await tester.pumpWidget(
      MaterialApp(
        locale: locale,
        supportedLocales: const [Locale('ckb'), Locale('kmr'), Locale('en')],
        localizationsDelegates: const [
          KurdishMaterialLocalizations.delegate,
          KurdishWidgetLocalizations.delegate,
          KurdishCupertinoLocalizations.delegate,
          KurmanjiMaterialLocalizations.delegate,
          KurmanjiWidgetLocalizations.delegate,
          KurmanjiCupertinoLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        builder: (context, child) {
          modern = MaterialLocalizations.of(context);
          return MaterialUiCompatibilityBridge(
            delegates: const [
              LegacyKurdishMaterialLocalizations.delegate,
              LegacyKurdishCupertinoLocalizations.delegate,
              LegacyKurmanjiMaterialLocalizations.delegate,
              LegacyKurmanjiCupertinoLocalizations.delegate,
              legacy_global.GlobalMaterialLocalizations.delegate,
              legacy_global.GlobalCupertinoLocalizations.delegate,
            ],
            child: child!,
          );
        },
        home: Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    return (context: captured, modern: modern);
  }

  testWidgets(
    'a legacy widget under the bridge reads the same Sorani strings',
    (tester) async {
      final (:context, :modern) = await pumpBridged(
        tester,
        const Locale('ckb'),
      );

      final legacyStrings = legacy.MaterialLocalizations.of(context);
      expect(legacyStrings, isA<LegacyKurdishMaterialLocalizations>());
      expect(legacyStrings.cancelButtonLabel, modern.cancelButtonLabel);
      expect(legacyStrings.okButtonLabel, modern.okButtonLabel);
      expect(
        legacy_cupertino.CupertinoLocalizations.of(context),
        isA<LegacyKurdishCupertinoLocalizations>(),
      );
    },
  );

  testWidgets(
    'a legacy widget under the bridge reads the same Badini strings',
    (tester) async {
      final (:context, :modern) = await pumpBridged(
        tester,
        const Locale('kmr'),
      );

      final legacyStrings = legacy.MaterialLocalizations.of(context);
      expect(legacyStrings, isA<LegacyKurmanjiMaterialLocalizations>());
      expect(legacyStrings.cancelButtonLabel, modern.cancelButtonLabel);
      expect(
        legacy_cupertino.CupertinoLocalizations.of(context),
        isA<LegacyKurmanjiCupertinoLocalizations>(),
      );
    },
  );

  testWidgets('a legacy TextField renders in Sorani under the bridge', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ckb'),
        supportedLocales: const [Locale('ckb'), Locale('en')],
        localizationsDelegates: const [
          KurdishMaterialLocalizations.delegate,
          KurdishWidgetLocalizations.delegate,
          KurdishCupertinoLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        builder: (context, child) => MaterialUiCompatibilityBridge(
          delegates: const [
            LegacyKurdishMaterialLocalizations.delegate,
            LegacyKurdishCupertinoLocalizations.delegate,
            legacy_global.GlobalMaterialLocalizations.delegate,
          ],
          child: child!,
        ),
        home: const legacy.Material(child: legacy.TextField()),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(legacy.TextField), findsOneWidget);
  });
}
