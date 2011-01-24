From: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 08/14] eeepc-wmi: switch to
	platform_create_bundle()
Date: Mon, 24 Jan 2011 17:23:52 +0100
Message-ID: <1295886238-15961-9-git-send-email-corentincj@iksaif.net>
References: <1295886238-15961-1-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1295886238-15961-1-git-send-email-corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Bagwell <chris-ZCD0YumhXB+iMFqZbmIluw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

This allow to remove ~30 lines of code.

Signed-off-by: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
---
 drivers/platform/x86/eeepc-wmi.c |   75 +++++++++++---------------------------
 1 files changed, 22 insertions(+), 53 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 583ba78..1fc191b 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -144,9 +144,6 @@ struct eeepc_wmi {
 	struct eeepc_wmi_debug debug;
 };
 
-/* Only used in eeepc_wmi_init() and eeepc_wmi_exit() */
-static struct platform_device *platform_device;
-
 static int eeepc_wmi_input_init(struct eeepc_wmi *eeepc)
 {
 	int err;
@@ -932,33 +929,12 @@ static int eeepc_wmi_sysfs_init(struct platform_device *device)
  */
 static int __init eeepc_wmi_platform_init(struct eeepc_wmi *eeepc)
 {
-	int err;
-
-	eeepc->platform_device = platform_device_alloc(EEEPC_WMI_FILE, -1);
-	if (!eeepc->platform_device)
-		return -ENOMEM;
-	platform_set_drvdata(eeepc->platform_device, eeepc);
-
-	err = platform_device_add(eeepc->platform_device);
-	if (err)
-		goto fail_platform_device;
-
-	err = eeepc_wmi_sysfs_init(eeepc->platform_device);
-	if (err)
-		goto fail_sysfs;
-	return 0;
-
-fail_sysfs:
-	platform_device_del(eeepc->platform_device);
-fail_platform_device:
-	platform_device_put(eeepc->platform_device);
-	return err;
+	return eeepc_wmi_sysfs_init(eeepc->platform_device);
 }
 
 static void eeepc_wmi_platform_exit(struct eeepc_wmi *eeepc)
 {
 	eeepc_wmi_sysfs_exit(eeepc->platform_device);
-	platform_device_unregister(eeepc->platform_device);
 }
 
 /*
@@ -1094,7 +1070,7 @@ static void eeepc_dmi_check(struct eeepc_wmi *eeepc)
 	}
 }
 
-static struct platform_device * __init eeepc_wmi_add(void)
+static int __init eeepc_wmi_add(struct platform_device *pdev)
 {
 	struct eeepc_wmi *eeepc;
 	acpi_status status;
@@ -1102,15 +1078,14 @@ static struct platform_device * __init eeepc_wmi_add(void)
 
 	eeepc = kzalloc(sizeof(struct eeepc_wmi), GFP_KERNEL);
 	if (!eeepc)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
+
+	eeepc->platform_device = pdev;
+	platform_set_drvdata(eeepc->platform_device, eeepc);
 
 	eeepc->hotplug_wireless = hotplug_wireless;
 	eeepc_dmi_check(eeepc);
 
-	/*
-	 * Register the platform device first.  It is used as a parent for the
-	 * sub-devices below.
-	 */
 	err = eeepc_wmi_platform_init(eeepc);
 	if (err)
 		goto fail_platform;
@@ -1147,7 +1122,7 @@ static struct platform_device * __init eeepc_wmi_add(void)
 	if (err)
 		goto fail_debugfs;
 
-	return eeepc->platform_device;
+	return 0;
 
 fail_debugfs:
 	wmi_remove_notify_handler(EEEPC_WMI_EVENT_GUID);
@@ -1163,10 +1138,10 @@ fail_input:
 	eeepc_wmi_platform_exit(eeepc);
 fail_platform:
 	kfree(eeepc);
-	return ERR_PTR(err);
+	return err;
 }
 
-static int eeepc_wmi_remove(struct platform_device *device)
+static int __exit eeepc_wmi_remove(struct platform_device *device)
 {
 	struct eeepc_wmi *eeepc;
 
@@ -1232,6 +1207,7 @@ static const struct dev_pm_ops eeepc_pm_ops = {
 };
 
 static struct platform_driver platform_driver = {
+	.remove = __exit_p(eeepc_wmi_remove),
 	.driver = {
 		.name = EEEPC_WMI_FILE,
 		.owner = THIS_MODULE,
@@ -1260,10 +1236,8 @@ static int __init eeepc_wmi_check_atkd(void)
 	return -1;
 }
 
-static int __init eeepc_wmi_init(void)
+static int __init eeepc_wmi_probe(struct platform_device *pdev)
 {
-	int err;
-
 	if (!wmi_has_guid(EEEPC_WMI_EVENT_GUID) ||
 	    !wmi_has_guid(EEEPC_WMI_MGMT_GUID)) {
 		pr_warning("No known WMI GUID found\n");
@@ -1280,29 +1254,24 @@ static int __init eeepc_wmi_init(void)
 		return -ENODEV;
 	}
 
-	platform_device = eeepc_wmi_add();
-	if (IS_ERR(platform_device)) {
-		err = PTR_ERR(platform_device);
-		goto fail_eeepc_wmi;
-	}
+	return eeepc_wmi_add(pdev);
+}
 
-	err = platform_driver_register(&platform_driver);
-	if (err) {
-		pr_warning("Unable to register platform driver\n");
-		goto fail_platform_driver;
-	}
+static struct platform_device *platform_device;
 
+static int __init eeepc_wmi_init(void)
+{
+	platform_device = platform_create_bundle(&platform_driver,
+						 eeepc_wmi_probe,
+						 NULL, 0, NULL, 0);
+	if (IS_ERR(platform_device))
+		return PTR_ERR(platform_device);
 	return 0;
-
-fail_platform_driver:
-	eeepc_wmi_remove(platform_device);
-fail_eeepc_wmi:
-	return err;
 }
 
 static void __exit eeepc_wmi_exit(void)
 {
-	eeepc_wmi_remove(platform_device);
+	platform_device_unregister(platform_device);
 	platform_driver_unregister(&platform_driver);
 }
 
-- 
1.7.3.4


------------------------------------------------------------------------------
Special Offer-- Download ArcSight Logger for FREE (a $49 USD value)!
Finally, a world-class log management solution at an even better price-free!
Download using promo code Free_Logger_4_Dev2Dev. Offer expires 
February 28th, so secure your free ArcSight Logger TODAY! 
http://p.sf.net/sfu/arcsight-sfd2d
