import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_kurdish_localization/flutter_kurdish_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  Future<BuildContext> pumpApp(WidgetTester tester, Locale locale) async {
    late BuildContext captured;
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
        home: Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    return captured;
  }

  testWidgets('a material_ui app in Sorani reads the Sorani strings', (
    tester,
  ) async {
    final context = await pumpApp(tester, const Locale('ckb'));

    expect(
      MaterialLocalizations.of(context),
      isA<KurdishMaterialLocalizations>(),
    );
    expect(
      CupertinoLocalizations.of(context),
      isA<KurdishCupertinoLocalizations>(),
    );
    expect(Directionality.of(context), TextDirection.rtl);
  });

  testWidgets('a material_ui app in Badini reads the Badini strings', (
    tester,
  ) async {
    final context = await pumpApp(tester, const Locale('kmr'));

    expect(
      MaterialLocalizations.of(context),
      isA<KurmanjiMaterialLocalizations>(),
    );
    expect(MaterialLocalizations.of(context).cancelButtonLabel, 'هەڵوەشاندن');
    expect(Directionality.of(context), TextDirection.rtl);
  });
}
