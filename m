From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: silead_dmi: Add entry for the Chuwi Hi8 Pro tablet
Date: Wed,  4 Oct 2017 15:30:12 +0200
Message-ID: <20171004133012.10625-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add touchscreen platform data for the Chuwi Hi8 Pro tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index c8ff77275366..fadfce9b3f5f 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -138,6 +138,19 @@ static const struct silead_ts_dmi_data itworks_tw891_data = {
 	.properties	= itworks_tw891_props,
 };
 
+static const struct property_entry chuwi_hi8_pro_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1728),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1148),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-chuwi-hi8-pro.fw"),
+	{ }
+};
+
+static const struct silead_ts_dmi_data chuwi_hi8_pro_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= chuwi_hi8_pro_props,
+};
+
 static const struct dmi_system_id silead_ts_dmi_table[] = {
 	{
 		/* CUBE iwork8 Air */
@@ -221,6 +234,14 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "TW891"),
 		},
 	},
+	{
+		/* Chuwi Hi8 Pro */
+		.driver_data = (void *)&chuwi_hi8_pro_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X1D3_C806N"),
+		},
+	},
 	{ },
 };
 
-- 
2.14.2
