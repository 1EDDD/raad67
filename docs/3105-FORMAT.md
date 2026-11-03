# 3105 format notes

3105 uses stable Application and App Group identifiers. It does not pin device-specific container UUIDs.

The current workspace layout is:
```
RAAD67 YouTube Clean/
  settings.json
  Application/
    com.google.ios.youtube/
      Library/
        Preferences/
          %3105_Overwrite%com.dvntm.ytlite.plist
```

The workspace filename prefix `%3105_Overwrite%` instructs 3105 to merge the dictionary payload into the existing plist. The prefix is removed when the patch is packaged and applied, so the device destination is:

```
Library/Preferences/com.dvntm.ytlite.plist
```

The settings file declares five typed Boolean fields. The plist values are placeholders, allowing 3105 to preserve actual Boolean types when users toggle options in the installed patch detail.

## What this patch does

It writes preferences consumed by YTLite's `NSUserDefaults` suite named `com.dvntm.ytlite`. The payload explicitly sets:
- `noAds`
- `backgroundPlayback`
- `noRelatedVids`
- `noPromotionCards`
- `noWatermarks`

YTLite's source uses `noAds` in its player monetization and spam-signal hooks. Other keys control the corresponding overlay, playback, and watermark features.

## What it does not do

A plist payload cannot install YTLite, inject its dylib, or add runtime hooks to the original App Store YouTube app. The tweak must already be present and loaded in the target YouTube build. This workspace is a preferences preset, not a standalone jailbreak or standalone ad blocker.

Official 3105 guide: https://github.com/YangJiiii/3105/blob/main/docs/PATCH_GUIDE.md
YTLite preference implementation: https://github.com/dayanch96/YTLite/blob/main/Utils/YTLUserDefaults.m
YTLite hooks: https://github.com/dayanch96/YTLite/blob/main/YTLite.x
