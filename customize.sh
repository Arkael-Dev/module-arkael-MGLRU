if [ ! -e /sys/kernel/mm/lru_gen/enabled ]; then
  ui_print "! This kernel has no MGLRU (lru_gen)"
  abort "! Flash a kernel with CONFIG_LRU_GEN first"
fi
ui_print "- Kernel: $(uname -r)"
ui_print "- MGLRU found, current: $(cat /sys/kernel/mm/lru_gen/enabled)"
set_perm_recursive "$MODPATH" 0 0 0755 0644
set_perm "$MODPATH/service.sh" 0 0 0755
set_perm "$MODPATH/ram_tune.sh" 0 0 0755
