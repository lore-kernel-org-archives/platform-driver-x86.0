From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] platform/x86: silead_dmi: Add touchscreen info for Pipo W2S tablet
Date: Thu, 15 Jun 2017 08:48:32 +0200
Message-ID: <20170615064832.4148-2-hdegoede@redhat.com>
References: <20170615064832.4148-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615064832.4148-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add touchscreen info for Pipo W2S tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index 46c5e1ebfb53..25cbea307a5e 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -107,6 +107,21 @@ static const struct silead_ts_dmi_data pov_mobii_wintab_p800w_data = {
 	.properties	= pov_mobii_wintab_p800w_props,
 };
 
+static const struct property_entry pipo_w2s_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1660),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 880),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name",
+			      "gsl1680-pipo-w2s.fw"),
+	{ }
+};
+
+static const struct silead_ts_dmi_data pipo_w2s_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= pipo_w2s_props,
+};
+
 static const struct dmi_system_id silead_ts_dmi_table[] = {
 	{
 		/* CUBE iwork8 Air */
@@ -164,6 +179,14 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_DATE, "08/22/2014"),
 		},
 	},
+	{
+		/* Pipo W2S */
+		.driver_data = (void *)&pipo_w2s_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PIPO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "W2S"),
+		},
+	},
 	{ },
 };
 
-- 
2.13.0
