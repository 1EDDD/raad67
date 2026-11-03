# YouTube ad-block patch research (3105)

This repository currently contains a research scaffold for a **file-only 3105 patch** targeting the official YouTube iOS app.

## Target (user-supplied)
- Bundle ID: `com.google.ios.youtube`
- YouTube version: `21.43.5`
- iOS: `27.0.0`
- Intended result: suppress in-app advertisements.

## Important technical boundary
3105 patches replace or add files in an app container and can edit supported plist/JSON data. It does **not** inject executable code into YouTube or install runtime hooks. YouTube ad decisions are not controlled by a publicly documented, stable preference plist. Therefore this repository does not pretend that adding a guessed `noAds` preference removes ads.

A real ad-removal implementation for the official YouTube app generally needs runtime code integration (for example, a compatible tweak injected into the app) and exact-version validation. That is outside a file-only `.3105` patch. Do not ship a package as working unless tests confirm that ads are actually suppressed.

## Current status
- [x] Confirmed 3105 patch workspace format.
- [x] Recorded exact target identifiers and version.
- [ ] Obtain a clean, user-owned YouTube app-container inventory and identify candidate configuration files.
- [ ] Verify whether any ad-related preference is actually read by version 21.43.5.
- [ ] Build and test a file-only .3105 package, only if a real supported setting is found.
- [ ] Otherwise document that a runtime integration is required; do not publish a fake patch.

## Safe next step
Use 3105's Files view to export the relevant YouTube `Library/Preferences` plist and app configuration files from your own installed copy. Remove account identifiers and personal data before sharing. We can inspect those files for real, app-consumed settings. Never upload cookies, tokens, account databases, or personal media.

## References
- 3105 patch workspace guide: https://github.com/YangJiiii/3105/blob/main/docs/PATCH_GUIDE.md
- 3105 README and feature boundaries: https://github.com/YangJiiii/3105
- YTLite (runtime tweak research): https://github.com/dayanch96/YTLite
