# RAAD67 YouTube Clean

A 3105 workspace preset for YouTube Plus / YTLite preferences.

## Target
- YouTube bundle: `com.google.ios.youtube`
- User-reported YouTube version: `21.43.5`
- User-reported iOS version: `27.0.0`
- Preferences suite: `com.dvntm.ytlite`

## Included preset
The workspace preconfigures the documented YTLite settings:
- Remove ads: `noAds = true`
- Background playback: `backgroundPlayback = true`
- Hide related videos: `noRelatedVids = true`
- Hide promotion cards: `noPromotionCards = true`
- Hide watermarks: `noWatermarks = true`

These are actual preference keys used by YTLite's settings implementation, and its user-defaults suite is `com.dvntm.ytlite`.

## Critical compatibility requirement
**This is a YTLite/YouTube Plus preference preset, not a standalone ad blocker for stock YouTube.** The target app must already have a compatible YTLite runtime tweak injected/loaded. A plain App Store YouTube installation does not contain code that reads these preference keys, so applying this preset to unmodified YouTube will not remove ads.

3105 only applies container files and plist/JSON edits. It does not install YTLite, inject a dylib, or add runtime hooks. The preset therefore configures the tweak; it does not install the tweak.

## Use with 3105
1. In 3105, create a patch named `RAAD67 YouTube Clean` for bundle ID `com.google.ios.youtube`.
2. Open the 3105 workspace for that patch.
3. Copy the contents of this repository's `Patches/RAAD67 YouTube Clean/` folder into the workspace root, preserving `settings.json` and the `Application/` tree.
4. Synchronize the workspace, review the five boolean options, then export the package as `.3105`.
5. Close YouTube before applying. Use Restore Originals in 3105 to undo the patch.

## Validation
The plist uses a merge operation so unrelated preference keys are preserved. 3105's own journal/backup/restore flow remains responsible for safely applying and reverting the file. Verify that YTLite is loaded in YouTube and that its in-app Remove Ads switch reads as enabled after applying.

## Sources
- [YTLite settings implementation](https://github.com/dayanch96/YTLite/blob/main/Settings.x)
- [YTLite preference suite and defaults](https://github.com/dayanch96/YTLite/blob/main/Utils/YTLUserDefaults.m)
- [3105 patch workspace guide](https://github.com/YangJiiii/3105/blob/main/docs/PATCH_GUIDE.md)
- [YTLite releases](https://github.com/dayanch96/YTLite/releases)
