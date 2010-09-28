From: Tim Gardner <tim.gardner@canonical.com>
Subject: [PATCH] intel_ips: Print MCP limit exceeded values.
Date: Tue, 28 Sep 2010 14:58:15 -0600
Message-ID: <1285707495-17407-1-git-send-email-tim.gardner@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.tpi.com ([70.99.223.143]:1950 "EHLO mail.tpi.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754015Ab0I1VYb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Sep 2010 17:24:31 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Tim Gardner <tim.gardner@canonical.com>, Matthew Garrett <mjg@redhat.com>

Print some interesting values when MCP limits
are exceeded.

Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>
---
 drivers/platform/x86/intel_ips.c |   24 ++++++++++++++++++------
 1 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 308c7f5..367cd03 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -600,17 +600,29 @@ static bool mcp_exceeded(struct ips_driver *ips)
 {
 	unsigned long flags;
 	bool ret = false;
+	u32 temp_limit;
+	u32 avg_power;
+	const char *msg = "MCP limit exceeded: ";
 
 	spin_lock_irqsave(&ips->turbo_status_lock, flags);
-	if (ips->mcp_avg_temp > (ips->mcp_temp_limit * 100))
-		ret = true;
-	if (ips->cpu_avg_power + ips->mch_avg_power > ips->mcp_power_limit)
+
+	temp_limit = ips->mcp_temp_limit * 100;
+	if (ips->mcp_avg_temp > temp_limit) {
+		dev_info(&ips->dev->dev,
+			"%sAvg temp %u, limit %u\n", msg, ips->mcp_avg_temp,
+			temp_limit);
 		ret = true;
-	spin_unlock_irqrestore(&ips->turbo_status_lock, flags);
+	}
 
-	if (ret)
+	avg_power = ips->cpu_avg_power + ips->mch_avg_power;
+	if (avg_power > ips->mcp_power_limit) {
 		dev_info(&ips->dev->dev,
-			 "MCP power or thermal limit exceeded\n");
+			"%sAvg power %u, limit %u\n", msg, avg_power,
+			ips->mcp_power_limit);
+		ret = true;
+	}
+
+	spin_unlock_irqrestore(&ips->turbo_status_lock, flags);
 
 	return ret;
 }
-- 
1.7.0.4
