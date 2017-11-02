From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] platform/x86: intel_telemetry: add back linux/io.h inclusion
Date: Thu,  2 Nov 2017 17:49:27 +0100
Message-ID: <20171102164933.110292-1-arnd@arndb.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:58701 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932475AbdKBQuL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2017 12:50:11 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Shanth Murthy <shanth.murthy@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This one wasn't redundant after all, as shown by this randconfig
build error:

drivers/platform/x86/intel_telemetry_pltdrv.c: In function 'telem_evtlog_read':
drivers/platform/x86/intel_telemetry_pltdrv.c:900:20: error: implicit declaration of function 'readq' [-Werror=implicit-function-declaration]

We should generally include exactly the set of headers that declare
the interfaces we use, so this adds back the missing include to
get it to compile again.

Fixes: a5e50220edbd ("platform/x86: intel_telemetry: cleanup redundant headers")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/intel_telemetry_pltdrv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
index 678abf2e9e92..45f790a22ca2 100644
--- a/drivers/platform/x86/intel_telemetry_pltdrv.c
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
@@ -16,6 +16,7 @@
  * It used the PUNIT and PMC IPC interfaces for configuring the counters.
  * The accumulated results are fetched from SRAM.
  */
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-- 
2.9.0
