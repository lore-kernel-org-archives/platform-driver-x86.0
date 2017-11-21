From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v2 2/4] platform/x86: intel_telemetry: Fix suspend stats
Date: Tue, 21 Nov 2017 20:06:22 +0530
Message-ID: <1511274984-6165-3-git-send-email-souvik.k.chakravarty@intel.com>
References: <1511274984-6165-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511274984-6165-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Suspend stats are not reported consistently due to a limitation in the PMC
firmware. This limitation causes a delay in updating the s0ix counters and
residencies in the telemetry log upon s0ix exit. As a consequence, reading
these counters from the suspend-exit notifier may result in zero read.

This patch fixes this issue by cross-verifying the s0ix residencies from
the GCR TELEM registers in case the counters are not incremented in the
telemetry log after suspend.

This fixes https://bugzilla.kernel.org/show_bug.cgi?id=197833

We also remove unnecessary 'static' qualifiers from local variables.

Reported-and-tested-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 drivers/platform/x86/intel_telemetry_debugfs.c | 29 ++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

Changes since v1:
 * Use pmc_ipc_gcr_readq API to read 64-bits at a time

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index 4249e826..d7e90fd 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -855,9 +855,9 @@ static int pm_suspend_prep_cb(void)
 static int pm_suspend_exit_cb(void)
 {
 	struct telemetry_evtlog evtlog[TELEM_MAX_OS_ALLOCATED_EVENTS];
-	static u32 suspend_shlw_ctr_exit, suspend_deep_ctr_exit;
-	static u64 suspend_shlw_res_exit, suspend_deep_res_exit;
 	struct telemetry_debugfs_conf *conf = debugfs_conf;
+	u32 suspend_shlw_ctr_exit, suspend_deep_ctr_exit;
+	u64 suspend_shlw_res_exit, suspend_deep_res_exit;
 	int ret, index;
 
 	if (!suspend_prep_ok)
@@ -890,6 +890,31 @@ static int pm_suspend_exit_cb(void)
 		goto out;
 	}
 
+	/*
+	 * Due to some design limitations in the firmware, sometimes the
+	 * counters do not get updated by the time we reach here. As a
+	 * workaround, we try to see if this was a genuine case of sleep
+	 * failure or not by cross-checking from PMC GCR registers directly.
+	 */
+	if (suspend_shlw_ctr_exit == suspend_shlw_ctr_temp &&
+	    suspend_deep_ctr_exit == suspend_deep_ctr_temp) {
+		ret = intel_pmc_gcr_readq(PMC_GCR_TELEM_SHLW_S0IX_REG,
+					  &suspend_shlw_res_exit);
+		if (ret < 0)
+			goto out;
+
+		ret = intel_pmc_gcr_readq(PMC_GCR_TELEM_DEEP_S0IX_REG,
+					  &suspend_deep_res_exit);
+		if (ret < 0)
+			goto out;
+
+		if (suspend_shlw_res_exit > suspend_shlw_res_temp)
+			suspend_shlw_ctr_exit++;
+
+		if (suspend_deep_res_exit > suspend_deep_res_temp)
+			suspend_deep_ctr_exit++;
+	}
+
 	suspend_shlw_ctr_exit -= suspend_shlw_ctr_temp;
 	suspend_deep_ctr_exit -= suspend_deep_ctr_temp;
 	suspend_shlw_res_exit -= suspend_shlw_res_temp;
-- 
2.7.4
