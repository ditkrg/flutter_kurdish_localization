## 0.0.1

* TODO: Describe initial release.

## 0.0.2
* Support null safety

## 0.0.3
* Correct grammatical errors

## 0.0.4
* Add new words

## 0.0.5
* Added Demo app and new example

## 0.0.7
* Updated to latest version 
* fixing some problems.

## 0.0.8
* change ckb to ckb

## 0.0.9
* Adding new words

## 1.1.0
* Add Badini / Behdini Kurmanji ('kmr') localization: `KurmanjiMaterialLocalizations`,
  `KurmanjiCupertinoLocalizations`, `KurmanjiWidgetLocalizations`, mirroring the
  Central Kurdish ('ckb') delegates with their own Arabic-script, RTL Badini strings
  and Badini month/weekday date symbols (Western digits, 24-hour clock).

## 2.0.0
* Breaking: the delegates are built on `package:material_ui` and
  `package:cupertino_ui` instead of `package:flutter/material.dart`,
  `package:flutter/cupertino.dart` and `flutter_localizations`. Apps on the
  standalone libraries use this version; apps on the framework's Material
  library stay on 1.x.
* Requires Flutter 3.47 and Dart 3.13.
* The widget delegates import only `package:flutter/widgets.dart`.

## 2.1.0
* `package:flutter_kurdish_localization/legacy.dart` adds
  `LegacyKurdishMaterialLocalizations`, `LegacyKurdishCupertinoLocalizations`,
  `LegacyKurmanjiMaterialLocalizations` and
  `LegacyKurmanjiCupertinoLocalizations`, built on
  `package:flutter/material.dart` and `package:flutter/cupertino.dart`. Pass
  them to `MaterialUiCompatibilityBridge.delegates` so widgets from packages
  still on those libraries read Sorani and Badini too.
* Both kinds of delegate read the same strings.
