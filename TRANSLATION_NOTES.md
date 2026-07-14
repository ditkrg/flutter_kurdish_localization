# Translation review notes

Working notes from AI-assisted translation review passes on this package's
Kurdish (ckb, Central Kurdish / Sorani) and Kurmanji (kmr, Badini / Behdini)
strings. Read this before acting on a new AI review pass, human or automated
-- it exists so the same ground gets re-covered once, not every time.

## Protocol: verify before applying

AI translation review (any model) sometimes states a dialectal rule with
confidence that isn't true in practice ("Badini never uses X, always Y").
Before applying a suggested fix that claims a *general* dialectal pattern
(not just "this one word/string is wrong"), check it against a real corpus
of professionally-translated Badini text if one is available, or get a
native speaker to confirm. A single fluent-sounding claim from a model is
not evidence on its own -- cross-check, then apply.

## 2026-07-14: Devin CLI + Gemini 3.5 Flash review pass

Ran a read-only review of all 6 delegate files (kurdish_*/kurmanji_* x
material/cupertino/widget) via `devin --model gemini-3.5-flash`. Findings
were cross-checked against a corpus of ~1650 real, professionally-translated
kmr strings (pulled from the Warger translation platform's cross-project
memory: Common, Pilgrimage Portal, Runaki Portal, and others) before being
applied.

### Confirmed and fixed

- **ckb Cupertino file had ~12 strings left in Zulu** (`ihora`, `Sesha`,
  `ezimpondweni`, `amahora`, `iminithi`, `isekhondi`, etc.) -- leftover
  template text from whatever locale scaffold the original package was built
  from, not real ckb. Fixed using vocabulary already established elsewhere
  in the ckb Material file (کاتژمێر, خولەک, گەڕان, چرکە) for consistency.
  Regression test: `Kurdish (ckb) Cupertino regression coverage` in
  `test/kurmanji_localization_test.dart`.
- **ckb `cancelButtonLabel` typo**: ended in a bare Arabic heh (`ه`,
  U+0647) instead of the Kurdish schwa letter (`ە`, U+06D5) -- `هەڵوەشاندنەوه`
  → `هەڵوەشاندنەوە`.
- **`menuBarMenuLabel` / `bottomSheetLabel` / `scrimLabel`** were left in
  literal English ('Menu bar menu', 'Bottom sheet', 'Scrim') in both ckb and
  kmr Material files -- these are real accessibility/screen-reader strings,
  not deliberately-untranslated tokens (unlike `keyboardKey*`, see below).
  Translated in both dialects.
- **ckb `remainingTextFieldCharacterCountOther`**: `$remainingCount پیتەکان
  ماون` used a plural noun after the numeral, which is inconsistent with
  every other counted-noun string in the same file (Kurdish, like the app's
  own kmr content, keeps the noun singular after a numeral). Fixed to
  `$remainingCount پیت ماون`.
- **kmr `dateOutOfRangeLabel`**: missing the `ل` preposition Badini needs
  before "outside of X" -- `دەرڤەی مەودایێ یە` → `ل دەرڤەی مەودایێ یە`.
- **kmr Widget `reorderItem*` used the wrong grammatical voice**: `بچۆ خوارێ`
  etc. is intransitive ("you go down"), copied from the Material file's own
  (also debatable, but internally consistent for Material) choice. The ckb
  *Widget* sibling actually uses transitive "drag" phrasing (`ڕایبکێشەرە
  خوارەوە` = "pull yourself/drag down"), not "go" phrasing -- Material and
  Widget disagree with each other even within ckb itself. Fixed kmr Widget's
  six `reorderItem*` getters to use `بکێشە` (drag/pull, transitive),
  matching its own ckb sibling rather than the Material file's pattern.
  Regression test covers this.

### Reviewed and rejected (do not re-flag these)

Gemini proposed several *general dialectal rules* that the real kmr corpus
does not support. Do not re-apply these without new evidence:

- **"کات" (time) is Sorani-only, Badini uses "دەم"** -- false. `کات` appears
  16x in the real kmr corpus vs 3x for `دەم` as a standalone word. `کات` is
  pan-dialectal.
- **"Badini avoids the heavy ڵ (lam with dot), uses plain ل instead"** --
  false as a general rule. `ڵ` appears 208 times across the corpus in
  ordinary Badini words (ئیمەیڵ, ڕۆڵ, دڵنیا, هەڵوەشاندن, دەسەڵات, دڵ, ...).
  It is a real, commonly-used Kurdish letter in Kurmanji too, not
  Sorani-exclusive.
- **"خولەک" (minute) is Sorani-only, Badini uses "خۆلەک"** -- false as
  stated. `خولەک` is attested in the corpus; `خۆلەک` never appears.
- **`selectAllButtonLabel` should use ھ (heh goal, U+06BE) instead of ه
  (regular heh, U+0647)** -- false as a general rule. Regular `ه` outnumbers
  `ھ` 516:15 in the corpus; `ه` is the standard letter in practice here.

### Flagged but not applied -- needs a native speaker, not more AI review

- **`کاتژمێر` (hour/clock) vs `سەعات`** for kmr specifically: no corpus data
  either way (0 hits for both). Left as `کاتژمێر` (matches the app's and
  this package's existing usage) rather than guessing. If a native Badini
  reviewer says `سەعات` is more natural, change it -- but this is a genuine
  open question, not a confirmed bug.
- **`مۆڵەت` (license, heavy ڵ) vs `مۆلەت` (light ل)** for kmr specifically:
  weak signal (1 corpus hit for `مۆلەت`, 0 for `مۆڵەت`), too thin to act on
  given the general "avoid ڵ" theory above is false. Left as `مۆڵەت`.
- **`کۆپی`/`پەیست` (copy/paste) as English loanwords** vs more "native"
  alternatives (`لەبەرگرتنەوە`/`لکاندن` etc.): these loanwords are extremely
  common in real Kurdish software UI and match this package's and the app's
  own established choice throughout. Treated as an acceptable register
  choice, not an error -- a native reviewer may disagree, that's fine, but
  it's a style call, not a bug.
- **`showMenuTooltip` ckb ("پێڕست" = index/list vs "مێنیو" = menu)**: minor,
  debatable, low-impact wording preference. Not changed.
- **`keyboardKeyShift` ("Left Shift") should be translated**: rejected --
  every other `keyboardKey*` getter (Ctrl, Alt, Backspace, PgDown, ...) is
  deliberately left in English (these are physical keyboard key names,
  commonly shown untranslated even in localized OS/app UI). Translating only
  this one would break internal consistency with its ~40 sibling getters.

## How to run this kind of review again

```
devin --model gemini-3.5-flash --permission-mode auto -p "<review prompt>"
```

Use `--permission-mode auto` for read-only review (never edits files). Give
it the matched ckb/kmr file pair together so it can compare them, and ask it
to flag general *patterns* of mistakes, not just individual strings -- but
verify any claimed pattern against real translated text (this repo doesn't
carry the corpus; it currently lives in the consuming app's Warger
cross-project memory) before treating it as ground truth.
