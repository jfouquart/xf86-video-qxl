--- src/qxl_drmmode.h.orig	2021-12-03 10:37:56 UTC
+++ src/qxl_drmmode.h
@@ -31,6 +31,7 @@
 
 #include "xf86drm.h"
 #include "xf86drmMode.h"
+#undef bool
 #include "xf86str.h"
 #include "randrstr.h"
 #include "xf86Crtc.h"
