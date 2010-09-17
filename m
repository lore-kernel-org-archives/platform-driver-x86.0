From: minskey guo <chaohong.guo@linux.intel.com>
Subject: [PATCH 2/4] [intel_ips] old_cpu_power is wrongly divided by 65535 in ips_monitor()
Date: Fri, 17 Sep 2010 14:03:01 +0800
Message-ID: <1284703381-7724-1-git-send-email-chaohong.guo@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:58128 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752936Ab0IQGGs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 17 Sep 2010 02:06:48 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jbarnes@virtuousgeek.org, mjg@redhat.com
Cc: chaohong.guo@intel.com, minskey guo <chaohong.guo@linux.intel.com>

The variable old_cpu_power is used to save the value of THM_CEC
register. In get_cpu_power(), it will be divided by 65535.

Signed-off-by: minskey guo <chaohong.guo@intel.com>
Acked-by: Jesse Barnes <jbarnes@virtuousgeek.org>
---
 drivers/platform/x86/intel_ips.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index fb31700..3c7b25c 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -948,7 +948,7 @@ static int ips_monitor(void *data)
 		ITV_ME_SEQNO_SHIFT;
 	seqno_timestamp = get_jiffies_64();
 
-	old_cpu_power = thm_readl(THM_CEC) / 65535;
+	old_cpu_power = thm_readl(THM_CEC);
 	schedule_timeout_interruptible(msecs_to_jiffies(IPS_SAMPLE_PERIOD));
 
 	/* Collect an initial average */
-- 
1.7.1
