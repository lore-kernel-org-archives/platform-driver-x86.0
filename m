From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 3/8] platform/x86: fujitsu-laptop: use a sparse keymap for brightness key event generation
Date: Mon, 20 Mar 2017 10:32:19 +0100
Message-ID: <20170320093224.18541-4-kernel@kempniu.pl>
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

Simplify brightness key event generation by using a sparse keymap.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/Kconfig          |  1 +
 drivers/platform/x86/fujitsu-laptop.c | 31 +++++++++++++++----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 4bc88eb52712..f614521a6876 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -175,6 +175,7 @@ config FUJITSU_LAPTOP
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on LEDS_CLASS || LEDS_CLASS=n
+	select INPUT_SPARSEKMAP
 	---help---
 	  This is a driver for laptops built by Fujitsu:
 
diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 68e338c6a876..3483ac37bee5 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -57,6 +57,7 @@
 #include <linux/backlight.h>
 #include <linux/fb.h>
 #include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
 #include <linux/kfifo.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -590,9 +591,16 @@ static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
 
 /* ACPI device for LCD brightness control */
 
+static const struct key_entry keymap_backlight[] = {
+	{ KE_KEY, true, { KEY_BRIGHTNESSUP } },
+	{ KE_KEY, false, { KEY_BRIGHTNESSDOWN } },
+	{ KE_END, 0 }
+};
+
 static int acpi_fujitsu_bl_input_setup(struct acpi_device *device)
 {
 	struct fujitsu_bl *fujitsu_bl = acpi_driver_data(device);
+	int ret;
 
 	fujitsu_bl->input = devm_input_allocate_device(&device->dev);
 	if (!fujitsu_bl->input)
@@ -605,10 +613,10 @@ static int acpi_fujitsu_bl_input_setup(struct acpi_device *device)
 	fujitsu_bl->input->phys = fujitsu_bl->phys;
 	fujitsu_bl->input->id.bustype = BUS_HOST;
 	fujitsu_bl->input->id.product = 0x06;
-	fujitsu_bl->input->evbit[0] = BIT(EV_KEY);
-	set_bit(KEY_BRIGHTNESSUP, fujitsu_bl->input->keybit);
-	set_bit(KEY_BRIGHTNESSDOWN, fujitsu_bl->input->keybit);
-	set_bit(KEY_UNKNOWN, fujitsu_bl->input->keybit);
+
+	ret = sparse_keymap_setup(fujitsu_bl->input, keymap_backlight, NULL);
+	if (ret)
+		return ret;
 
 	return input_register_device(fujitsu_bl->input);
 }
@@ -714,18 +722,14 @@ static int acpi_fujitsu_bl_remove(struct acpi_device *device)
 static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 {
 	struct input_dev *input;
-	int oldb, newb, keycode;
+	int oldb, newb;
 
 	input = fujitsu_bl->input;
 
 	if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
-		keycode = KEY_UNKNOWN;
 		vdbg_printk(FUJLAPTOP_DBG_WARN,
 			    "unsupported event [0x%x]\n", event);
-		input_report_key(input, keycode, 1);
-		input_sync(input);
-		input_report_key(input, keycode, 0);
-		input_sync(input);
+		sparse_keymap_report_event(input, -1, 1, true);
 		return;
 	}
 
@@ -747,12 +751,7 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 			set_lcd_level(newb);
 	}
 
-	keycode = oldb < newb ? KEY_BRIGHTNESSUP : KEY_BRIGHTNESSDOWN;
-
-	input_report_key(input, keycode, 1);
-	input_sync(input);
-	input_report_key(input, keycode, 0);
-	input_sync(input);
+	sparse_keymap_report_event(input, oldb < newb, 1, true);
 }
 
 /* ACPI device for hotkey handling */
-- 
2.12.0
