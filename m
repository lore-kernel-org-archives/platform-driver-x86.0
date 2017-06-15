From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] platform/x86: silead_dmi: Add touchscreen info for PoV mobii wintab p800w
Date: Thu, 15 Jun 2017 08:48:31 +0200
Message-ID: <20170615064832.4148-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:34834 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750784AbdFOGse (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Jun 2017 02:48:34 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Add touchscreen info for the Point of View mobii wintab p800w tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index db3a877d2160..46c5e1ebfb53 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -93,6 +93,20 @@ static const struct silead_ts_dmi_data gp_electronic_t701_data = {
 	.properties	= gp_electronic_t701_props,
 };
 
+static const struct property_entry pov_mobii_wintab_p800w_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1800),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1150),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name",
+			      "gsl3692-pov-mobii-wintab-p800w.fw"),
+	{ }
+};
+
+static const struct silead_ts_dmi_data pov_mobii_wintab_p800w_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= pov_mobii_wintab_p800w_props,
+};
+
 static const struct dmi_system_id silead_ts_dmi_table[] = {
 	{
 		/* CUBE iwork8 Air */
@@ -139,6 +153,17 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "BYT70A.YNCHENG.WIN.007"),
 		},
 	},
+	{
+		/* Point of View mobii wintab p800w */
+		.driver_data = (void *)&pov_mobii_wintab_p800w_data,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+			DMI_MATCH(DMI_BIOS_VERSION, "3BAIR1013"),
+			/* Above matches are too generic, add bios-date match */
+			DMI_MATCH(DMI_BIOS_DATE, "08/22/2014"),
+		},
+	},
 	{ },
 };
 
-- 
2.13.0
