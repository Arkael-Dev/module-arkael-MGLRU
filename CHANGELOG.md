# Changelog

## v1.0

- Initial release.
- Keeps Multi-Gen LRU (MGLRU) enabled after boot.
- Applies `min_ttl_ms` from `config.conf` (default `0` = off).
- Install-time check: aborts if the kernel has no `lru_gen`.
- Only for GKI 5.10 kernels that support Arkael Kernel.
