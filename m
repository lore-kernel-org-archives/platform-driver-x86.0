From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH 4/4] Add support for two new systems: ASM200 & ASM201
Date: Thu, 21 Jan 2016 18:05:00 -0600
Message-ID: <1453421100-12984-5-git-send-email-mario_limonciello@dell.com>
References: <1453421100-12984-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxippc101.us.dell.com ([143.166.85.207]:49376 "EHLO
	ausxippc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751518AbcAVAIu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Jan 2016 19:08:50 -0500
In-Reply-To: <1453421100-12984-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/alienware-wmi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index e66c34d..eccd547 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -97,6 +97,20 @@ static struct quirk_entry quirk_asm100 = {
 	.deepslp = 0,
 };
 
+static struct quirk_entry quirk_asm200 = {
+	.num_zones = 2,
+	.hdmi_mux = 1,
+	.amplifier = 0,
+	.deepslp = 1,
+};
+
+static struct quirk_entry quirk_asm201 = {
+	.num_zones = 2,
+	.hdmi_mux = 1,
+	.amplifier = 1,
+	.deepslp = 1,
+};
+
 static int __init dmi_matched(const struct dmi_system_id *dmi)
 {
 	quirks = dmi->driver_data;
@@ -140,6 +154,24 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 		     },
 	 .driver_data = &quirk_asm100,
 	 },
+	{
+	 .callback = dmi_matched,
+	 .ident = "Alienware ASM200",
+	 .matches = {
+		     DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+		     DMI_MATCH(DMI_PRODUCT_NAME, "ASM200"),
+		     },
+	 .driver_data = &quirk_asm200,
+	 },
+	{
+	 .callback = dmi_matched,
+	 .ident = "Alienware ASM201",
+	 .matches = {
+		     DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+		     DMI_MATCH(DMI_PRODUCT_NAME, "ASM201"),
+		     },
+	 .driver_data = &quirk_asm201,
+	 },
 	{}
 };
 
-- 
1.9.1
