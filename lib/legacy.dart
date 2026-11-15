/// The Sorani and Badini delegates on package:flutter/material.dart and
/// package:flutter/cupertino.dart, which Flutter 3.50 deprecates. An app on
/// material_ui passes these to `MaterialUiCompatibilityBridge.delegates`, so
/// widgets from packages still on the deprecated libraries read Kurdish too.
library;

export 'src/legacy/legacy_kurdish_cupertino.dart';
export 'src/legacy/legacy_kurdish_material.dart';
export 'src/legacy/legacy_kurmanji_cupertino.dart';
export 'src/legacy/legacy_kurmanji_material.dart';
