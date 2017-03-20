From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 7/8] platform/x86: fujitsu-laptop: model-dependent sparse keymap overrides
Date: Mon, 20 Mar 2017 10:32:23 +0100
Message-ID: <20170320093224.18541-8-kernel@kempniu.pl>
References: <20170320093224.18541-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170320093224.18541-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Some laptop models need to have different keycodes assigned to hotkey
scancodes.  Change the sparse keymap upon a DMI match, before the hotkey
input device is setup.

Instead of using three different callbacks in the DMI match table,
simplify code by using the driver_data field of struct dmi_system_id to
supply the requested keymap to a common callback.  Also merge keymaps
for S6410 and S6420 as they are identical.

Rename fujitsu_dmi_table to fujitsu_laptop_dmi_table to emphasize it is
no longer used by the backlight part of fujitsu-laptop.  Adjust
whitespace to make checkpatch happy.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 111 +++++++++++++++++-----------------
 1 file changed, 55 insertions(+), 56 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 8f1c9c204110..1487eb2396c6 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -534,61 +534,6 @@ static struct platform_driver fujitsu_pf_driver = {
 		   }
 };
 
-static void __init dmi_check_cb_common(const struct dmi_system_id *id)
-{
-	pr_info("Identified laptop model '%s'\n", id->ident);
-}
-
-static int __init dmi_check_cb_s6410(const struct dmi_system_id *id)
-{
-	dmi_check_cb_common(id);
-	fujitsu_bl->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
-	fujitsu_bl->keycode2 = KEY_HELP;	/* "Mobility Center" */
-	return 1;
-}
-
-static int __init dmi_check_cb_s6420(const struct dmi_system_id *id)
-{
-	dmi_check_cb_common(id);
-	fujitsu_bl->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
-	fujitsu_bl->keycode2 = KEY_HELP;	/* "Mobility Center" */
-	return 1;
-}
-
-static int __init dmi_check_cb_p8010(const struct dmi_system_id *id)
-{
-	dmi_check_cb_common(id);
-	fujitsu_bl->keycode1 = KEY_HELP;		/* "Support" */
-	fujitsu_bl->keycode3 = KEY_SWITCHVIDEOMODE;	/* "Presentation" */
-	fujitsu_bl->keycode4 = KEY_WWW;			/* "Internet" */
-	return 1;
-}
-
-static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
-	{
-	 .ident = "Fujitsu Siemens S6410",
-	 .matches = {
-		     DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
-		     DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK S6410"),
-		     },
-	 .callback = dmi_check_cb_s6410},
-	{
-	 .ident = "Fujitsu Siemens S6420",
-	 .matches = {
-		     DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
-		     DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK S6420"),
-		     },
-	 .callback = dmi_check_cb_s6420},
-	{
-	 .ident = "Fujitsu LifeBook P8010",
-	 .matches = {
-		     DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-		     DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook P8010"),
-		     },
-	 .callback = dmi_check_cb_p8010},
-	{}
-};
-
 /* ACPI device for LCD brightness control */
 
 static const struct key_entry keymap_backlight[] = {
@@ -766,8 +711,62 @@ static const struct key_entry keymap_default[] = {
 	{ KE_END, 0 }
 };
 
+static const struct key_entry keymap_s6400[] = {
+	{ KE_KEY, KEY1_CODE, { KEY_SCREENLOCK } },	/* "Lock" */
+	{ KE_KEY, KEY2_CODE, { KEY_HELP } },		/* "Mobility Center */
+	{ KE_KEY, KEY3_CODE, { KEY_PROG3 } },
+	{ KE_KEY, KEY4_CODE, { KEY_PROG4 } },
+	{ KE_END, 0 }
+};
+
+static const struct key_entry keymap_p8010[] = {
+	{ KE_KEY, KEY1_CODE, { KEY_HELP } },		/* "Support" */
+	{ KE_KEY, KEY2_CODE, { KEY_PROG2 } },
+	{ KE_KEY, KEY3_CODE, { KEY_SWITCHVIDEOMODE } },	/* "Presentation" */
+	{ KE_KEY, KEY4_CODE, { KEY_WWW } },		/* "WWW" */
+	{ KE_END, 0 }
+};
+
 static const struct key_entry *keymap = keymap_default;
 
+static int fujitsu_laptop_dmi_keymap_override(const struct dmi_system_id *id)
+{
+	pr_info("Identified laptop model '%s'\n", id->ident);
+	keymap = id->driver_data;
+	return 1;
+}
+
+static const struct dmi_system_id fujitsu_laptop_dmi_table[] = {
+	{
+		.callback = fujitsu_laptop_dmi_keymap_override,
+		.ident = "Fujitsu Siemens S6410",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK S6410"),
+		},
+		.driver_data = (void *)keymap_s6400
+	},
+	{
+		.callback = fujitsu_laptop_dmi_keymap_override,
+		.ident = "Fujitsu Siemens S6420",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK S6420"),
+		},
+		.driver_data = (void *)keymap_s6400
+	},
+	{
+		.callback = fujitsu_laptop_dmi_keymap_override,
+		.ident = "Fujitsu LifeBook P8010",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook P8010"),
+		},
+		.driver_data = (void *)keymap_p8010
+	},
+	{}
+};
+
 static int acpi_fujitsu_laptop_input_setup(struct acpi_device *device)
 {
 	struct fujitsu_laptop *fujitsu_laptop = acpi_driver_data(device);
@@ -785,6 +784,7 @@ static int acpi_fujitsu_laptop_input_setup(struct acpi_device *device)
 	fujitsu_laptop->input->id.bustype = BUS_HOST;
 	fujitsu_laptop->input->id.product = 0x06;
 
+	dmi_check_system(fujitsu_laptop_dmi_table);
 	ret = sparse_keymap_setup(fujitsu_laptop->input, keymap, NULL);
 	if (ret)
 		return ret;
@@ -1135,7 +1135,6 @@ static int __init fujitsu_init(void)
 	fujitsu_bl->keycode3 = KEY_PROG3;
 	fujitsu_bl->keycode4 = KEY_PROG4;
 	fujitsu_bl->keycode5 = KEY_RFKILL;
-	dmi_check_system(fujitsu_dmi_table);
 
 	ret = acpi_bus_register_driver(&acpi_fujitsu_bl_driver);
 	if (ret)
-- 
2.12.0
