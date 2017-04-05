From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 06/11] platform/x86: fujitsu-laptop: clean up use_alt_lcd_levels handling
Date: Wed,  5 Apr 2017 08:49:05 +0200
Message-ID: <20170405064910.3162-7-kernel@kempniu.pl>
References: <20170405064910.3162-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170405064910.3162-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The value of each module parameter can be changed on the fly via sysfs.
However, the current way of handling use_alt_lcd_levels prevents the
user from dynamically switching from a value of 0 or 1 back to
autodetection as the latter is only performed upon ACPI device
instantiation.  Fix this by moving autodetection (in a simplified form)
to set_lcd_level() and changing module parameter type to int.  Do not
announce autodetection results in a debug message as current value of
use_alt_lcd_levels can simply be read from sysfs.  Clarify module
parameter description.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index b019060d6dc4..cd2da9a02592 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -362,6 +362,12 @@ static int set_lcd_level(int level)
 	char *method;
 
 	switch (use_alt_lcd_levels) {
+	case -1:
+		if (acpi_has_method(fujitsu_bl->acpi_handle, "SBL2"))
+			method = "SBL2";
+		else
+			method = "SBLL";
+		break;
 	case 1:
 		method = "SBL2";
 		break;
@@ -606,21 +612,10 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 			pr_err("_INI Method failed\n");
 	}
 
-	if (use_alt_lcd_levels == -1) {
-		if (acpi_has_method(NULL, "\\_SB.PCI0.LPCB.FJEX.SBL2"))
-			use_alt_lcd_levels = 1;
-		else
-			use_alt_lcd_levels = 0;
-		vdbg_printk(FUJLAPTOP_DBG_TRACE, "auto-detected usealt as %i\n",
-			    use_alt_lcd_levels);
-	}
-
 	/* do config (detect defaults) */
-	use_alt_lcd_levels = use_alt_lcd_levels == 1 ? 1 : 0;
 	disable_brightness_adjust = disable_brightness_adjust == 1 ? 1 : 0;
-	vdbg_printk(FUJLAPTOP_DBG_INFO,
-		    "config: [alt interface: %d], [adjust disable: %d]\n",
-		    use_alt_lcd_levels, disable_brightness_adjust);
+	vdbg_printk(FUJLAPTOP_DBG_INFO, "config: [adjust disable: %d]\n",
+		    disable_brightness_adjust);
 
 	if (get_max_brightness() <= 0)
 		fujitsu_bl->max_brightness = FUJITSU_LCD_N_LEVELS;
@@ -1153,9 +1148,8 @@ static void __exit fujitsu_cleanup(void)
 module_init(fujitsu_init);
 module_exit(fujitsu_cleanup);
 
-module_param(use_alt_lcd_levels, uint, 0644);
-MODULE_PARM_DESC(use_alt_lcd_levels,
-		 "Use alternative interface for lcd_levels (needed for Lifebook s6410).");
+module_param(use_alt_lcd_levels, int, 0644);
+MODULE_PARM_DESC(use_alt_lcd_levels, "Interface used for setting LCD brightness level (-1 = auto, 0 = force SBLL, 1 = force SBL2)");
 module_param(disable_brightness_adjust, uint, 0644);
 MODULE_PARM_DESC(disable_brightness_adjust, "Disable brightness adjustment .");
 #ifdef CONFIG_FUJITSU_LAPTOP_DEBUG
-- 
2.12.2
