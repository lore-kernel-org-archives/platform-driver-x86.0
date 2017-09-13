From: Allen Pais <allen.lkml@gmail.com>
Subject: [PATCH v2] drivers:platform/x86:Use ARRAY_SIZE() for the size calculation of the array.
Date: Wed, 13 Sep 2017 14:24:15 +0530
Message-ID: <1505292855-27476-1-git-send-email-allen.lkml@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:33926 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750776AbdIMIyX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2017 04:54:23 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: souvik.k.chakravarty@intel.com, platform-driver-x86@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/platform/x86/intel_telemetry_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index d4fc42b..6b63b3d 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -76,7 +76,7 @@
 #define TELEM_IOSS_DX_D0IX_EVTS		25
 #define TELEM_IOSS_PG_EVTS		30
 
-#define TELEM_EVT_LEN(x) (sizeof(x)/sizeof((x)[0]))
+#define TELEM_EVT_LEN(x) ARRAY_SIZE(x)
 
 #define TELEM_DEBUGFS_CPU(model, data) \
 	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)&data}
-- 
2.7.4
