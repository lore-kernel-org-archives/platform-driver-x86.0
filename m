From: Allen Pais <allen.lkml@gmail.com>
Subject: [PATCH] drivers:platform/x86:Use ARRAY_SIZE() for the size calculation of the array.
Date: Wed, 13 Sep 2017 13:32:52 +0530
Message-ID: <1505289772-26045-1-git-send-email-allen.lkml@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: souvik.k.chakravarty@intel.com, platform-driver-x86@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/platform/x86/intel_telemetry_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index d4fc42b..3ccc7ac 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -76,7 +76,7 @@
 #define TELEM_IOSS_DX_D0IX_EVTS		25
 #define TELEM_IOSS_PG_EVTS		30
 
-#define TELEM_EVT_LEN(x) (sizeof(x)/sizeof((x)[0]))
+#define TELEM_EVT_LEN(x) (ARRAY_SIZE(x))
 
 #define TELEM_DEBUGFS_CPU(model, data) \
 	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)&data}
-- 
2.7.4
