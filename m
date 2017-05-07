From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: silead_dmi: Add touchscreen info for GP-electronic T701
Date: Sun,  7 May 2017 14:35:15 +0200
Message-ID: <20170507123515.12671-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:37164 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932204AbdEGWDf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 7 May 2017 18:03:35 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org

Add touchscreen info for the GP-electronic T701 tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index a3a57d93cf06..db3a877d2160 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -80,6 +80,19 @@ static const struct silead_ts_dmi_data surftab_wintron70_st70416_6_data = {
 	.properties	= surftab_wintron70_st70416_6_props,
 };
 
+static const struct property_entry gp_electronic_t701_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 960),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 640),
+	PROPERTY_ENTRY_STRING("firmware-name",
+			      "gsl1680-gp-electronic-t701.fw"),
+	{ }
+};
+
+static const struct silead_ts_dmi_data gp_electronic_t701_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= gp_electronic_t701_props,
+};
+
 static const struct dmi_system_id silead_ts_dmi_table[] = {
 	{
 		/* CUBE iwork8 Air */
@@ -117,6 +130,15 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "TREK.G.WI71C.JGBMRBA04"),
 		},
 	},
+	{
+		/* GP-electronic T701 */
+		.driver_data = (void *)&gp_electronic_t701_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "T701"),
+			DMI_MATCH(DMI_BIOS_VERSION, "BYT70A.YNCHENG.WIN.007"),
+		},
+	},
 	{ },
 };
 
-- 
2.12.2
