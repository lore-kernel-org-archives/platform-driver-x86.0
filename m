From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for 'jumper ezpad 6 pro b' touchscreen
Date: Mon, 29 Apr 2019 17:46:57 +0200
Message-ID: <20190429154657.26797-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Kai Heng Feng <kai.heng.feng@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Renz <appswert@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Benjamin Renz <appswert@gmail.com>

Add touchscreen platform data for the 'jumper ezpad 6 pro b' touchscreen.

Signed-off-by: Benjamin Renz <appswert@gmail.com>
[hdegoede@redhat.com: Cleanup commit msg, fix some checkpatch warnings]
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 3319f0cbb558..bd0856d2e825 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -249,6 +249,21 @@ static const struct ts_dmi_data jumper_ezpad_6_pro_data = {
 	.properties	= jumper_ezpad_6_pro_props,
 };
 
+static const struct property_entry jumper_ezpad_6_pro_b_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl3692-jumper-ezpad-6-pro-b.fw"),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data jumper_ezpad_6_pro_b_data = {
+	.acpi_name      = "MSSL1680:00",
+	.properties     = jumper_ezpad_6_pro_b_props,
+};
+
 static const struct property_entry jumper_ezpad_mini3_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 23),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 16),
@@ -690,6 +705,17 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_DATE, "08/18/2017"),
 		},
 	},
+	{
+		/* Jumper EZpad 6 Pro B */
+		.driver_data = (void *)&jumper_ezpad_6_pro_b_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Jumper"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EZpad"),
+			DMI_MATCH(DMI_BIOS_VERSION, "5.12"),
+			/* Above matches are too generic, add bios-date match */
+			DMI_MATCH(DMI_BIOS_DATE, "04/24/2018"),
+		},
+	},
 	{
 		/* Jumper EZpad mini3 */
 		.driver_data = (void *)&jumper_ezpad_mini3_data,
-- 
2.21.0
