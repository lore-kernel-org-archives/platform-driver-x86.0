From: Dan Carpenter <error27@gmail.com>
Subject: [patch] intel_ips: potential null dereference
Date: Sun, 8 Aug 2010 00:01:12 +0200
Message-ID: <20100807215703.GA9031@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:34167 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761959Ab0HGWBh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 7 Aug 2010 18:01:37 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Jiri Slaby <jslaby@suse.cz>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a potential NULL dereference of "limits."  We can just return
NULL earlier to avoid it.  The caller already handles NULL returns.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index afe82e5..c908048 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1342,8 +1342,10 @@ static struct ips_mcp_limits *ips_detect_cpu(struct ips_driver *ips)
 		limits = &ips_lv_limits;
 	else if (strstr(boot_cpu_data.x86_model_id, "CPU       U"))
 		limits = &ips_ulv_limits;
-	else
+	else {
 		dev_info(&ips->dev->dev, "No CPUID match found.\n");
+		goto out;
+	}
 
 	rdmsrl(TURBO_POWER_CURRENT_LIMIT, turbo_power);
 	tdp = turbo_power & TURBO_TDP_MASK;
