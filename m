From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 07/11] platform/x86: fujitsu-laptop: make disable_brightness_adjust a boolean
Date: Thu, 30 Mar 2017 12:35:05 +0200
Message-ID: <20170330103509.32509-8-kernel@kempniu.pl>
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

Due to the way the disable_brightness_adjust module parameter is
currently handled in acpi_fujitsu_bl_add(), it can only be set to either
0 or 1, which effectively makes it a boolean.  Emphasize that by
changing module parameter type to bool.  Do not announce parameter value
in a debug message as it can be dynamically changed via sysfs and its
current value can also be read from there.  Clean up module parameter
description.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index d10fbb0ed95b..84c2bd55526f 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -147,7 +147,7 @@ struct fujitsu_bl {
 
 static struct fujitsu_bl *fujitsu_bl;
 static int use_alt_lcd_levels = -1;
-static int disable_brightness_adjust = -1;
+static bool disable_brightness_adjust;
 
 /* Device used to access hotkeys and other features on the laptop */
 struct fujitsu_laptop {
@@ -611,11 +611,6 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 			pr_err("_INI Method failed\n");
 	}
 
-	/* do config (detect defaults) */
-	disable_brightness_adjust = disable_brightness_adjust == 1 ? 1 : 0;
-	vdbg_printk(FUJLAPTOP_DBG_INFO, "config: [adjust disable: %d]\n",
-		    disable_brightness_adjust);
-
 	if (get_max_brightness() <= 0)
 		fujitsu_bl->max_brightness = FUJITSU_LCD_N_LEVELS;
 	get_lcd_level();
@@ -654,7 +649,7 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 	if (oldb == newb)
 		return;
 
-	if (disable_brightness_adjust != 1)
+	if (!disable_brightness_adjust)
 		set_lcd_level(newb);
 
 	sparse_keymap_report_event(input, oldb < newb, 1, true);
@@ -1149,8 +1144,8 @@ module_exit(fujitsu_cleanup);
 
 module_param(use_alt_lcd_levels, int, 0644);
 MODULE_PARM_DESC(use_alt_lcd_levels, "Interface used for setting LCD brightness level (-1 = auto, 0 = force SBLL, 1 = force SBL2)");
-module_param(disable_brightness_adjust, uint, 0644);
-MODULE_PARM_DESC(disable_brightness_adjust, "Disable brightness adjustment .");
+module_param(disable_brightness_adjust, bool, 0644);
+MODULE_PARM_DESC(disable_brightness_adjust, "Disable LCD brightness adjustment");
 #ifdef CONFIG_FUJITSU_LAPTOP_DEBUG
 module_param_named(debug, dbg_level, uint, 0644);
 MODULE_PARM_DESC(debug, "Sets debug level bit-mask");
-- 
2.12.1
