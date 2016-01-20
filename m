From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH] platform:x86: Fix warnings in telemetry debugfs
Date: Wed, 20 Jan 2016 12:20:46 +0530
Message-ID: <1453272646-15183-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:44226 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750923AbcATGoK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 Jan 2016 01:44:10 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

This patch fixes compile time warnings when CONFIG_PM_SLEEP
is undefined. In this case sleep related counters are unused.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 drivers/platform/x86/intel_telemetry_debugfs.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index 5b31d15..f5134ac 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -96,9 +96,11 @@
 	} \
 }
 
+#ifdef CONFIG_PM_SLEEP
 static u8 suspend_prep_ok;
 static u32 suspend_shlw_ctr_temp, suspend_deep_ctr_temp;
 static u64 suspend_shlw_res_temp, suspend_deep_res_temp;
+#endif
 
 struct telemetry_susp_stats {
 	u32 shlw_swake_ctr;
-- 
1.7.9.5
