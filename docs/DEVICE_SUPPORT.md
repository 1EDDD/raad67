# Device compatibility

## Target device

| Property | Observed / intended value |
|---|---|
| Marketing model | iPhone 17 Pro Max |
| SoC family | A19 Pro |
| iOS version | 27.0 |
| Build | 24A437 |
| Current RAAD67 status | **Not supported / no public chain verified** |

The iOS version and build above were read from the device's Settings screenshot supplied for this project. The product identifier and board identifier should be independently collected from the connected device before any firmware work.

## Why usbliter8 is not a route for this phone

The public usbliter8 disclosure describes a SecureROM/USB-controller issue affecting A12 and A13 devices (plus selected S4/S5 products). A14 and later silicon uses the corrected protection configuration; the iPhone 17 Pro Max's A19 Pro is outside the affected SoC families.

Sources:
- [MacRumors: A12 and A13 chips facing the unpatchable usbliter8 exploit](https://www.macrumors.com/2026/06/18/a12-and-a13-chips-facing-exploit/)
- [9to5Mac: usbliter8 affected SoCs and device families](https://9to5mac.com/2026/06/18/new-unpatchable-exploit-targets-apple-devices-with-a12-and-a13-chips/)

## Why Liter8 is not a drop-in base

[Xplo8E/Liter8](https://github.com/Xplo8E/Liter8) describes its current custom iOS 27 workflow as iPhone 11-only (`n104ap`). Its support table marks iPhone 11 Pro and Pro Max as experimental, not reviewed. The project depends on the A12/A13 usbliter8 entry path and contains device-specific firmware resolvers and boot policy. Copying its payloads or build profiles to A19 Pro would be unsupported.

## Support labels used by RAAD67

- **Unknown:** no evidence collected for the exact device/build.
- **Researching:** firmware and hardware identity recorded; static analysis underway.
- **Experimental:** a reproducible candidate path exists, but device validation is incomplete. Never equivalent to a usable jailbreak.
- **Device-tested:** complete workflow has passed on the exact product type and build, including recovery and repeat-boot checks.

No status may be promoted based only on matching an iOS version string.
