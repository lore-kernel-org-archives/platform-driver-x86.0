From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v2] dell-laptop: Fix keyboard led max_brightness property for Dell Latitude E6410
Date: Wed, 18 Oct 2017 20:06:01 +0200
Message-ID: <1508349961-15051-1-git-send-email-pali.rohar@gmail.com>
References: <1508083394-22823-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508083394-22823-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario.Limonciello@dell.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This machine reports number of keyboard backlight led levels, instead of
value of the last led level index. Therefore max_brightness properly needs
to be subtracted by 1 to match led max_brightness API.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
Reported-by: Gabriel M. Elder <gabriel@tekgnowsys.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=196913
---
Changes since v1:
* Update kbd_info.levels at initialization time based on quirk
---
 drivers/platform/x86/dell-laptop.c |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f42159f..3f9be8a 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -49,6 +49,7 @@
 
 struct quirk_entry {
 	u8 touchpad_led;
+	u8 kbd_led_num_of_levels_instead_of_last_index;
 
 	int needs_kbd_timeouts;
 	/*
@@ -79,6 +80,10 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
 	.kbd_timeouts = { 0, 5, 15, 60, 5 * 60, 15 * 60, -1 },
 };
 
+static struct quirk_entry quirk_dell_latitude_e6410 = {
+	.kbd_led_num_of_levels_instead_of_last_index = 1,
+};
+
 static struct platform_driver platform_driver = {
 	.driver = {
 		.name = "dell-laptop",
@@ -280,6 +285,15 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
 		},
 		.driver_data = &quirk_dell_xps13_9333,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Latitude E6410",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6410"),
+		},
+		.driver_data = &quirk_dell_latitude_e6410,
+	},
 	{ }
 };
 
@@ -1200,6 +1214,9 @@ static int kbd_get_info(struct kbd_info *info)
 	units = (buffer->output[2] >> 8) & 0xFF;
 	info->levels = (buffer->output[2] >> 16) & 0xFF;
 
+	if (quirks && quirks->kbd_led_num_of_levels_instead_of_last_index && info->levels)
+		info->levels--;
+
 	if (units & BIT(0))
 		info->seconds = (buffer->output[3] >> 0) & 0xFF;
 	if (units & BIT(1))
-- 
1.7.9.5
