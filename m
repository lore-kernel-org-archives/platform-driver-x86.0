From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 3/3 v3] asus-nb-wmi: move WAPF variable into quirks_entry
Date: Mon, 19 Mar 2012 14:33:43 +0800
Message-ID: <1332138824-9673-3-git-send-email-acelan.kao@canonical.com>
References: <1332138824-9673-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:49704 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756449Ab2CSGeA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 02:34:00 -0400
Received: by mail-pz0-f46.google.com with SMTP id r28so9469645daj.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Mar 2012 23:34:00 -0700 (PDT)
In-Reply-To: <1332138824-9673-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

Some models work better with different values of wapf, so move the
variable into quriks_entry to make it more easy to give a specific
value to different models.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-nb-wmi.c |    2 +-
 drivers/platform/x86/asus-wmi.c    |    4 ++--
 drivers/platform/x86/asus-wmi.h    |    2 +-
 drivers/platform/x86/eeepc-wmi.c   |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 396dafc..9dd7b93 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -53,7 +53,7 @@ MODULE_PARM_DESC(wapf, "WAPF value");
 
 static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
 {
-	driver->wapf = wapf;
+	driver->quirks->wapf = wapf;
 }
 
 static const struct key_entry asus_nb_wmi_keymap[] = {
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 9cd459a..1d2047d 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1471,9 +1471,9 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 
 	/* CWAP allow to define the behavior of the Fn+F2 key,
 	 * this method doesn't seems to be present on Eee PCs */
-	if (asus->driver->wapf >= 0)
+	if (asus->driver->quirks->wapf >= 0)
 		asus_wmi_set_devstate(ASUS_WMI_DEVID_CWAP,
-				      asus->driver->wapf, NULL);
+				      asus->driver->quirks->wapf, NULL);
 
 	return asus_wmi_sysfs_init(asus->platform_device);
 }
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 35003e4..d43b667 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -39,10 +39,10 @@ struct quirk_entry {
 	bool hotplug_wireless;
 	bool scalar_panel_brightness;
 	bool store_backlight_power;
+	int wapf;
 };
 
 struct asus_wmi_driver {
-	int			wapf;
 	int			brightness;
 	int			panel_power;
 
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index c1a0ac0..7e15d54 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -207,10 +207,10 @@ static int eeepc_wmi_probe(struct platform_device *pdev)
 static void eeepc_wmi_quirks(struct asus_wmi_driver *driver)
 {
 	quirks = driver->quirks;
-	driver->wapf = -1;
 	driver->panel_power = FB_BLANK_UNBLANK;
 	driver->quirks = &quirk_asus_unknown;
 	driver->quirks->hotplug_wireless = hotplug_wireless;
+	driver->quirks->wapf = -1;
 	dmi_check_system(asus_quirks);
 }
 
-- 
1.7.9.1
