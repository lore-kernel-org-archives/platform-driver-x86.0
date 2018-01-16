From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: silead_dmi: Add entry for newer BIOS for Trekstor Surftab 7.0
Date: Tue, 16 Jan 2018 20:24:15 +0100
Message-ID: <20180116192415.16190-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Some versions of the Trekstor Surftab 7.0 ship with a newer BIOS which uses
different DMI strings.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index 713446ee3b61..3865944d1b9f 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -292,6 +292,17 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "TREK.G.WI71C.JGBMRBA04"),
 		},
 	},
+	{
+		/* Trekstor Surftab Wintron 7.0 ST70416-6, newer BIOS */
+		.driver_data = (void *)&surftab_wintron70_st70416_6_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TrekStor"),
+			DMI_MATCH(DMI_PRODUCT_NAME,
+					     "SurfTab wintron 7.0 ST70416-6"),
+			/* Exact match, different versions need different fw */
+			DMI_MATCH(DMI_BIOS_VERSION, "TREK.G.WI71C.JGBMRBA05"),
+		},
+	},
 	{
 		/* Ployer Momo7w (same hardware as the Trekstor ST70416-6) */
 		.driver_data = (void *)&surftab_wintron70_st70416_6_data,
-- 
2.14.3
