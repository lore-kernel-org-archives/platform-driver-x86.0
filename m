From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v5] platform/x86: touchscreen_dmi: Add info for the ONDA V891W Dual OS tablet
Date: Mon, 18 Jun 2018 15:11:44 +0200
Message-ID: <20180618131144.13890-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, youling257 <youling257@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

From: youling257 <youling257@gmail.com>

Add touchscreen info for hardware revision "v3" of the ONDA V891W Dual
OS tablet.

Reported-and-tested-by: youling257 <youling257@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v5:
-Replaced youlin's S-o-b with mine since youlin does not want to use his
 real name and I certify that he has created this patch and has the rights
 to submit it under the GPL
---
 drivers/platform/x86/touchscreen_dmi.c | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 4670c8fc1eef..8578f9e28ee0 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -264,6 +264,24 @@ static const struct ts_dmi_data onda_v891w_v1_data = {
 	.properties	= onda_v891w_v1_props,
 };
 
+static const struct property_entry onda_v891w_v3_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 35),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 15),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1625),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1135),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_STRING("firmware-name",
+			      "gsl3676-onda-v891w-v3.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data onda_v891w_v3_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= onda_v891w_v3_props,
+};
+
 static const struct property_entry pipo_w2s_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1660),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 880),
@@ -543,6 +561,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_EXACT_MATCH(DMI_BIOS_VERSION, "ONDA.W89EBBN08"),
 		},
 	},
+	{
+		/* ONDA V891w Dual OS P891DCF2V1A01274 64GB */
+		.driver_data = (void *)&onda_v891w_v3_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ONDA Tablet"),
+			DMI_MATCH(DMI_BIOS_VERSION, "ONDA.D890HBBNR0A"),
+		},
+	},
 	{
 		/* Pipo W2S */
 		.driver_data = (void *)&pipo_w2s_data,
-- 
2.17.1
