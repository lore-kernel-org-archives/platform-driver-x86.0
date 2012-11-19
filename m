From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 478/493] platform/x86: remove use of __devexit
Date: Mon, 19 Nov 2012 13:27:07 -0500
Message-ID: <1353349642-3677-478-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from viridian.itc.Virginia.EDU ([128.143.12.139]:41508 "EHLO
	viridian.itc.virginia.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754275Ab2KSSfV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Nov 2012 13:35:21 -0500
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: gregkh@linuxfoundation.org
Cc: Matthew Garrett <mjg@redhat.com>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Robert Gerlach <khnz@gmx.de>, Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org

CONFIG_HOTPLUG is going away as an option so __devexit is no
longer needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: Matthew Garrett <mjg@redhat.com> 
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com> 
Cc: Robert Gerlach <khnz@gmx.de> 
Cc: Ike Panhc <ike.pan@canonical.com> 
Cc: platform-driver-x86@vger.kernel.org 
---
 drivers/platform/x86/apple-gmux.c         | 2 +-
 drivers/platform/x86/compal-laptop.c      | 4 ++--
 drivers/platform/x86/fujitsu-tablet.c     | 2 +-
 drivers/platform/x86/ideapad-laptop.c     | 2 +-
 drivers/platform/x86/intel_mid_powerbtn.c | 2 +-
 drivers/platform/x86/intel_oaktrail.c     | 2 +-
 drivers/platform/x86/samsung-q10.c        | 2 +-
 drivers/platform/x86/tc1100-wmi.c         | 2 +-
 drivers/platform/x86/xo1-rfkill.c         | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index d323f3b..3fdb50d 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -577,7 +577,7 @@ err_free:
 	return ret;
 }
 
-static void __devexit gmux_remove(struct pnp_dev *pnp)
+static void gmux_remove(struct pnp_dev *pnp)
 {
 	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
 
diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index b5265f7..06c84ce 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -714,7 +714,7 @@ static struct attribute_group compal_attribute_group = {
 };
 
 static int compal_probe(struct platform_device *);
-static int __devexit compal_remove(struct platform_device *);
+static int compal_remove(struct platform_device *);
 static struct platform_driver compal_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
@@ -1067,7 +1067,7 @@ static void __exit compal_cleanup(void)
 	pr_info("Driver unloaded\n");
 }
 
-static int __devexit compal_remove(struct platform_device *pdev)
+static int compal_remove(struct platform_device *pdev)
 {
 	struct compal_data *data;
 
diff --git a/drivers/platform/x86/fujitsu-tablet.c b/drivers/platform/x86/fujitsu-tablet.c
index 313b8f5..ea5de89 100644
--- a/drivers/platform/x86/fujitsu-tablet.c
+++ b/drivers/platform/x86/fujitsu-tablet.c
@@ -432,7 +432,7 @@ static int acpi_fujitsu_add(struct acpi_device *adev)
 	return 0;
 }
 
-static int __devexit acpi_fujitsu_remove(struct acpi_device *adev, int type)
+static int acpi_fujitsu_remove(struct acpi_device *adev, int type)
 {
 	free_irq(fujitsu.irq, fujitsu_interrupt);
 	release_region(fujitsu.io_base, fujitsu.io_length);
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index d49d8fc..f6891ff 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -835,7 +835,7 @@ platform_failed:
 	return ret;
 }
 
-static int __devexit ideapad_acpi_remove(struct acpi_device *adevice, int type)
+static int ideapad_acpi_remove(struct acpi_device *adevice, int type)
 {
 	struct ideapad_private *priv = dev_get_drvdata(&adevice->dev);
 	int i;
diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index eac6618..f59683a 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -121,7 +121,7 @@ err_free_input:
 	return error;
 }
 
-static int __devexit mfld_pb_remove(struct platform_device *pdev)
+static int mfld_pb_remove(struct platform_device *pdev)
 {
 	struct input_dev *input = platform_get_drvdata(pdev);
 	int irq = platform_get_irq(pdev, 0);
diff --git a/drivers/platform/x86/intel_oaktrail.c b/drivers/platform/x86/intel_oaktrail.c
index fadddb4..817b2d2 100644
--- a/drivers/platform/x86/intel_oaktrail.c
+++ b/drivers/platform/x86/intel_oaktrail.c
@@ -283,7 +283,7 @@ static int oaktrail_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __devexit oaktrail_remove(struct platform_device *pdev)
+static int oaktrail_remove(struct platform_device *pdev)
 {
 	return 0;
 }
diff --git a/drivers/platform/x86/samsung-q10.c b/drivers/platform/x86/samsung-q10.c
index af622c7..5f77005 100644
--- a/drivers/platform/x86/samsung-q10.c
+++ b/drivers/platform/x86/samsung-q10.c
@@ -99,7 +99,7 @@ static int samsungq10_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __devexit samsungq10_remove(struct platform_device *pdev)
+static int samsungq10_remove(struct platform_device *pdev)
 {
 
 	struct backlight_device *bd = platform_get_drvdata(pdev);
diff --git a/drivers/platform/x86/tc1100-wmi.c b/drivers/platform/x86/tc1100-wmi.c
index 328383f..9b93fdb 100644
--- a/drivers/platform/x86/tc1100-wmi.c
+++ b/drivers/platform/x86/tc1100-wmi.c
@@ -187,7 +187,7 @@ static int __init tc1100_probe(struct platform_device *device)
 }
 
 
-static int __devexit tc1100_remove(struct platform_device *device)
+static int tc1100_remove(struct platform_device *device)
 {
 	sysfs_remove_group(&device->dev.kobj, &tc1100_attribute_group);
 
diff --git a/drivers/platform/x86/xo1-rfkill.c b/drivers/platform/x86/xo1-rfkill.c
index a3e97d6..4bd1724 100644
--- a/drivers/platform/x86/xo1-rfkill.c
+++ b/drivers/platform/x86/xo1-rfkill.c
@@ -60,7 +60,7 @@ static int xo1_rfkill_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __devexit xo1_rfkill_remove(struct platform_device *pdev)
+static int xo1_rfkill_remove(struct platform_device *pdev)
 {
 	struct rfkill *rfk = platform_get_drvdata(pdev);
 	rfkill_unregister(rfk);
-- 
1.8.0
