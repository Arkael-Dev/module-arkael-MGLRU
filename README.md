# Arkael-Mglru

KernelSU/Magisk module for Arkael Kernel (GKI android12-5.10).
Keeps Multi-Gen LRU enabled after boot and applies `min_ttl_ms`.

- Requires a kernel with `CONFIG_LRU_GEN` (checked at install).
- Edit `config.conf` in the module folder: `ENABLE`, `MIN_TTL_MS` (0 = off).
- Log: `/data/adb/modules/arkael_mglru/mglru.log`
- Build: `sh build.sh` (zip goes to `dist/`).
