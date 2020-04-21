From: Maksim Karasev <karasevm98@gmail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the ONDA V891 v5 tablet
Date: Tue, 21 Apr 2020 16:25:48 +0300
Message-ID: <20200421132548.5627-1-karasevm98@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
Cc: hdegoede@redhat.com, dvhart@infradead.org, andy@infradead.org, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, Maksim Karasev <karasevm98@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Add touchscreen info for the ONDA V891 v5 tablet.

Signed-off-by: Maksim Karasev <karasevm98@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 6ec8923dec1a..cc2a2e0a0585 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -448,6 +448,24 @@ static const struct ts_dmi_data onda_v820w_32g_data = {
 	.properties	= onda_v820w_32g_props,
 };
 
+static const struct property_entry onda_v891_v5_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name",
+			      "gsl3676-onda-v891-v5.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data onda_v891_v5_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= onda_v891_v5_props,
+};
+
 static const struct property_entry onda_v891w_v1_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 46),
 	PROPERTY_ENTRY_U32("touchscreen-min-y",  8),
@@ -940,6 +958,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "V820w DualOS")
 		},
 	},
+	{
+		/* ONDA V891 v5 */
+		.driver_data = (void *)&onda_v891_v5_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ONDA"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ONDA Tablet"),
+			DMI_MATCH(DMI_BIOS_VERSION, "ONDA.D869CJABNRBA06"),
+		},
+	},
 	{
 		/* ONDA V891w revision P891WBEBV1B00 aka v1 */
 		.driver_data = (void *)&onda_v891w_v1_data,
-- 
2.26.1
