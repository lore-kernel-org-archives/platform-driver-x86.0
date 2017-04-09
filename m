From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] drivers/platform/x86: silead_dmi: Add touchscreen info for Surftab Wintron 7.0
Date: Sun,  9 Apr 2017 11:07:44 +0200
Message-ID: <20170409090744.9575-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42010 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751814AbdDIJHs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2017 05:07:48 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org

Add touchscreen info for the Trekstor Surftab Wintron 7.0 ST70416-6
tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index 26b388d..d63ebb7 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -66,6 +66,20 @@ static const struct silead_ts_dmi_data dexp_ursus_7w_data = {
 	.properties	= dexp_ursus_7w_props,
 };
 
+static const struct property_entry surftab_wintron70_st70416_6_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 884),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 632),
+	PROPERTY_ENTRY_STRING("firmware-name",
+			      "gsl1686-surftab-wintron70-st70416-6.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	{ }
+};
+
+static const struct silead_ts_dmi_data surftab_wintron70_st70416_6_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= surftab_wintron70_st70416_6_props,
+};
+
 static const struct dmi_system_id silead_ts_dmi_table[] = {
 	{
 		/* CUBE iwork8 Air */
@@ -93,6 +107,16 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "7W"),
 		},
 	},
+	{
+		/* Trekstor Surftab Wintron 7.0 ST70416-6 */
+		.driver_data = (void *)&surftab_wintron70_st70416_6_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ST70416-6"),
+			/* Exact match, different versions need different fw */
+			DMI_MATCH(DMI_BIOS_VERSION, "TREK.G.WI71C.JGBMRBA04"),
+		},
+	},
 	{ },
 };
 
-- 
2.9.3
