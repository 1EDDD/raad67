# Target and validation plan

## Target
- App: YouTube for iOS
- Bundle identifier: `com.google.ios.youtube`
- Version: `21.43.5`
- OS: iOS `27.0.0`
- Package format sought: 3105

## What counts as success
A patch is successful only after applying it to a test installation and verifying, across multiple launches and network states, that:
1. in-stream video ads do not appear;
2. homepage/feed sponsored placements do not appear;
3. app startup, playback, sign-in state, captions, and quality selection still work;
4. restoring originals returns the app container to its prior state.

Screenshots alone are insufficient. Record app build, device model, OS build, exact patch files, and reproducible test steps.

## File-only feasibility gate
3105's documented patch workflow replaces files in the app container. It does not provide runtime injection. We need evidence that YouTube 21.43.5 actually reads a persistent, documented ad preference before creating a patch. A guessed plist key is not evidence.

Candidate files must be inspected from an installation owned by the tester. Exclude cookies, account tokens, databases containing personal data, and media.

## Stop condition
If ad selection is controlled by executable runtime logic and no supported container preference exists, stop the .3105 implementation. Report the limitation instead of shipping an inert package.
