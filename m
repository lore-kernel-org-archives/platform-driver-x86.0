From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the Onda V80 Plus v3 tablet
Date: Wed, 10 Oct 2018 15:16:40 +0200
Message-ID: <20181010131640.27440-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add touchscreen platform data for the Onda V80 Plus v3 tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 4e6fdc1fbfdf..00b5e54f09cc 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -282,6 +282,24 @@ static const struct ts_dmi_data onda_obook_20_plus_data = {
 	.properties	= onda_obook_20_plus_props,
 };
 
+static const struct property_entry onda_v80_plus_v3_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 22),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 15),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1698),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name",
+			      "gsl3676-onda-v80-plus-v3.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data onda_v80_plus_v3_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= onda_v80_plus_v3_props,
+};
+
 static const struct property_entry onda_v820w_32g_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1665),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
@@ -637,6 +655,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "OBOOK 20 PLUS"),
 		},
 	},
+	{
+		/* ONDA V80 plus v3 (P80PSBG9V3A01501) */
+		.driver_data = (void *)&onda_v80_plus_v3_data,
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONDA"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "V80 PLUS")
+		},
+	},
 	{
 		/* ONDA V820w DualOS */
 		.driver_data = (void *)&onda_v820w_32g_data,
-- 
2.19.0
