From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] platform/x86: silead_dmi: Add entry for the Chuwi Vi8 tablet
Date: Wed, 20 Dec 2017 11:30:09 +0100
Message-ID: <20171220103009.7680-3-hdegoede@redhat.com>
References: <20171220103009.7680-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46624 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932133AbdLTKaQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 Dec 2017 05:30:16 -0500
In-Reply-To: <20171220103009.7680-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Add touchscreen platform data for the Chuwi Vi8 tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index 21fdce159877..09b589fb79d4 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -217,6 +217,21 @@ static const struct silead_ts_dmi_data chuwi_hi8_data = {
 	.properties     = chuwi_hi8_props,
 };
 
+static const struct property_entry chuwi_vi8_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1724),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl3676-chuwi-vi8.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct silead_ts_dmi_data chuwi_vi8_data = {
+	.acpi_name      = "MSSL1680:00",
+	.properties     = chuwi_vi8_props,
+};
+
 static const struct dmi_system_id silead_ts_dmi_table[] = {
 	{
 		/* CUBE iwork8 Air */
@@ -341,6 +356,15 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "S806"),
 		},
 	},
+	{
+		/* Chuwi Vi8 (CWI506) */
+		.driver_data = (void *)&chuwi_vi8_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "i86"),
+			DMI_MATCH(DMI_BIOS_VERSION, "CHUWI.D86JLBNR"),
+		},
+	},
 	{ },
 };
 
-- 
2.14.3
