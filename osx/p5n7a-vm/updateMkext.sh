KEXT_RETAIL="../System/Library/Extensions"
KEXT_EXTRA="../Extra/Extensions"
MKEXT="../Extra/Extensions.mkext"

kextcache -v 1 -t -l -a i386 -m "$MKEXT" "$KEXT_EXTRA" "$KEXT_RETAIL"
