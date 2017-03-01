From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 2/4] platform/x86: fujitsu-laptop: do not use call_fext_func() for LCD blanking
Date: Wed,  1 Mar 2017 09:10:42 +0100
Message-ID: <20170301081044.12141-3-kernel@kempniu.pl>
References: <20170301081044.12141-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33839 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750993AbdCAIMN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2017 03:12:13 -0500
Received: by mail-lf0-f68.google.com with SMTP id y193so1456683lfd.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2017 00:10:51 -0800 (PST)
In-Reply-To: <20170301081044.12141-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

fujitsu-laptop registers two ACPI drivers: one for ACPI device FUJ02B1
enabling backlight control and another for ACPI device FUJ02E3 which
handles various other stuff (hotkeys, LEDs, etc.)  Sadly, one of the
functions exposed by call_fext_func() (i.e. through FUJ02E3) allows
probing and controlling LCD blanking (which is a backlight-related
feature that should logically be handled by FUJ02B1) and thus entangles
these two ACPI drivers, which is ugly.

Reverse engineering the DSDT table of a Lifebook S7020 shows that
current LCD blanking state can be:

  - read from ACPI variable BLCT (0: LCD on, 1: LCD off),
  - set using ACPI method SBLC belonging to ACPI device FUJ02E3.

Based on this information, reimplement LCD blanking without using
call_fext_func():

  - read backlight power from BLCT in fujitsu_backlight_register(),
  - grab a handle to SBLC in fujitsu_backlight_register() and then use
    it for setting backlight power in bl_update_status().

Apart from untangling the two ACPI drivers, this also prevents bogus
"Unable to adjust backlight power" messages from appearing on machines
which do not support LCD blanking through FUJ02E3.

Finally, this change eliminates the need to define and use
FUNC_BACKLIGHT, so remove it.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
Jonathan, this *really* needs testing on relevant hardware.  After
applying this patch, you should be able to turn LCD backlight on and off
using /sys/class/backlight/fujitsu-laptop/bl_power.  Also, the value
returned by that attribute upon read should be in sync with actual
backlight state even right after loading the module (i.e. before writing
anything to bl_power).  Please let me know if any of the above is not
true and the module works correctly without this patch applied.

 drivers/platform/x86/fujitsu-laptop.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 185c929898d9..afcc451e21f6 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -92,7 +92,6 @@
 #define FUNC_FLAGS	0x1000
 #define FUNC_LEDS	0x1001
 #define FUNC_BUTTONS	0x1002
-#define FUNC_BACKLIGHT  0x1004
 
 /* FUNC interface - responses */
 #define UNSUPPORTED_CMD 0x80000000
@@ -143,6 +142,7 @@
 /* Device controlling the backlight and associated keys */
 struct fujitsu_bl {
 	acpi_handle acpi_handle;
+	acpi_handle blank_handle;
 	struct acpi_device *dev;
 	struct input_dev *input;
 	char phys[32];
@@ -463,15 +463,12 @@ static int bl_get_brightness(struct backlight_device *b)
 
 static int bl_update_status(struct backlight_device *b)
 {
+	bool blank = b->props.power == FB_BLANK_POWERDOWN;
 	int ret;
-	if (b->props.power == FB_BLANK_POWERDOWN)
-		ret = call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
-	else
-		ret = call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x0);
-	if (ret != 0)
-		vdbg_printk(FUJLAPTOP_DBG_ERROR,
-			"Unable to adjust backlight power, error code %i\n",
-			ret);
+
+	if (fujitsu_bl->blank_handle)
+		acpi_execute_simple_method(fujitsu_bl->blank_handle, NULL,
+					   blank);
 
 	if (use_alt_lcd_levels)
 		ret = set_lcd_level_alt(b->props.brightness);
@@ -693,6 +690,15 @@ static int fujitsu_backlight_register(void)
 		.type = BACKLIGHT_PLATFORM
 	};
 	struct backlight_device *bd;
+	unsigned long long blank;
+	acpi_status status;
+
+	/* Sync backlight power status */
+	status = acpi_evaluate_integer(NULL, "\\BLCT", NULL, &blank);
+	if (ACPI_SUCCESS(status) && blank)
+		props.power = FB_BLANK_POWERDOWN;
+
+	acpi_get_handle(NULL, "\\_SB.FEXT.SBLC", &fujitsu_bl->blank_handle);
 
 	bd = backlight_device_register(KBUILD_MODNAME, NULL, NULL,
 				       &fujitsu_bl_ops, &props);
@@ -1272,14 +1278,6 @@ static int __init fujitsu_init(void)
 	if (ret)
 		goto fail_laptop1;
 
-	/* Sync backlight power status (needs FUJ02E3 device, hence deferred) */
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-		if (call_fext_func(FUNC_BACKLIGHT, 0x2, 0x4, 0x0) == 3)
-			fujitsu_bl->bl_device->props.power = FB_BLANK_POWERDOWN;
-		else
-			fujitsu_bl->bl_device->props.power = FB_BLANK_UNBLANK;
-	}
-
 	pr_info("driver " FUJITSU_DRIVER_VERSION " successfully loaded\n");
 
 	return 0;
-- 
2.12.0
