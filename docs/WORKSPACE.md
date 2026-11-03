# RAAD67 YouTube Clean workspace

Copy the contents of `Patches/RAAD67 YouTube Clean/` into the root of a new 3105 patch workspace named `RAAD67 YouTube Clean`.

## Mapping
- Application bundle: `com.google.ios.youtube`
- Destination: `Library/Preferences/com.dvntm.ytlite.plist`
- Workspace filename prefix: `%3105_Overwrite%` (3105 strips this prefix and merges the plist dictionary while preserving unrelated keys)
- Preferences suite: `com.dvntm.ytlite`

## Why the mapping is structured this way
YTLite initializes `NSUserDefaults` with suite name `com.dvntm.ytlite`. Its settings interface writes the `noAds`, `backgroundPlayback`, `noRelatedVids`, `noPromotionCards`, and `noWatermarks` keys into that suite. The 3105 mapping writes those values in the YouTube app's Library/Preferences directory.

## Important
The target YouTube app must already load a compatible YTLite/YouTube Plus tweak. This plist cannot install or inject that tweak, and stock YouTube does not consume these YTLite keys. Applying it to stock YouTube alone will not block ads.

## Test
1. Confirm YTLite is present and loaded in the target app.
2. Apply the patch with YouTube closed.
3. Reopen YouTube, open YTLite settings, and confirm the five toggles.
4. Test video ads, Shorts promo cards, background audio, and related-video display.
5. Restore Originals in 3105 and verify the original plist is recovered.
