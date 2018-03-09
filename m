From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: silead_dmi: Add entry for the Yours Y8W81 tablet
Date: Fri,  9 Mar 2018 15:03:58 +0100
Message-ID: <20180309140358.11432-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add an entry with touchscreen info for the Yours Y8W81 8" tablet.

This tablet has the same case and mostly the same internals as the Chuwi
Vi8. Both seem to be from an ODM called inet-tek. Both are labelled:
"INET-I86M-REVxx" on the PCB, with the Chuwi Vi8 being REV03 (and having
an ALC5640 audio codec) and the Yours Y8W81 being REV21 (and having an
ALC5651 audio codec). The wifi, accelerometer and touchscreen are
identical on both.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index 1091539fa230..452aacabaa8e 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -455,6 +455,14 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "itWORKS.G.WI71C.JGBMRB"),
 		},
 	},
+	{
+		/* Yours Y8W81, same case and touchscreen as Chuwi Vi8 */
+		.driver_data = (void *)&chuwi_vi8_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "YOURS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Y8W81"),
+		},
+	},
 	{ },
 };
 
-- 
2.14.3
