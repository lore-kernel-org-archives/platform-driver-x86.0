From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: silead_dmi: Add touchscreen info for SurfTab twin 10.1
Date: Sun, 26 Nov 2017 19:32:58 +0100
Message-ID: <20171126183258.10758-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:36418 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751297AbdKZSdB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Nov 2017 13:33:01 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Bernhard=20=C3=9Cbelacker?= <bernhardu@mailbox.org>

From: Bernhard Übelacker <bernhardu@mailbox.org>

Add touchscreen info for the Trekstor SurfTab twin 10.1 ST10432-8
tablet. Resolution based on output of evemu-record.

Signed-off-by: Bernhard Übelacker <bernhardu@mailbox.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index 266535c2a72f..9a3da53202cb 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -67,6 +67,21 @@ static const struct silead_ts_dmi_data dexp_ursus_7w_data = {
 	.properties	= dexp_ursus_7w_props,
 };
 
+static const struct property_entry surftab_twin_10_1_st10432_8_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1900),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
+	PROPERTY_ENTRY_U32("touchscreen-inverted-y", 1),
+	PROPERTY_ENTRY_STRING("firmware-name",
+			      "gsl3670-surftab-twin-10-1-st10432-8.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	{ }
+};
+
+static const struct silead_ts_dmi_data surftab_twin_10_1_st10432_8_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= surftab_twin_10_1_st10432_8_props,
+};
+
 static const struct property_entry surftab_wintron70_st70416_6_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 884),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 632),
@@ -198,6 +213,14 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "7W"),
 		},
 	},
+	{
+		/* TrekStor SurfTab twin 10.1 ST10432-8 */
+		.driver_data = (void *)&surftab_twin_10_1_st10432_8_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TrekStor"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "SurfTab twin 10.1"),
+		},
+	},
 	{
 		/* Trekstor Surftab Wintron 7.0 ST70416-6 */
 		.driver_data = (void *)&surftab_wintron70_st70416_6_data,
-- 
2.14.3
