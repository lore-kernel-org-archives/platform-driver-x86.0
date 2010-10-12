From: minskey guo <chaohong.guo@linux.intel.com>
Subject: [PATCH 3/4 RESEND] [intel_ips] Release symbol on error-handling path of ips_get_i915_syms()
Date: Tue, 12 Oct 2010 14:41:31 +0800
Message-ID: <1286865691-22980-1-git-send-email-chaohong.guo@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:34510 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752823Ab0JLGqn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Oct 2010 02:46:43 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jbarnes@virtuousgeek.org, mjg@redhat.com
Cc: chaohong.guo@intel.com, minskey guo <chaohong.guo@linux.intel.com>

In ips_get_i915_syms(), the symbol i915_gpu_busy() is not released
when error occurs.

Signed-off-by: minskey guo <chaohong.guo@intel.com>
Acked-by: Jesse Barnes <jbarnes@virtuousgeek.org>
---
 drivers/platform/x86/intel_ips.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 3c7b25c..71dcc41 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1390,7 +1390,7 @@ static bool ips_get_i915_syms(struct ips_driver *ips)
 	return true;
 
 out_put_busy:
-	symbol_put(i915_gpu_turbo_disable);
+	symbol_put(i915_gpu_busy);
 out_put_lower:
 	symbol_put(i915_gpu_lower);
 out_put_raise:
-- 
1.7.1
