From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH 1/3] platform/x86: Add GLK PSS Event Table
Date: Fri, 14 Jul 2017 17:23:46 +0530
Message-ID: <1500033228-634-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:33810 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753472AbdGNLyK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2017 07:54:10 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, shanth.murthy@intel.com, souvik.k.chakravarty@intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

Some of the Primary Subsystem events differ on Gemini Lake but the IOSS
events remain same. This patch adds the updated PSS event table to enable
Telemetry driver on Gemini Lake.

Signed-off-by: Shanth Murthy <shanth.murthy@intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_telemetry_debugfs.c |  1 +
 drivers/platform/x86/intel_telemetry_pltdrv.c  | 35 ++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index 4cc2f4ea0a25..a0e4344b2eec 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -331,6 +331,7 @@ static struct telemetry_debugfs_conf telem_apl_debugfs_conf = {
 
 static const struct x86_cpu_id telemetry_debugfs_cpu_ids[] = {
 	TELEM_DEBUGFS_CPU(INTEL_FAM6_ATOM_GOLDMONT, telem_apl_debugfs_conf),
+	TELEM_DEBUGFS_CPU(INTEL_FAM6_ATOM_GEMINI_LAKE, telem_apl_debugfs_conf),
 	{}
 };
 
diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
index 6ebdbd2b04fc..6393b3b1d5a6 100644
--- a/drivers/platform/x86/intel_telemetry_pltdrv.c
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
@@ -153,6 +153,30 @@ static struct telemetry_evtmap
 	{"PC2_AND_MEM_SHALLOW_IDLE_RES",	0x1D40},
 };
 
+static struct telemetry_evtmap
+	telemetry_glk_pss_default_events[TELEM_MAX_OS_ALLOCATED_EVENTS] = {
+	{"IA_CORE0_C6_RES",			0x0400},
+	{"IA_CORE0_C6_CTR",			0x0000},
+	{"IA_MODULE0_C7_RES",			0x0410},
+	{"IA_MODULE0_C7_CTR",			0x000C},
+	{"IA_C0_RES",				0x0805},
+	{"PCS_LTR",				0x2801},
+	{"PSTATES",				0x2802},
+	{"SOC_S0I3_RES",			0x0407},
+	{"SOC_S0I3_CTR",			0x0008},
+	{"PCS_S0I3_CTR",			0x0007},
+	{"PCS_C1E_RES",				0x0414},
+	{"PCS_IDLE_STATUS",			0x2806},
+	{"IA_PERF_LIMITS",			0x280B},
+	{"GT_PERF_LIMITS",			0x280C},
+	{"PCS_WAKEUP_S0IX_CTR",			0x0025},
+	{"PCS_IDLE_BLOCKED",			0x2C00},
+	{"PCS_S0IX_BLOCKED",			0x2C01},
+	{"PCS_S0IX_WAKE_REASONS",		0x2C02},
+	{"PCS_LTR_BLOCKING",			0x2C03},
+	{"PC2_AND_MEM_SHALLOW_IDLE_RES",	0x1D40},
+};
+
 /* APL specific Data */
 static struct telemetry_plt_config telem_apl_config = {
 	.pss_config = {
@@ -163,8 +187,19 @@ static struct telemetry_plt_config telem_apl_config = {
 	},
 };
 
+/* GLK specific Data */
+static struct telemetry_plt_config telem_glk_config = {
+	.pss_config = {
+		.telem_evts = telemetry_glk_pss_default_events,
+	},
+	.ioss_config = {
+		.telem_evts = telemetry_apl_ioss_default_events,
+	},
+};
+
 static const struct x86_cpu_id telemetry_cpu_ids[] = {
 	TELEM_CPU(INTEL_FAM6_ATOM_GOLDMONT, telem_apl_config),
+	TELEM_CPU(INTEL_FAM6_ATOM_GEMINI_LAKE, telem_glk_config),
 	{}
 };
 
-- 
2.7.4
