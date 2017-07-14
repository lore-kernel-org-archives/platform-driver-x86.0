From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH 3/3] platform/x86: Add Audio domain PG status events
Date: Fri, 14 Jul 2017 17:23:48 +0530
Message-ID: <1500033228-634-3-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1500033228-634-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500033228-634-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, shanth.murthy@intel.com, souvik.k.chakravarty@intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: "Murthy, Shanth" <shanth.murthy@intel.com>

This patch adds events to ioss telemetry to read the power gating status
for the audio domain.

Signed-off-by: Shanth Murthy <shanth.murthy@intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 arch/x86/include/asm/intel_telemetry.h        | 2 +-
 drivers/platform/x86/intel_telemetry_pltdrv.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/intel_telemetry.h b/arch/x86/include/asm/intel_telemetry.h
index 85029b58d0cd..4eeae0a4f9a2 100644
--- a/arch/x86/include/asm/intel_telemetry.h
+++ b/arch/x86/include/asm/intel_telemetry.h
@@ -17,7 +17,7 @@
 #define INTEL_TELEMETRY_H
 
 #define TELEM_MAX_EVENTS_SRAM		28
-#define TELEM_MAX_OS_ALLOCATED_EVENTS	20
+#define TELEM_MAX_OS_ALLOCATED_EVENTS	25
 
 enum telemetry_unit {
 	TELEM_PSS = 0,
diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
index e0424d5a795a..9ec437442deb 100644
--- a/drivers/platform/x86/intel_telemetry_pltdrv.c
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
@@ -125,6 +125,12 @@ static struct telemetry_evtmap
 	{"PMC_S0IX_BLOCKING_MISC_IPS_PG",       0x6008},
 	{"PMC_S0IX_BLOCK_IPS_VNN_REQ",          0x6009},
 	{"PMC_S0IX_BLOCK_IPS_CLOCKS",           0x600B},
+	{"AVSPGD1_IP_POWER_GATED_FW_COUNTER",	0x388D},
+	{"AVSPGD2_IP_POWER_GATED_FW_COUNTER",	0x388C},
+	{"AVSPGD3_IP_POWER_GATED_FW_COUNTER",	0x388B},
+	{"AVSPGD4_IP_POWER_GATED_FW_COUNTER",	0x388A},
+	{"AUDIO_VNN_REQ_MISC_COUNTER",		0x182B},
+
 };
 
 
-- 
2.7.4
