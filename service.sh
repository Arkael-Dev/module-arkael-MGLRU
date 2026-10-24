#!/system/bin/sh
MODDIR=${0%/*}
LOG=$MODDIR/mglru.log
LRU=/sys/kernel/mm/lru_gen
ENABLE=1
MIN_TTL_MS=0
[ -f "$MODDIR/config.conf" ] && . "$MODDIR/config.conf"
case "$ENABLE" in 0|1) ;; *) ENABLE=1 ;; esac
case "$MIN_TTL_MS" in ''|*[!0-9]*) MIN_TTL_MS=0 ;; esac
(sh "$MODDIR/ram_tune.sh" &)
until [ "$(getprop sys.boot_completed)" = "1" ]; do sleep 5; done
sleep 15
{
echo "[$(date '+%F %T')] Arkael MGLRU"
if [ ! -e "$LRU/enabled" ]; then echo "lru_gen not found, kernel has no MGLRU"; exit 0; fi
echo "before: $(cat $LRU/enabled)"
if [ "$ENABLE" = 1 ]; then echo y > "$LRU/enabled"; else echo n > "$LRU/enabled"; fi
echo "after: $(cat $LRU/enabled)"
if [ -w "$LRU/min_ttl_ms" ]; then
  echo "$MIN_TTL_MS" > "$LRU/min_ttl_ms"
  echo "min_ttl_ms: $(cat $LRU/min_ttl_ms)"
fi
} > "$LOG" 2>&1
