From: Allen Pais <allen.lkml@gmail.com>
Subject: [PATCH v3] drivers:platform/x86:Use ARRAY_SIZE() for the size calculation of the array.
Date: Wed, 13 Sep 2017 16:29:31 +0530
Message-ID: <1505300371-31740-1-git-send-email-allen.lkml@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35488 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751354AbdIMK7l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2017 06:59:41 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: souvik.k.chakravarty@intel.com, platform-driver-x86@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>

 Use ARRAY_SIZE() macro instead of TELEM_EVT_LEN().

v3: Replace TELEM_EVT_LEN() with ARRAY_SIZE().

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/platform/x86/intel_telemetry_debugfs.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index d4fc42b..74e518d 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -76,8 +76,6 @@
 #define TELEM_IOSS_DX_D0IX_EVTS		25
 #define TELEM_IOSS_PG_EVTS		30
 
-#define TELEM_EVT_LEN(x) (sizeof(x)/sizeof((x)[0]))
-
 #define TELEM_DEBUGFS_CPU(model, data) \
 	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)&data}
 
@@ -304,13 +302,13 @@ static struct telemetry_debugfs_conf telem_apl_debugfs_conf = {
 	.ioss_d0ix_data = telem_apl_ioss_d0ix_data,
 	.ioss_pg_data = telem_apl_ioss_pg_data,
 
-	.pss_idle_evts = TELEM_EVT_LEN(telem_apl_pss_idle_data),
-	.pcs_idle_blkd_evts = TELEM_EVT_LEN(telem_apl_pcs_idle_blkd_data),
-	.pcs_s0ix_blkd_evts = TELEM_EVT_LEN(telem_apl_pcs_s0ix_blkd_data),
-	.pss_ltr_evts = TELEM_EVT_LEN(telem_apl_pss_ltr_data),
-	.pss_wakeup_evts = TELEM_EVT_LEN(telem_apl_pss_wakeup),
-	.ioss_d0ix_evts = TELEM_EVT_LEN(telem_apl_ioss_d0ix_data),
-	.ioss_pg_evts = TELEM_EVT_LEN(telem_apl_ioss_pg_data),
+	.pss_idle_evts = ARRAY_SIZE(telem_apl_pss_idle_data),
+	.pcs_idle_blkd_evts = ARRAY_SIZE(telem_apl_pcs_idle_blkd_data),
+	.pcs_s0ix_blkd_evts = ARRAY_SIZE(telem_apl_pcs_s0ix_blkd_data),
+	.pss_ltr_evts = ARRAY_SIZE(telem_apl_pss_ltr_data),
+	.pss_wakeup_evts = ARRAY_SIZE(telem_apl_pss_wakeup),
+	.ioss_d0ix_evts = ARRAY_SIZE(telem_apl_ioss_d0ix_data),
+	.ioss_pg_evts = ARRAY_SIZE(telem_apl_ioss_pg_data),
 
 	.pstates_id = TELEM_APL_PSS_PSTATES_ID,
 	.pss_idle_id = TELEM_APL_PSS_IDLE_ID,
-- 
2.7.4
