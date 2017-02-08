From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 09/10] platform/x86: fujitsu-laptop: autodetect LCD interface on all models
Date: Wed,  8 Feb 2017 14:46:32 +0100
Message-ID: <20170208134633.5152-10-kernel@kempniu.pl>
References: <20170208134633.5152-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208134633.5152-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>

Presence of ACPI method SBL2 should be checked on all models rather than
just the ones with predefined hotkey keycode overrides.  Move most of
dmi_check_cb_common() to acpi_fujitsu_bl_add().  Adjust indentation to
make checkpatch happy.

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
[kempniu: rebase patch, rewrite commit message]
Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 8247abd4658f..4eabb169e2c9 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -631,15 +631,6 @@ static struct platform_driver fujitsu_pf_driver = {
 static void __init dmi_check_cb_common(const struct dmi_system_id *id)
 {
 	pr_info("Identified laptop model '%s'\n", id->ident);
-	if (use_alt_lcd_levels == -1) {
-		if (acpi_has_method(NULL,
-				"\\_SB.PCI0.LPCB.FJEX.SBL2"))
-			use_alt_lcd_levels = 1;
-		else
-			use_alt_lcd_levels = 0;
-		vdbg_printk(FUJLAPTOP_DBG_TRACE, "auto-detected usealt as "
-			"%i\n", use_alt_lcd_levels);
-	}
 }
 
 static int __init dmi_check_cb_s6410(const struct dmi_system_id *id)
@@ -751,6 +742,15 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 			pr_err("_INI Method failed\n");
 	}
 
+	if (use_alt_lcd_levels == -1) {
+		if (acpi_has_method(NULL, "\\_SB.PCI0.LPCB.FJEX.SBL2"))
+			use_alt_lcd_levels = 1;
+		else
+			use_alt_lcd_levels = 0;
+		vdbg_printk(FUJLAPTOP_DBG_TRACE, "auto-detected usealt as %i\n",
+			    use_alt_lcd_levels);
+	}
+
 	/* do config (detect defaults) */
 	use_alt_lcd_levels = use_alt_lcd_levels == 1 ? 1 : 0;
 	disable_brightness_adjust = disable_brightness_adjust == 1 ? 1 : 0;
-- 
2.11.1
