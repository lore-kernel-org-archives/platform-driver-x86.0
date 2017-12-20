From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] platform/x86: silead_dmi: add entry for Chuwi Hi8 tablet
Date: Wed, 20 Dec 2017 11:30:08 +0100
Message-ID: <20171220103009.7680-2-hdegoede@redhat.com>
References: <20171220103009.7680-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171220103009.7680-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Maruyama Shohei <cheat.sc.linux@outlook.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Maruyama Shohei <cheat.sc.linux@outlook.com>

This commit add entry for Chuwi Hi8 tablet.

Signed-off-by: Shohei Maruyama <cheat.sc.linux@outlook.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index 89bd924fb8dc..21fdce159877 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -203,6 +203,20 @@ static const struct silead_ts_dmi_data onda_obook_20_plus_data = {
 	.properties	= onda_obook_20_plus_props,
 };
 
+static const struct property_entry chuwi_hi8_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1665),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi8.fw"),
+	{ }
+};
+
+static const struct silead_ts_dmi_data chuwi_hi8_data = {
+	.acpi_name      = "MSSL0001:00",
+	.properties     = chuwi_hi8_props,
+};
+
 static const struct dmi_system_id silead_ts_dmi_table[] = {
 	{
 		/* CUBE iwork8 Air */
@@ -319,6 +333,14 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "OBOOK 20 PLUS"),
 		},
 	},
+	{
+		/* Chuwi Hi8 */
+		.driver_data = (void *)&chuwi_hi8_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ilife"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "S806"),
+		},
+	},
 	{ },
 };
 
-- 
2.14.3
