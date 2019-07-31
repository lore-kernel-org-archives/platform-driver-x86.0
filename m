From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [RFC 4/9] platform/x86: huawei-wmi: Add quirks and module parameters
Date: Wed, 31 Jul 2019 13:52:50 -0400
Message-ID: <20190731175255.25676-5-ayman.bagabas@gmail.com>
References: <20190731175255.25676-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731175255.25676-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ayman Bagabas <ayman.bagabas@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Introduce quirks and module parameters. 3 quirks are added:
1. Fixes reporting brightness keys twice since it's already handled by
   acpi-video.
2. Some models need a short delay when setting battery thresholds to
   prevent a race condition when two processes read/write.
3. Matebook X (2017) handles micmute led through the "legacy" interface
   which is not currently implemented. Use ACPI EC method to control
   this led.

2 module parameters are added to enable this short delay and/or report
  brightness keys through this driver.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 71 +++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 27520b0f8956..8f918138053a 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/leds.h>
@@ -34,6 +35,14 @@ enum {
 	MICMUTE_LED_SET			= 0x00000b04, /* \SMLS */
 };
 
+struct quirk_entry {
+	bool battery_sleep;
+	bool ec_micmute;
+	bool report_brightness;
+};
+
+static struct quirk_entry *quirks;
+
 struct huawei_wmi_priv {
 	struct input_dev *idev[2];
 	struct led_classdev cdev;
@@ -62,6 +71,58 @@ static const struct key_entry huawei_wmi_keymap[] = {
 	{ KE_END,	 0 }
 };
 
+static bool battery_sleep;
+static bool report_brightness;
+
+module_param(battery_sleep, bool, 0444);
+MODULE_PARM_DESC(battery_sleep,
+		"Delay after setting battery charging thresholds.");
+module_param(report_brightness, bool, 0444);
+MODULE_PARM_DESC(report_brightness,
+		"Report brightness keys.");
+
+/* Quirks */
+
+static int __init dmi_matched(const struct dmi_system_id *dmi)
+{
+	quirks = dmi->driver_data;
+	return 1;
+}
+
+static struct quirk_entry quirk_unknown = {
+};
+
+static struct quirk_entry quirk_battery_sleep = {
+	.battery_sleep = true,
+};
+
+static struct quirk_entry quirk_matebook_x = {
+	.ec_micmute = true,
+	.report_brightness = true,
+};
+
+static const struct dmi_system_id huawei_quirks[] = {
+	{
+		.callback = dmi_matched,
+		.ident = "Huawei MACH-WX9",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MACH-WX9"),
+		},
+		.driver_data = &quirk_battery_sleep
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Huawei MateBook X",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HUAWEI MateBook X")
+		},
+		.driver_data = &quirk_matebook_x
+	},
+	{  }
+};
+
 /* Utils */
 
 static int huawei_wmi_call(struct device *dev, struct acpi_buffer *in,
@@ -264,6 +325,11 @@ static void huawei_wmi_process_key(struct input_dev *idev, int code)
 		return;
 	}
 
+	if (quirks && !quirks->report_brightness &&
+			(key->sw.code == KEY_BRIGHTNESSDOWN ||
+			key->sw.code == KEY_BRIGHTNESSUP))
+		return;
+
 	sparse_keymap_report_entry(idev, key, 1, true);
 }
 
@@ -377,6 +443,11 @@ static __init int huawei_wmi_init(void)
 {
 	int err;
 
+	quirks = &quirk_unknown;
+	dmi_check_system(huawei_quirks);
+	quirks->battery_sleep |= battery_sleep;
+	quirks->report_brightness |= report_brightness;
+
 	err = platform_driver_register(&huawei_wmi_driver);
 	if (err)
 		return err;
-- 
2.20.1
