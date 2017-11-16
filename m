From: Chang Liu <foggy.liu@gmail.com>
Subject: [PATCH] platform/x86 alienware-wmi: lightbar LED support for Dell Inspiron 5675.
Date: Thu, 16 Nov 2017 10:35:07 +0800
Message-ID: <1510799707-3532-1-git-send-email-chang_liu4@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:54824 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757810AbdKPCfW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Nov 2017 21:35:22 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mario_limonciello@dell.com, Chang Liu <chang_liu4@dell.com>

Inspiron 5675 lightbar compatible with wmi interface on alienware,
the difference lies in the zone number and color control.
Add Inspiron 5675 DMI quirks to detect by dmi_check_system.

Signed-off-by: Chang Liu <chang_liu4@dell.com>
---
 drivers/platform/x86/alienware-wmi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index 4eb8e1a..9d7dbd9 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -68,6 +68,14 @@ struct quirk_entry {
 
 static struct quirk_entry *quirks;
 
+
+static struct quirk_entry quirk_inspiron5675 = {
+	.num_zones = 2,
+	.hdmi_mux = 0,
+	.amplifier = 0,
+	.deepslp = 0,
+};
+
 static struct quirk_entry quirk_unknown = {
 	.num_zones = 2,
 	.hdmi_mux = 0,
@@ -171,6 +179,15 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 		     },
 	 .driver_data = &quirk_asm201,
 	 },
+	 {
+	 .callback = dmi_matched,
+	 .ident = "Dell Inc. Inspiron 5675",
+	 .matches = {
+		     DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+		     DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5675"),
+		     },
+	 .driver_data = &quirk_inspiron5675,
+	 },
 	{}
 };
 
-- 
2.7.4
