# RAAD67 research plan

## Phase 0: freeze the target

Record the exact product type, hardware/board identifiers, SoC, iOS version, build, and host environment. Preserve the original device state. Do not update, restore, erase, or enter an experimental boot workflow during reconnaissance.

**Exit condition:** an auditable target manifest with source and timestamp for each field.

## Phase 1: vulnerability applicability

For each proposed vulnerability, record:
- affected SoC and hardware revisions;
- affected boot-ROM / firmware component;
- required physical access and external hardware;
- affected OS/build range;
- published proof-of-concept and independent reproduction;
- limitations and untested assumptions.

Reject a candidate immediately when its vulnerable SoC family does not include the target. In particular, do not treat usbliter8 as an A19 Pro exploit.

**Exit condition:** at least one credible, reproducible entry point applicable to the exact target hardware.

## Phase 2: firmware inventory and static analysis

Obtain the exact stock IPSW through Apple's normal firmware distribution. Verify its BuildManifest identity and record SHA-256 hashes for all inputs. Keep clean firmware inputs immutable. Separate:
- firmware identity and board selection;
- semantic resolver logic;
- build-specific signatures and payloads;
- test fixtures containing original bytes and expected outputs.

Never substitute offsets copied from a different device or build. Reject ambiguous resolver matches instead of selecting the nearest candidate.

**Exit condition:** independent review of every proposed modification and its exact pre-image.

## Phase 3: privilege chain

A boot-time code-execution primitive alone is not a complete jailbreak. Research must account for the target's complete chain, including boot policy, kernel protections, code-signing policy, system volume layout, userland launch, and any relevant TXM/SPTM/SEP boundaries.

Keep each stage isolated and testable. Do not weaken unrelated security controls merely to make a boot appear successful.

**Exit condition:** a documented, repeatable path to the required privileges on a dedicated test device of the exact supported configuration.

## Phase 4: bootstrap and user experience

Only after the privilege chain is proven:
- build a reproducible bootstrap;
- add package management and tweak injection as separate components;
- verify ownership, permissions, signatures, and launch behavior;
- provide a recovery path and a clear uninstall procedure.

**Exit condition:** repeatable install, reboot, health check, and recovery tests.

## Phase 5: release gate

A public release requires:
- exact device/build compatibility evidence;
- source code and pinned dependencies;
- reproducible build instructions;
- test logs and known limitations;
- recovery instructions;
- no placeholder success checks.

Until then, the project must be labelled research-only.
