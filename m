From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH 1/4] Add support for new platform, X51-R3
Date: Thu, 21 Jan 2016 18:04:57 -0600
Message-ID: <1453421100-12984-2-git-send-email-mario_limonciello@dell.com>
References: <1453421100-12984-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxippc101.us.dell.com ([143.166.85.207]:49376 "EHLO
	ausxippc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750878AbcAVAIp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Jan 2016 19:08:45 -0500
In-Reply-To: <1453421100-12984-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/alienware-wmi.c | 44 ++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index 1e1e594..dcd4f81 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -69,11 +69,16 @@ static struct quirk_entry quirk_unknown = {
 	.hdmi_mux = 0,
 };
 
-static struct quirk_entry quirk_x51_family = {
+static struct quirk_entry quirk_x51_r1_r2 = {
 	.num_zones = 3,
 	.hdmi_mux = 0.
 };
 
+static struct quirk_entry quirk_x51_r3 = {
+	.num_zones = 4,
+	.hdmi_mux = 0,
+};
+
 static struct quirk_entry quirk_asm100 = {
 	.num_zones = 2,
 	.hdmi_mux = 1,
@@ -88,12 +93,12 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
 static const struct dmi_system_id alienware_quirks[] __initconst = {
 	{
 	 .callback = dmi_matched,
-	 .ident = "Alienware X51 R1",
+	 .ident = "Alienware X51 R3",
 	 .matches = {
 		     DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-		     DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51"),
+		     DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R3"),
 		     },
-	 .driver_data = &quirk_x51_family,
+	 .driver_data = &quirk_x51_r3,
 	 },
 	{
 	 .callback = dmi_matched,
@@ -102,17 +107,26 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 		     DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
 		     DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R2"),
 		     },
-	 .driver_data = &quirk_x51_family,
+	 .driver_data = &quirk_x51_r1_r2,
+	 },
+	{
+	 .callback = dmi_matched,
+	 .ident = "Alienware X51 R1",
+	 .matches = {
+		     DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+		     DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51"),
+		     },
+	 .driver_data = &quirk_x51_r1_r2,
 	 },
 	{
-		.callback = dmi_matched,
-		.ident = "Alienware ASM100",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "ASM100"),
-		},
-		.driver_data = &quirk_asm100,
-	},
+	 .callback = dmi_matched,
+	 .ident = "Alienware ASM100",
+	 .matches = {
+		     DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+		     DMI_MATCH(DMI_PRODUCT_NAME, "ASM100"),
+		     },
+	 .driver_data = &quirk_asm100,
+	 },
 	{}
 };
 
@@ -477,7 +491,7 @@ static ssize_t show_hdmi_cable(struct device *dev,
 	};
 	status =
 	    alienware_hdmi_command(&in_args, WMAX_METHOD_HDMI_CABLE,
-				   (u32 *) &out_data);
+				   (u32 *) & out_data);
 	if (ACPI_SUCCESS(status)) {
 		if (out_data == 0)
 			return scnprintf(buf, PAGE_SIZE,
@@ -500,7 +514,7 @@ static ssize_t show_hdmi_source(struct device *dev,
 	};
 	status =
 	    alienware_hdmi_command(&in_args, WMAX_METHOD_HDMI_STATUS,
-				   (u32 *) &out_data);
+				   (u32 *) & out_data);
 
 	if (ACPI_SUCCESS(status)) {
 		if (out_data == 1)
-- 
1.9.1
