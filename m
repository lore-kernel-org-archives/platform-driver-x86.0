From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 03/11] platform/x86: fujitsu-laptop: merge set_lcd_level_alt() into set_lcd_level()
Date: Thu, 30 Mar 2017 12:35:01 +0200
Message-ID: <20170330103509.32509-4-kernel@kempniu.pl>
References: <20170330103509.32509-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170330103509.32509-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Depending on the value of the use_alt_lcd_levels module parameter, one
of two functions is used for setting LCD brightness level.  These
functions are almost identical and only differ in the name of the ACPI
method they call.  Instead of checking the value of use_alt_lcd_levels
at each call site, move that check to set_lcd_level() and get rid of
set_lcd_level_alt().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 54 +++++++++++------------------------
 1 file changed, 16 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index a9520e732c8b..5005400b57bb 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -360,41 +360,26 @@ static int set_lcd_level(int level)
 {
 	acpi_status status = AE_OK;
 	acpi_handle handle = NULL;
-
-	vdbg_printk(FUJLAPTOP_DBG_TRACE, "set lcd level via SBLL [%d]\n",
-		    level);
-
-	if (level < 0 || level >= fujitsu_bl->max_brightness)
-		return -EINVAL;
-
-	status = acpi_get_handle(fujitsu_bl->acpi_handle, "SBLL", &handle);
-	if (ACPI_FAILURE(status)) {
-		vdbg_printk(FUJLAPTOP_DBG_ERROR, "SBLL not present\n");
-		return -ENODEV;
+	char *method;
+
+	switch (use_alt_lcd_levels) {
+	case 1:
+		method = "SBL2";
+		break;
+	default:
+		method = "SBLL";
+		break;
 	}
 
-
-	status = acpi_execute_simple_method(handle, NULL, level);
-	if (ACPI_FAILURE(status))
-		return -ENODEV;
-
-	return 0;
-}
-
-static int set_lcd_level_alt(int level)
-{
-	acpi_status status = AE_OK;
-	acpi_handle handle = NULL;
-
-	vdbg_printk(FUJLAPTOP_DBG_TRACE, "set lcd level via SBL2 [%d]\n",
-		    level);
+	vdbg_printk(FUJLAPTOP_DBG_TRACE, "set lcd level via %s [%d]\n",
+		    method, level);
 
 	if (level < 0 || level >= fujitsu_bl->max_brightness)
 		return -EINVAL;
 
-	status = acpi_get_handle(fujitsu_bl->acpi_handle, "SBL2", &handle);
+	status = acpi_get_handle(fujitsu_bl->acpi_handle, method, &handle);
 	if (ACPI_FAILURE(status)) {
-		vdbg_printk(FUJLAPTOP_DBG_ERROR, "SBL2 not present\n");
+		vdbg_printk(FUJLAPTOP_DBG_ERROR, "%s not present\n", method);
 		return -ENODEV;
 	}
 
@@ -463,10 +448,7 @@ static int bl_update_status(struct backlight_device *b)
 			"Unable to adjust backlight power, error code %i\n",
 			ret);
 
-	if (use_alt_lcd_levels)
-		ret = set_lcd_level_alt(b->props.brightness);
-	else
-		ret = set_lcd_level(b->props.brightness);
+	ret = set_lcd_level(b->props.brightness);
 	if (ret != 0)
 		vdbg_printk(FUJLAPTOP_DBG_ERROR,
 			"Unable to adjust LCD brightness, error code %i\n",
@@ -679,12 +661,8 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 	if (oldb == newb)
 		return;
 
-	if (disable_brightness_adjust != 1) {
-		if (use_alt_lcd_levels)
-			set_lcd_level_alt(newb);
-		else
-			set_lcd_level(newb);
-	}
+	if (disable_brightness_adjust != 1)
+		set_lcd_level(newb);
 
 	sparse_keymap_report_event(input, oldb < newb, 1, true);
 }
-- 
2.12.1
