From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v1 2/5] platform/x86: intel_telemetry: Fix suspend stats
Date: Thu, 16 Nov 2017 15:48:14 +0530
Message-ID: <1510827497-25188-3-git-send-email-souvik.k.chakravarty@intel.com>
References: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com>
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

Reported-and-tested-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 drivers/platform/x86/intel_telemetry_debugfs.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index 4249e826..d0fce8c 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -74,6 +74,8 @@
 #define TELEM_IOSS_DX_D0IX_EVTS		25
 #define TELEM_IOSS_PG_EVTS		30
 
+#define TELEM_LO_HI_TO64(lo, hi)	((u64)(lo) + ((u64)(hi)<<32))
+
 #define TELEM_DEBUGFS_CPU(model, data) \
 	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)&data}
 
@@ -858,6 +860,7 @@ static int pm_suspend_exit_cb(void)
 	static u32 suspend_shlw_ctr_exit, suspend_deep_ctr_exit;
 	static u64 suspend_shlw_res_exit, suspend_deep_res_exit;
 	struct telemetry_debugfs_conf *conf = debugfs_conf;
+	u32 shlw_lo, shlw_hi, deep_lo, deep_hi;
 	int ret, index;
 
 	if (!suspend_prep_ok)
@@ -890,6 +893,42 @@ static int pm_suspend_exit_cb(void)
 		goto out;
 	}
 
+	/* Due to some design limitations in the firmware, sometimes the
+	 * counters do not get updated by the time we reach here. As a
+	 * workaround, we try to see if this was a genuine case of sleep
+	 * failure or not by cross-checking from PMC GCR registers directly.
+	 */
+	if ((suspend_shlw_ctr_exit == suspend_shlw_ctr_temp) &&
+	    (suspend_deep_ctr_exit == suspend_deep_ctr_temp)) {
+		ret = intel_pmc_gcr_read(PMC_GCR_TELEM_SHLW_S0IX_LO_REG,
+					 &shlw_lo);
+		if (ret < 0)
+			goto out;
+
+		ret = intel_pmc_gcr_read(PMC_GCR_TELEM_SHLW_S0IX_HI_REG,
+					 &shlw_hi);
+		if (ret < 0)
+			goto out;
+
+		ret = intel_pmc_gcr_read(PMC_GCR_TELEM_DEEP_S0IX_LO_REG,
+					 &deep_lo);
+		if (ret < 0)
+			goto out;
+
+		ret = intel_pmc_gcr_read(PMC_GCR_TELEM_DEEP_S0IX_HI_REG,
+					 &deep_hi);
+		if (ret < 0)
+			goto out;
+
+		suspend_shlw_res_exit = TELEM_LO_HI_TO64(shlw_lo, shlw_hi);
+		if (suspend_shlw_res_exit > suspend_shlw_res_temp)
+			suspend_shlw_ctr_exit++;
+
+		suspend_deep_res_exit = TELEM_LO_HI_TO64(deep_lo, deep_hi);
+		if (suspend_deep_res_exit > suspend_deep_res_temp)
+			suspend_deep_ctr_exit++;
+	}
+
 	suspend_shlw_ctr_exit -= suspend_shlw_ctr_temp;
 	suspend_deep_ctr_exit -= suspend_deep_ctr_temp;
 	suspend_shlw_res_exit -= suspend_shlw_res_temp;
-- 
2.7.4
