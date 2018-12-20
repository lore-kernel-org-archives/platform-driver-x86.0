From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the PoV Wintab P1006w (v1.0) tablet
Date: Thu, 20 Dec 2018 22:21:50 +0100
Message-ID: <20181220212150.1427-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add touchscreen info for the Point of View Wintab P1006w (v1.0) tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index ac20797af9b1..7936fd72c50a 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -432,6 +432,24 @@ static const struct ts_dmi_data pov_mobii_wintab_p800w_v21_data = {
 	.properties	= pov_mobii_wintab_p800w_v21_props,
 };
 
+static const struct property_entry pov_mobii_wintab_p1006w_v10_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 1),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 3),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1984),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1520),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_STRING("firmware-name",
+			      "gsl3692-pov-mobii-wintab-p1006w-v10.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data pov_mobii_wintab_p1006w_v10_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= pov_mobii_wintab_p1006w_v10_props,
+};
+
 static const struct property_entry teclast_x3_plus_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
@@ -778,6 +796,17 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_DATE, "08/22/2014"),
 		},
 	},
+	{
+		/* Point of View mobii wintab p1006w (v1.0) */
+		.driver_data = (void *)&pov_mobii_wintab_p1006w_v10_data,
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "BayTrail"),
+			/* Note 105b is Foxcon's USB/PCI vendor id */
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "105B"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "0E57"),
+		},
+	},
 	{
 		/* Teclast X3 Plus */
 		.driver_data = (void *)&teclast_x3_plus_data,
-- 
2.20.1
