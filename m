From: Jonathan Woithe <jwoithe@just42.net>
Subject: [PATCH 3/4][RFC v2] fujitsu-laptop: fujitsu-laptop: autodetect lcd
 interface on unknown models
Date: Tue, 31 Jan 2017 23:39:32 +1030
Message-ID: <20170131130932.GD6218@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:52688 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752119AbdAaNJk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Jan 2017 08:09:40 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kernel@kempniu.pl
Cc: platform-driver-x86@vger.kernel.org

Do lcd autodetection for all models - not just the ones we have DMI
matches for.

Also, if we're running on an unknown model, inform the user that generic
keycodes (KEY5_CODE up to KEY1_CODE) will be used as opposed to specific codes
like KEY_HELP.

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Signed-off-by: Jonathan Woithe <jwoithe@just42.net>
---
 drivers/platform/x86/fujitsu-laptop.c | 50 +++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index c410047..7167223 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -161,6 +161,7 @@ struct fujitsu_laptop {
 	struct acpi_device *dev;
 	struct input_dev *input;
 	char phys[32];
+	const char *dmi_ident;
 	struct platform_device *pf_device;
 	struct kfifo fifo;
 	spinlock_t fifo_lock;
@@ -615,23 +616,9 @@ static struct platform_driver fujitsu_pf_driver = {
 		   }
 };
 
-static void __init dmi_check_cb_common(const struct dmi_system_id *id)
-{
-	pr_info("Identified laptop model '%s'\n", id->ident);
-	if (use_alt_lcd_levels == -1) {
-		if (acpi_has_method(NULL,
-				"\\_SB.PCI0.LPCB.FJEX.SBL2"))
-			use_alt_lcd_levels = 1;
-		else
-			use_alt_lcd_levels = 0;
-		vdbg_printk(FUJLAPTOP_DBG_TRACE, "auto-detected usealt as "
-			"%i\n", use_alt_lcd_levels);
-	}
-}
-
 static int __init dmi_check_cb_s6410(const struct dmi_system_id *id)
 {
-	dmi_check_cb_common(id);
+	fujitsu_laptop->dmi_ident = id->ident;
 	fujitsu_laptop->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
 	fujitsu_laptop->keycode2 = KEY_HELP;		/* "Mobility Center" */
 	return 1;
@@ -639,7 +626,7 @@ static int __init dmi_check_cb_s6410(const struct dmi_system_id *id)
 
 static int __init dmi_check_cb_s6420(const struct dmi_system_id *id)
 {
-	dmi_check_cb_common(id);
+	fujitsu_laptop->dmi_ident = id->ident;
 	fujitsu_laptop->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
 	fujitsu_laptop->keycode2 = KEY_HELP;		/* "Mobility Center" */
 	return 1;
@@ -647,7 +634,7 @@ static int __init dmi_check_cb_s6420(const struct dmi_system_id *id)
 
 static int __init dmi_check_cb_p8010(const struct dmi_system_id *id)
 {
-	dmi_check_cb_common(id);
+	fujitsu_laptop->dmi_ident = id->ident;
 	fujitsu_laptop->keycode1 = KEY_HELP;		/* "Support" */
 	fujitsu_laptop->keycode3 = KEY_SWITCHVIDEOMODE;	/* "Presentation" */
 	fujitsu_laptop->keycode4 = KEY_WWW;		/* "Internet" */
@@ -683,8 +670,8 @@ static const struct dmi_system_id fujitsu_laptop_dmi_table[] __initconst = {
 
 static int acpi_fujitsu_bl_add(struct acpi_device *device)
 {
-	int result = 0;
 	int state = 0;
+	int result = 0;
 	struct input_dev *input;
 	int error;
 
@@ -742,6 +729,16 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 			pr_err("_INI Method failed\n");
 	}
 
+	if (use_alt_lcd_levels == -1) {
+		if (acpi_has_method(NULL,
+				"\\_SB.PCI0.LPCB.FJEX.SBL2"))
+			use_alt_lcd_levels = 1;
+		else
+			use_alt_lcd_levels = 0;
+		vdbg_printk(FUJLAPTOP_DBG_TRACE, "auto-detected usealt as "
+			"%i\n", use_alt_lcd_levels);
+	}
+
 	/* do config (detect defaults) */
 	use_alt_lcd_levels = use_alt_lcd_levels == 1 ? 1 : 0;
 	disable_brightness_adjust = disable_brightness_adjust == 1 ? 1 : 0;
@@ -877,11 +874,18 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
 	device->driver_data = fujitsu_laptop;
 
-	fujitsu_laptop->keycode1 = KEY_PROG1;
-	fujitsu_laptop->keycode2 = KEY_PROG2;
-	fujitsu_laptop->keycode3 = KEY_PROG3;
-	fujitsu_laptop->keycode4 = KEY_PROG4;
-	dmi_check_system(fujitsu_laptop_dmi_table);
+	if (dmi_check_system(fujitsu_laptop_dmi_table)) {
+		pr_info("Identified laptop model '%s'\n", 
+			fujitsu_laptop->dmi_ident);
+	} else {
+		pr_info("fujitsu-laptop: Unknown laptop model"
+			" - using generic keycodes.\n");
+		fujitsu_laptop->keycode1 = KEY1_CODE;
+		fujitsu_laptop->keycode2 = KEY2_CODE;
+		fujitsu_laptop->keycode3 = KEY3_CODE;
+		fujitsu_laptop->keycode4 = KEY4_CODE;
+		fujitsu_laptop->keycode5 = KEY5_CODE;
+	}
 
 	/* kfifo */
 	spin_lock_init(&fujitsu_laptop->fifo_lock);
-- 
2.8.2
