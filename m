From: ong.hock.yu@intel.com
Subject: [PATCH] platform:x86 Remove Monitor MWAIT feature dependency
Date: Thu, 23 Jun 2016 14:59:58 +0800
Message-ID: <1466665198-14446-2-git-send-email-ong.hock.yu@intel.com>
References: <1466665198-14446-1-git-send-email-ong.hock.yu@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466665198-14446-1-git-send-email-ong.hock.yu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: souvik.k.chakravarty@intel.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, ong.hock.yu@intel.com
List-Id: platform-driver-x86.vger.kernel.org

From: "Yu, Ong Hock" <ong.hock.yu@intel.com>

Telemetry capability does not depend on Monitor MWAIT feature.

Signed-off-by: Yu, Ong Hock <ong.hock.yu@intel.com>
---
 drivers/platform/x86/intel_telemetry_debugfs.c | 2 +-
 drivers/platform/x86/intel_telemetry_pltdrv.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index f5134ac..d76ee59 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -78,7 +78,7 @@
 #define TELEM_EVT_LEN(x) (sizeof(x)/sizeof((x)[0]))
 
 #define TELEM_DEBUGFS_CPU(model, data) \
-	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_MWAIT, (unsigned long)&data}
+	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)&data}
 
 #define TELEM_CHECK_AND_PARSE_EVTS(EVTID, EVTNUM, BUF, EVTLOG, EVTDAT, MASK) { \
 	if (evtlog[index].telem_evtid == (EVTID)) { \
diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
index 09c84a2..e62cee9 100644
--- a/drivers/platform/x86/intel_telemetry_pltdrv.c
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
@@ -82,7 +82,7 @@
 #define TELEM_SET_VERBOSITY_BITS(x, y)	((x) |= ((y) << 27))
 
 #define TELEM_CPU(model, data) \
-	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_MWAIT, (unsigned long)&data }
+	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)&data }
 
 enum telemetry_action {
 	TELEM_UPDATE = 0,
-- 
1.9.1
