<p align="center"><img width=12.5% src="https://github.com/aminsamad/flutter_kurdish_localization/raw/main/pic/ckb.png"></p>
<p align="center"><img width=60% src="https://github.com/aminsamad/flutter_kurdish_localization/raw/main/pic/Designer.png"></p>

<hr>

<img src="https://github.com/aminsamad/flutter_kurdish_localization/raw/main/pic/screenshoot_1.png">

<hr>

<img src="https://github.com/aminsamad/flutter_kurdish_localization/raw/main/pic/screenshoot_2.png">

<hr>

# Demo App
<a href="https://github.com/aminsamad/flutter_kurdish_localization/blob/main/app-release(1).apk?raw=true" target="_blank"><img src="https://github.com/aminsamad/flutter_kurdish_localization/raw/main/pic/download_button.png" style="width: 200px; height: 50px;" /></a>

# Flutter Kurdish Localization 🌍

This package provides unofficial localization support for *Central Kurdish Branch Sorani **(Kurdish: سۆرانی ,Soranî‎)***.

----
### Getting Started

Version 2 works with `package:material_ui` and `package:cupertino_ui`, the
standalone Material and Cupertino libraries, and needs Flutter 3.47 or newer.
An app still on `package:flutter/material.dart` stays on 1.x.

`import 'package:flutter_kurdish_localization/flutter_kurdish_localization.dart';`

Add the delegates for each language to *localizationsDelegates*:

**KurdishMaterialLocalizations.delegate**, **KurdishCupertinoLocalizations.delegate** For text and dates localization (`ckb`)
**KurdishWidgetLocalizations.delegate**  For text and UI directionality (`ckb`)
**KurmanjiMaterialLocalizations.delegate**, **KurmanjiCupertinoLocalizations.delegate**, **KurmanjiWidgetLocalizations.delegate** The same for Badini (`kmr`)

```dart
import 'package:material_ui/material_ui.dart';

return MaterialApp(
  localizationsDelegates: const [
    KurdishMaterialLocalizations.delegate,
    KurdishCupertinoLocalizations.delegate,
    KurdishWidgetLocalizations.delegate,
    ...GlobalMaterialLocalizations.delegates,
  ],
  supportedLocales: const [Locale('ckb')],
  locale: const Locale('ckb'),
);
```

-----
### Translations are available now!



## Links


* [Source code](https://github.com/aminsamad/flutter_kurdish_localization/)
* [Instagram](https://instagram.com/amin._.samad/)
* [Facebook](https://www.facebook.com/amin.samad.14418/)
