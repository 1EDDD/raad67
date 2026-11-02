#!/usr/bin/env bash
set -euo pipefail

# Read-only device inventory. Does not print the UDID or modify the phone.
for tool in idevice_id ideviceinfo; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    printf 'Missing dependency: %s (install libimobiledevice)\n' "$tool" >&2
    exit 127
  fi
done

if [[ -n "${DEVICE_UDID:-}" ]]; then
  device_udid="$DEVICE_UDID"
else
  devices=()
  while IFS= read -r line; do
    [[ -n "$line" ]] && devices+=("$line")
  done < <(idevice_id -l)

  if [[ ${#devices[@]} -eq 0 ]]; then
    printf 'No USB-connected iPhone found. Connect it and tap Trust.\n' >&2
    exit 1
  elif [[ ${#devices[@]} -gt 1 ]]; then
    printf 'More than one device is connected. Set DEVICE_UDID to select one.\n' >&2
    exit 2
  fi
  device_udid="${devices[0]}"
fi

read_key() {
  local key="$1"
  local value
  value="$(ideviceinfo -u "$device_udid" -k "$key" 2>/dev/null || true)"
  if [[ -z "$value" ]]; then
    value="unavailable"
  fi
  printf '%s' "$value"
}

printf 'RAAD67 read-only device audit\n'
printf '%-20s %s\n' "ProductType:" "$(read_key ProductType)"
printf '%-20s %s\n' "ProductVersion:" "$(read_key ProductVersion)"
printf '%-20s %s\n' "BuildVersion:" "$(read_key BuildVersion)"
printf '%-20s %s\n' "DeviceClass:" "$(read_key DeviceClass)"
printf '%-20s %s\n' "HardwareModel:" "$(read_key HardwareModel)"
printf '%-20s %s\n' "ChipID:" "$(read_key ChipID)"
printf '%-20s %s\n' "BoardId:" "$(read_key BoardId)"

printf '\nNo UDID, serial number, or account data was requested or printed.\n'
printf 'This audit does not establish jailbreak compatibility by itself.\n'
