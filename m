From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: silead_dmi: Add entry for the Trekstor Primebook C13
Date: Mon, 25 Dec 2017 13:45:25 +0100
Message-ID: <20171225124525.7536-2-hdegoede@redhat.com>
References: <20171225124525.7536-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:53282 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752204AbdLYMp3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Dec 2017 07:45:29 -0500
In-Reply-To: <20171225124525.7536-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Add touchscreen platform data for the Trekstor Primebook C13 laptop.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index 09b589fb79d4..713446ee3b61 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -232,6 +232,21 @@ static const struct silead_ts_dmi_data chuwi_vi8_data = {
 	.properties     = chuwi_vi8_props,
 };
 
+static const struct property_entry trekstor_primebook_c13_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 2624),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1920),
+	PROPERTY_ENTRY_STRING("firmware-name",
+			      "gsl1680-trekstor-primebook-c13.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct silead_ts_dmi_data trekstor_primebook_c13_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= trekstor_primebook_c13_props,
+};
+
 static const struct dmi_system_id silead_ts_dmi_table[] = {
 	{
 		/* CUBE iwork8 Air */
@@ -365,6 +380,14 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "CHUWI.D86JLBNR"),
 		},
 	},
+	{
+		/* Trekstor Primebook C13 */
+		.driver_data = (void *)&trekstor_primebook_c13_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TREKSTOR"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Primebook C13"),
+		},
+	},
 	{ },
 };
 
-- 
2.14.3
