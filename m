From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [PATCH v2 3/8] platform/x86: huawei-wmi: use quirks and module parameters
Date: Wed, 12 Jun 2019 23:04:10 -0400
Message-ID: <20190613030416.25807-5-ayman.bagabas@gmail.com>
References: <20190613030416.25807-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613030416.25807-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ayman.bagabas@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

The patch introduces two parameters to force reporting brightness keys
and sleeping after setting battery thresholds value.
These parameters are implemented as quirks along with `ec_micmute` quirk
which controls the micmute LED through ACPI EC interface.

All newer models that "fully" implement the new interface report
brightness key events twice, once through WMI and once through
acpi-video. Older models, such as `MateBook X`, don't report brightness
events using WMI. This is implemented as a quirk and can be forced using
module parameters.

Some models don't allow setting thresholds to (0, 100), due to bad ASL
code, which indicates reset values, instead, it only turns off battery
charging protection. This would return the currently set values even
though battery protection is off which doesn't make sense. A sane value
like (0, 100) indicates no charging protection, but since it's not
possible to set such values, (0, 0) is set before turning protection
off with (0, 100). This requires a delay after setting (0, 0) and after
(0, 100) so that these values make their way to EC memory.

    Method (SBTT, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100){})
        Local0 = Arg0
        CreateByteField (Arg0, 0x02, STCP)
        CreateByteField (Arg0, 0x03, SOCP)
        CreateByteField (BUFF, Zero, STAT)
        If (((STCP == Zero) && (SOCP == 0x64)))
        {
            \_SB.PCI0.LPCB.EC0.ECXT (0xC7, Zero, Zero, Zero, Zero, Zero)
        }
        Else
        {
            \_SB.PCI0.LPCB.EC0.ECXT (0xC7, One, STCP, SOCP, Zero, Zero)
        }                                // ^    ^     ^
                                         // |    |     |
        STAT = Zero                      // on   low   high
        Return (BUFF) /* \SBTT.BUFF */   // bit  thresh  thresh
    }

ASL code taken from MateBook X Pro (MACH-WX9) showing how it turns off
protection without changing values.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 71 +++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 37b09d497f5e..647c5a6c8ab3 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/leds.h>
@@ -35,6 +36,14 @@ enum {
 	MICMUTE_LED_SET 		= 0x00000b04, /* \SMLS */
 };
 
+struct quirk_entry {
+	bool battery_sleep;
+	bool ec_micmute;
+	bool report_brightness;
+};
+
+static struct quirk_entry *quirks;
+
 struct huawei_wmi {
 	struct led_classdev cdev;
 	struct input_dev *idev[2];
@@ -61,6 +70,58 @@ static const struct key_entry huawei_wmi_keymap[] = {
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
+		"Report brightness key events.");
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
@@ -266,6 +327,11 @@ static void huawei_wmi_process_key(struct input_dev *idev, int code)
 		return;
 	}
 
+	if (quirks && !quirks->report_brightness &&
+			(key->sw.code == KEY_BRIGHTNESSDOWN ||
+			key->sw.code == KEY_BRIGHTNESSUP))
+		return;
+
 	sparse_keymap_report_entry(idev, key, 1, true);
 }
 
@@ -378,6 +444,11 @@ static __init int huawei_wmi_init(void)
 {
 	int err;
 
+	quirks = &quirk_unknown;
+	dmi_check_system(huawei_quirks);
+	quirks->battery_sleep |= battery_sleep;
+	quirks->report_brightness |= report_brightness;
+
 	err = platform_driver_register(&huawei_wmi_driver);
 	if (err) {
 		pr_err("Failed to register platform driver\n");
-- 
2.20.1
