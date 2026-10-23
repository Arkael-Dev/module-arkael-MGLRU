# Arkael-Mglru

KernelSU/Magisk module for **Arkael Kernel** (GKI android12-5.10).
Keeps Multi-Gen LRU (MGLRU) enabled after boot and applies `min_ttl_ms`.

## Compatibility

This module only works on **GKI 5.10 kernels that support Arkael Kernel**.
It requires `CONFIG_LRU_GEN` in the kernel and checks for it at install time.

## Config

Edit `config.conf` in the module folder:

- `ENABLE` : `1` = enable MGLRU, `0` = disable
- `MIN_TTL_MS` : working-set protection in ms (`0` = off, safest)

Log: `/data/adb/modules/arkael_mglru/mglru.log`

## WebUI

Open the module in KernelSU Manager and tap Open (WebUI). Switch MGLRU, set `min_ttl_ms`, and read reclaim stats. Changes apply live and are saved to `config.conf`.

## Build

`sh build.sh` (the zip goes to `dist/`).

## Links

- Telegram: https://t.me/arkaelkernel
- License: GPL-3.0 (see `LICENSE`)
