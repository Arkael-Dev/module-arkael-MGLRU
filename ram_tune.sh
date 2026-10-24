#!/system/bin/sh
MODDIR=${0%/*}
LOG=$MODDIR/ram_tune.log
RAM_TUNE=1
SWAPPINESS=100
PAGE_CLUSTER=0
VFS_CACHE_PRESSURE=120
[ -f "$MODDIR/config.conf" ] && . "$MODDIR/config.conf"

num() { case "$1" in ''|*[!0-9]*) return 1 ;; esac; }
num "$SWAPPINESS" && [ "$SWAPPINESS" -le 200 ] || SWAPPINESS=100
num "$PAGE_CLUSTER" && [ "$PAGE_CLUSTER" -le 3 ] || PAGE_CLUSTER=0
num "$VFS_CACHE_PRESSURE" && [ "$VFS_CACHE_PRESSURE" -le 1000 ] || VFS_CACHE_PRESSURE=120

[ "$RAM_TUNE" = 1 ] || exit 0
until [ "$(getprop sys.boot_completed)" = "1" ]; do sleep 5; done
sleep 20

w() {
  if [ -w "$1" ]; then
    echo "$2" > "$1" && echo "$1 = $(cat "$1")"
  else
    echo "skip (not writable): $1"
  fi
}

{
echo "[$(date '+%F %T')] Arkael RAM tune"
w /proc/sys/vm/swappiness "$SWAPPINESS"
w /proc/sys/vm/page-cluster "$PAGE_CLUSTER"
w /proc/sys/vm/vfs_cache_pressure "$VFS_CACHE_PRESSURE"
} > "$LOG" 2>&1
