From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 090/493] platform/x86: remove use of __devexit_p
Date: Mon, 19 Nov 2012 13:20:39 -0500
Message-ID: <1353349642-3677-90-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from viridian.itc.Virginia.EDU ([128.143.12.139]:41652 "EHLO
	viridian.itc.virginia.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754544Ab2KSSiQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Nov 2012 13:38:16 -0500
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: gregkh@linuxfoundation.org
Cc: Matthew Garrett <mjg@redhat.com>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, platform-driver-x86@vger.kernel.org

CONFIG_HOTPLUG is going away as an option so __devexit_p is no longer
needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: Matthew Garrett <mjg@redhat.com> 
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com> 
Cc: platform-driver-x86@vger.kernel.org 
---
 drivers/platform/x86/apple-gmux.c         | 2 +-
 drivers/platform/x86/compal-laptop.c      | 2 +-
 drivers/platform/x86/intel_mid_powerbtn.c | 2 +-
 drivers/platform/x86/intel_mid_thermal.c  | 2 +-
 drivers/platform/x86/intel_oaktrail.c     | 2 +-
 drivers/platform/x86/samsung-q10.c        | 2 +-
 drivers/platform/x86/tc1100-wmi.c         | 2 +-
 drivers/platform/x86/xo1-rfkill.c         | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index db8f638..265d1ab 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -609,7 +609,7 @@ static const struct pnp_device_id gmux_device_ids[] = {
 static struct pnp_driver gmux_pnp_driver = {
 	.name		= "apple-gmux",
 	.probe		= gmux_probe,
-	.remove		= __devexit_p(gmux_remove),
+	.remove		= gmux_remove,
 	.id_table	= gmux_device_ids,
 	.suspend	= gmux_suspend,
 	.resume		= gmux_resume
diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 1887e2f..a01a67d 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -721,7 +721,7 @@ static struct platform_driver compal_driver = {
 		.owner = THIS_MODULE,
 	},
 	.probe	= compal_probe,
-	.remove	= __devexit_p(compal_remove)
+	.remove	= compal_remove
 };
 
 static enum power_supply_property compal_bat_properties[] = {
diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index bcbad84..367f439 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -139,7 +139,7 @@ static struct platform_driver mfld_pb_driver = {
 		.owner = THIS_MODULE,
 	},
 	.probe	= mfld_pb_probe,
-	.remove	= __devexit_p(mfld_pb_remove),
+	.remove	= mfld_pb_remove,
 };
 
 module_platform_driver(mfld_pb_driver);
diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
index 93de090..81c491e 100644
--- a/drivers/platform/x86/intel_mid_thermal.c
+++ b/drivers/platform/x86/intel_mid_thermal.c
@@ -563,7 +563,7 @@ static struct platform_driver mid_thermal_driver = {
 		.pm = &mid_thermal_pm,
 	},
 	.probe = mid_thermal_probe,
-	.remove = __devexit_p(mid_thermal_remove),
+	.remove = mid_thermal_remove,
 	.id_table = therm_id_table,
 };
 
diff --git a/drivers/platform/x86/intel_oaktrail.c b/drivers/platform/x86/intel_oaktrail.c
index 79a0c2f..0dd625e 100644
--- a/drivers/platform/x86/intel_oaktrail.c
+++ b/drivers/platform/x86/intel_oaktrail.c
@@ -294,7 +294,7 @@ static struct platform_driver oaktrail_driver = {
 		.owner = THIS_MODULE,
 	},
 	.probe	= oaktrail_probe,
-	.remove	= __devexit_p(oaktrail_remove)
+	.remove	= oaktrail_remove
 };
 
 static int dmi_check_cb(const struct dmi_system_id *id)
diff --git a/drivers/platform/x86/samsung-q10.c b/drivers/platform/x86/samsung-q10.c
index 1e54ae7..132994d 100644
--- a/drivers/platform/x86/samsung-q10.c
+++ b/drivers/platform/x86/samsung-q10.c
@@ -119,7 +119,7 @@ static struct platform_driver samsungq10_driver = {
 		.pm	= &samsungq10_pm_ops,
 	},
 	.probe		= samsungq10_probe,
-	.remove		= __devexit_p(samsungq10_remove),
+	.remove		= samsungq10_remove,
 };
 
 static struct platform_device *samsungq10_device;
diff --git a/drivers/platform/x86/tc1100-wmi.c b/drivers/platform/x86/tc1100-wmi.c
index e24f5ae..328383f 100644
--- a/drivers/platform/x86/tc1100-wmi.c
+++ b/drivers/platform/x86/tc1100-wmi.c
@@ -241,7 +241,7 @@ static struct platform_driver tc1100_driver = {
 		.pm = &tc1100_pm_ops,
 #endif
 	},
-	.remove = __devexit_p(tc1100_remove),
+	.remove = tc1100_remove,
 };
 
 static int __init tc1100_init(void)
diff --git a/drivers/platform/x86/xo1-rfkill.c b/drivers/platform/x86/xo1-rfkill.c
index 1da13ed..39f4090 100644
--- a/drivers/platform/x86/xo1-rfkill.c
+++ b/drivers/platform/x86/xo1-rfkill.c
@@ -74,7 +74,7 @@ static struct platform_driver xo1_rfkill_driver = {
 		.owner = THIS_MODULE,
 	},
 	.probe		= xo1_rfkill_probe,
-	.remove		= __devexit_p(xo1_rfkill_remove),
+	.remove		= xo1_rfkill_remove,
 };
 
 module_platform_driver(xo1_rfkill_driver);
-- 
1.8.0
