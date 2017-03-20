From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform: x86: silead_dmi: Add entry for Insyde 7W tablets
Date: Mon, 20 Mar 2017 12:35:25 +0100
Message-ID: <20170320113525.21165-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40000 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754102AbdCTLf3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2017 07:35:29 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, russianneuromancer@ya.ru, platform-driver-x86@vger.kernel.org

Add an entry providing the necessary info to make the touchscreen work
on various tablets based on the Insyde 7W whitebox tablet.

This has been tested on a DEXP Ursus 7W tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index 02e11fd..a4399e7 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -53,6 +53,19 @@ static const struct silead_ts_dmi_data jumper_ezpad_mini3_data = {
 	.properties	= jumper_ezpad_mini3_props,
 };
 
+static struct property_entry dexp_ursus_7w_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 890),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 630),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1686-dexp-ursus-7w.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	{ }
+};
+
+static const struct silead_ts_dmi_data dexp_ursus_7w_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= dexp_ursus_7w_props,
+};
+
 static const struct dmi_system_id silead_ts_dmi_table[] = {
 	{
 		/* CUBE iwork8 Air */
@@ -72,6 +85,14 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "jumperx.T87.KFBNEEA"),
 		},
 	},
+	{
+		/* DEXP Ursus 7W */
+		.driver_data = (void *)&dexp_ursus_7w_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "7W"),
+		},
+	},
 	{ },
 };
 
-- 
2.9.3
