# رعد67 | RAAD67

**Independent iOS security research for iPhone 17 Pro Max.**

> **Status: research scaffold only. This repository does not contain a jailbreak or a working exploit.**

## Target

| Field | Value |
|---|---|
| Device | iPhone 17 Pro Max |
| SoC | A19 Pro |
| iOS | 27.0 |
| Build | 24A437 |
| Goal | Reproducible, device-tested root jailbreak |

## Current finding

The public `usbliter8` BootROM exploit targets A12/A13-family hardware (and specific S-series chips), not A19 Pro. Its USB/BootROM path is therefore not a valid entry point for this target. The separate [Liter8](https://github.com/Xplo8E/Liter8) project is an iOS 27 custom-firmware workflow whose README claims a tested iPhone 11 target; it does not establish support for iPhone 17 Pro Max.

A build number alone is not enough to establish compatibility. Firmware, board, SoC, boot chain, and the exact target device must all be independently verified.

## Repository contents

- `docs/DEVICE_SUPPORT.md`: evidence-based target compatibility notes.
- `docs/RESEARCH_PLAN.md`: staged research and validation gates.
- `scripts/audit-device.sh`: read-only inventory of a connected iPhone using libimobiledevice.

## First safe check

On macOS or Linux, install the libimobiledevice command-line tools, connect the iPhone by USB, trust the computer on the phone, then run:

```sh
bash scripts/audit-device.sh
```

The script reports public device/build identifiers only. It does **not** print the UDID, change device settings, enter DFU, restore, or write to the phone.

## What must exist before a jailbreak can be claimed

1. A documented and reproducible execution path applicable to the A19 Pro boot chain.
2. Exact-build firmware analysis with input hashes and verified patch pre-images.
3. A demonstrated kernel privilege-escalation path and the required security-policy handling.
4. A tested bootstrap and package-management environment.
5. Repeatable boot, recovery, and health-check results on the exact target device.

Until those gates are met, RAAD67 remains a research project. No fake installer, profile, or "one-click root" will be published under this name.

## Safety

Keep the device on its current firmware while compatibility research is ongoing. Do not run restore/erase workflows, flash experimental firmware, or install unverified profiles or binaries as a substitute for a validated exploit chain.
