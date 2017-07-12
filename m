From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: silead_dmi: Add entry for Ployer Momo7w tablet touchscreen
Date: Wed, 12 Jul 2017 13:15:11 +0200
Message-ID: <20170712111511.18758-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:37324 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755296AbdGLLPO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jul 2017 07:15:14 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This Ployer Momo7w revision has the same hardware as the Trekstor
ST70416-6, so we re-use the surftab_wintron70_st70416_6_data.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index f9e840aa5592..1157a7b646d6 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -174,6 +174,16 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
 		},
 	},
 	{
+		/* Ployer Momo7w (same hardware as the Trekstor ST70416-6) */
+		.driver_data = (void *)&surftab_wintron70_st70416_6_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Shenzhen PLOYER"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MOMO7W"),
+			/* Exact match, different versions need different fw */
+			DMI_MATCH(DMI_BIOS_VERSION, "MOMO.G.WI71C.MABMRBA02"),
+		},
+	},
+	{
 		/* GP-electronic T701 */
 		.driver_data = (void *)&gp_electronic_t701_data,
 		.matches = {
-- 
2.13.0
