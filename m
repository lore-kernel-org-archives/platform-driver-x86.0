From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: [PATCH 1/2] IPS driver: apply BIOS provided CPU limit if different from default
Date: Tue,  5 Oct 2010 11:26:22 -0700
Message-ID: <1286303183-26744-1-git-send-email-jbarnes@virtuousgeek.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy3-pub.bluehost.com ([67.222.54.6]:60075 "HELO
	cpoproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752703Ab0JESZW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Oct 2010 14:25:22 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: mjg@redhat.com, Jesse Barnes <jbarnes@virtuousgeek.org>

The BIOS may hand us a lower CPU power limit than the default for a
given SKU.  We should use it in case the platform isn't designed to
dissapate the full TDP of a given part.

Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
---
 drivers/platform/x86/intel_ips.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index c402cc4..f7924c5 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1377,9 +1377,10 @@ static struct ips_mcp_limits *ips_detect_cpu(struct ips_driver *ips)
 	tdp = turbo_power & TURBO_TDP_MASK;
 
 	/* Sanity check TDP against CPU */
-	if (limits->mcp_power_limit != (tdp / 8) * 1000) {
-		dev_warn(&ips->dev->dev, "Warning: CPU TDP doesn't match expected value (found %d, expected %d)\n",
-			 tdp / 8, limits->mcp_power_limit / 1000);
+	if (limits->core_power_limit != (tdp / 8) * 1000) {
+		dev_info(&ips->dev->dev, "CPU TDP doesn't match expected value (found %d, expected %d)\n",
+			 tdp / 8, limits->core_power_limit / 1000);
+		limits->core_power_limit = (tdp / 8) * 1000;
 	}
 
 out:
-- 
1.7.2.1
