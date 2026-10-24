# Changelog

## v1.2

- Added configurable RAM tuning (ram_tune.sh): swappiness, page-cluster, vfs_cache_pressure.
- New config.conf options: RAM_TUNE, SWAPPINESS, PAGE_CLUSTER, VFS_CACHE_PRESSURE.

## v1.1

- Added a WebUI: switch MGLRU on or off, set min_ttl_ms, and see reclaim stats.
- Changes apply live and are saved to config.conf.

## v1.0

- Initial release.
- Keeps Multi-Gen LRU (MGLRU) enabled after boot.
- Applies `min_ttl_ms` from `config.conf` (default `0` = off).
- Install-time check: aborts if the kernel has no `lru_gen`.
- Only for GKI 5.10 kernels that support Arkael Kernel.
