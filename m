From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: [PATCH 1/2] IPS driver: don't toggle CPU turbo on unsupported CPUs
Date: Thu, 23 Sep 2010 23:49:28 +0200
Message-ID: <1285278569-4368-1-git-send-email-jbarnes@virtuousgeek.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy3-pub.bluehost.com ([67.222.54.6]:45296 "HELO
	cpoproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752350Ab0IWVte (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Sep 2010 17:49:34 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: mjg59@redhat.com, Jesse Barnes <jbarnes@virtuousgeek.org>

If the CPU doesn't support turbo, don't try to enable/disable it.

Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
---
 drivers/platform/x86/intel_ips.c |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index bfa9c72..71d04ef 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -51,7 +51,6 @@
  * TODO:
  *   - handle CPU hotplug
  *   - provide turbo enable/disable api
- *   - make sure we can write turbo enable/disable reg based on MISC_EN
  *
  * Related documents:
  *   - CDI 403777, 403778 - Auburndale EDS vol 1 & 2
@@ -325,6 +324,7 @@ struct ips_driver {
 	bool gpu_preferred;
 	bool poll_turbo_status;
 	bool second_cpu;
+	bool turbo_toggle_allowed;
 	struct ips_mcp_limits *limits;
 
 	/* Optional MCH interfaces for if i915 is in use */
@@ -461,7 +461,8 @@ static void ips_enable_cpu_turbo(struct ips_driver *ips)
 	if (ips->__cpu_turbo_on)
 		return;
 
-	on_each_cpu(do_enable_cpu_turbo, ips, 1);
+	if (ips->turbo_toggle_allowed)
+		on_each_cpu(do_enable_cpu_turbo, ips, 1);
 
 	ips->__cpu_turbo_on = true;
 }
@@ -498,7 +499,8 @@ static void ips_disable_cpu_turbo(struct ips_driver *ips)
 	if (!ips->__cpu_turbo_on)
 		return;
 
-	on_each_cpu(do_disable_cpu_turbo, ips, 1);
+	if (ips->turbo_toggle_allowed)
+		on_each_cpu(do_disable_cpu_turbo, ips, 1);
 
 	ips->__cpu_turbo_on = false;
 }
@@ -1332,8 +1334,10 @@ static struct ips_mcp_limits *ips_detect_cpu(struct ips_driver *ips)
 	 * turbo manually or we'll get an illegal MSR access, even though
 	 * turbo will still be available.
 	 */
-	if (!(misc_en & IA32_MISC_TURBO_EN))
-		; /* add turbo MSR write allowed flag if necessary */
+	if (misc_en & IA32_MISC_TURBO_EN)
+		ips->turbo_toggle_allowed = true;
+	else
+		ips->turbo_toggle_allowed = false;
 
 	if (strstr(boot_cpu_data.x86_model_id, "CPU       M"))
 		limits = &ips_sv_limits;
-- 
1.7.2.3
