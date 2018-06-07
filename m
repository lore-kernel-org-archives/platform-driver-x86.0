From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 3/3] platform/x86: silead_dmi: Add touchscreen info for the Chuwi Vi10 tablet
Date: Thu,  7 Jun 2018 22:36:17 +0200
Message-ID: <20180607203617.11240-4-hdegoede@redhat.com>
References: <20180607203617.11240-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180607203617.11240-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add touchscreen info for the 10" Chuwi Vi10 (CWI505) tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index e466e6d8226f..2fea649653cc 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -70,6 +70,22 @@ static const struct silead_ts_dmi_data chuwi_vi8_data = {
 	.properties     = chuwi_vi8_props,
 };
 
+static const struct property_entry chuwi_vi10_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 0),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 4),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1858),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-chuwi-vi10.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data chuwi_vi10_data = {
+	.acpi_name      = "MSSL0002:00",
+	.properties     = chuwi_vi10_props,
+};
+
 static const struct property_entry cube_iwork8_air_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1660),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 900),
@@ -364,6 +380,16 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "CHUWI.D86JLBNR"),
 		},
 	},
+	{
+		/* Chuwi Vi10 (CWI505) */
+		.driver_data = (void *)&chuwi_vi10_data,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_BOARD_NAME, "BYT-PF02"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ilife"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "S165"),
+		},
+	},
 	{
 		/* CUBE iwork8 Air */
 		.driver_data = (void *)&cube_iwork8_air_data,
-- 
2.17.1
