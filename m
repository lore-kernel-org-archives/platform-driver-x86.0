From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: [PATCH 2/2] IPS driver: verify BIOS provided limits
Date: Thu, 23 Sep 2010 23:49:29 +0200
Message-ID: <1285278569-4368-2-git-send-email-jbarnes@virtuousgeek.org>
References: <1285278569-4368-1-git-send-email-jbarnes@virtuousgeek.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy1-pub.bluehost.com ([69.89.21.11]:52878 "HELO
	cpoproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752461Ab0IWVtf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Sep 2010 17:49:35 -0400
In-Reply-To: <1285278569-4368-1-git-send-email-jbarnes@virtuousgeek.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: mjg59@redhat.com, Jesse Barnes <jbarnes@virtuousgeek.org>

They're optional.  If not present or sane, we should use the CPU
defaults.

Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
---
 drivers/platform/x86/intel_ips.c |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 71d04ef..c402cc4 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -665,6 +665,27 @@ static bool mch_exceeded(struct ips_driver *ips)
 }
 
 /**
+ * verify_limits - verify BIOS provided limits
+ * @ips: IPS structure
+ *
+ * BIOS can optionally provide non-default limits for power and temp.  Check
+ * them here and use the defaults if the BIOS values are not provided or
+ * are otherwise unusable.
+ */
+static void verify_limits(struct ips_driver *ips)
+{
+	if (ips->mcp_power_limit < ips->limits->mcp_power_limit ||
+	    ips->mcp_power_limit > 35000)
+		ips->mcp_power_limit = ips->limits->mcp_power_limit;
+
+	if (ips->mcp_temp_limit < ips->limits->core_temp_limit ||
+	    ips->mcp_temp_limit < ips->limits->mch_temp_limit ||
+	    ips->mcp_temp_limit > 150)
+		ips->mcp_temp_limit = min(ips->limits->core_temp_limit,
+					  ips->limits->mch_temp_limit);
+}
+
+/**
  * update_turbo_limits - get various limits & settings from regs
  * @ips: IPS driver struct
  *
@@ -688,6 +709,7 @@ static void update_turbo_limits(struct ips_driver *ips)
 	ips->mcp_temp_limit = thm_readw(THM_PTL);
 	ips->mcp_power_limit = thm_readw(THM_MPPC);
 
+	verify_limits(ips);
 	/* Ignore BIOS CPU vs GPU pref */
 }
 
@@ -1156,6 +1178,7 @@ static irqreturn_t ips_irq_handler(int irq, void *arg)
 				STS_PTL_SHIFT;
 			ips->mcp_power_limit = (tc1 & STS_PPL_MASK) >>
 				STS_PPL_SHIFT;
+			verify_limits(ips);
 			spin_unlock(&ips->turbo_status_lock);
 
 			thm_writeb(THM_SEC, SEC_ACK);
-- 
1.7.2.3
