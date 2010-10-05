From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: [PATCH 2/2] IPS driver: disable CPU turbo
Date: Tue,  5 Oct 2010 11:26:23 -0700
Message-ID: <1286303183-26744-2-git-send-email-jbarnes@virtuousgeek.org>
References: <1286303183-26744-1-git-send-email-jbarnes@virtuousgeek.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy2-pub.bluehost.com ([67.222.39.38]:41592 "HELO
	cpoproxy2-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752703Ab0JESZY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Oct 2010 14:25:24 -0400
In-Reply-To: <1286303183-26744-1-git-send-email-jbarnes@virtuousgeek.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: mjg@redhat.com, Jesse Barnes <jbarnes@virtuousgeek.org>

The undocumented interface we're using for reading CPU power seems to be
overreporting power.  Until we figure out how to correct it, disable CPU
turbo and power reporting to be safe.  This will keep the CPU within default
limits and still allow us to increase GPU frequency as needed.

Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
---
 drivers/platform/x86/intel_ips.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index f7924c5..af4d2c7 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -703,6 +703,7 @@ static void update_turbo_limits(struct ips_driver *ips)
 	u32 hts = thm_readl(THM_HTS);
 
 	ips->cpu_turbo_enabled = !(hts & HTS_PCTD_DIS);
+	ips->cpu_turbo_enabled = false;
 	ips->gpu_turbo_enabled = !(hts & HTS_GTD_DIS);
 	ips->core_power_limit = thm_readw(THM_MPCPC);
 	ips->mch_power_limit = thm_readw(THM_MMGPC);
@@ -882,7 +883,7 @@ static u32 get_cpu_power(struct ips_driver *ips, u32 *last, int period)
 	ret = (ret * 1000) / 65535;
 	*last = val;
 
-	return ret;
+	return 0;
 }
 
 static const u16 temp_decay_factor = 2;
@@ -1173,6 +1174,7 @@ static irqreturn_t ips_irq_handler(int irq, void *arg)
 				STS_GPL_SHIFT;
 			/* ignore EC CPU vs GPU pref */
 			ips->cpu_turbo_enabled = !(sts & STS_PCTD_DIS);
+			ips->cpu_turbo_enabled = false;
 			ips->gpu_turbo_enabled = !(sts & STS_GTD_DIS);
 			ips->mcp_temp_limit = (sts & STS_PTL_MASK) >>
 				STS_PTL_SHIFT;
@@ -1559,8 +1561,8 @@ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* Save turbo limits & ratios */
 	rdmsrl(TURBO_POWER_CURRENT_LIMIT, ips->orig_turbo_limit);
 
-	ips_enable_cpu_turbo(ips);
-	ips->cpu_turbo_enabled = true;
+	ips_disable_cpu_turbo(ips);
+	ips->cpu_turbo_enabled = false;
 
 	/* Create thermal adjust thread */
 	ips->adjust = kthread_create(ips_adjust, ips, "ips-adjust");
-- 
1.7.2.1
