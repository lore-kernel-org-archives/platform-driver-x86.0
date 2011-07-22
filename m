From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: [PATCH] x86 driver: fix typo in TDP override enabling
Date: Fri, 22 Jul 2011 09:21:36 -0700
Message-ID: <1311351696-16003-1-git-send-email-jbarnes@virtuousgeek.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from oproxy4-pub.bluehost.com ([69.89.21.11]:58820 "HELO
	oproxy4-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752119Ab1GVQVn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Jul 2011 12:21:43 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: mjg@redhat.com, Jesse Barnes <jbarnes@virtuousgeek.org>

When enabling turbo, we need to set both the TDC and TDP bits.  IIRC
only the TDC one actually matters, but fix it up anyway since the
current code is confusing.

Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
---
 drivers/platform/x86/intel_ips.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 5ffe7c3..809a3ae 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -403,7 +403,7 @@ static void ips_cpu_raise(struct ips_driver *ips)
 
 	thm_writew(THM_MPCPC, (new_tdp_limit * 10) / 8);
 
-	turbo_override |= TURBO_TDC_OVR_EN | TURBO_TDC_OVR_EN;
+	turbo_override |= TURBO_TDC_OVR_EN | TURBO_TDP_OVR_EN;
 	wrmsrl(TURBO_POWER_CURRENT_LIMIT, turbo_override);
 
 	turbo_override &= ~TURBO_TDP_MASK;
@@ -438,7 +438,7 @@ static void ips_cpu_lower(struct ips_driver *ips)
 
 	thm_writew(THM_MPCPC, (new_limit * 10) / 8);
 
-	turbo_override |= TURBO_TDC_OVR_EN | TURBO_TDC_OVR_EN;
+	turbo_override |= TURBO_TDC_OVR_EN | TURBO_TDP_OVR_EN;
 	wrmsrl(TURBO_POWER_CURRENT_LIMIT, turbo_override);
 
 	turbo_override &= ~TURBO_TDP_MASK;
-- 
1.7.1
