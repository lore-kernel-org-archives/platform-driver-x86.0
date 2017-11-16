From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v1 3/5] platform/x86: intel_telemetry: Fix local variables
Date: Thu, 16 Nov 2017 15:48:15 +0530
Message-ID: <1510827497-25188-4-git-send-email-souvik.k.chakravarty@intel.com>
References: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:21943 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933811AbdKPN6S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2017 08:58:18 -0500
In-Reply-To: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

Remove unnecesary 'static' qualifier.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 drivers/platform/x86/intel_telemetry_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index d0fce8c..60596a1 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -857,8 +857,8 @@ static int pm_suspend_prep_cb(void)
 static int pm_suspend_exit_cb(void)
 {
 	struct telemetry_evtlog evtlog[TELEM_MAX_OS_ALLOCATED_EVENTS];
-	static u32 suspend_shlw_ctr_exit, suspend_deep_ctr_exit;
-	static u64 suspend_shlw_res_exit, suspend_deep_res_exit;
+	u32 suspend_shlw_ctr_exit = 0, suspend_deep_ctr_exit = 0;
+	u64 suspend_shlw_res_exit = 0, suspend_deep_res_exit = 0;
 	struct telemetry_debugfs_conf *conf = debugfs_conf;
 	u32 shlw_lo, shlw_hi, deep_lo, deep_hi;
 	int ret, index;
-- 
2.7.4
