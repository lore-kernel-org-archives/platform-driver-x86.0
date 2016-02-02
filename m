From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v2 2/5] Add support for new platform: X51-R3
Date: Mon,  1 Feb 2016 20:28:48 -0600
Message-ID: <1454380131-24662-3-git-send-email-mario_limonciello@dell.com>
References: <1454380131-24662-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60ps301.us.dell.com ([143.166.148.206]:24798 "EHLO
	ausc60ps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754070AbcBBCc6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 1 Feb 2016 21:32:58 -0500
In-Reply-To: <1454380131-24662-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

The X51-R3 is in the X51 family.  It includes 3 internal
lighting zones as well as is the first AW desktop that
includes support for a graphics amplifier.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/alienware-wmi.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index a8750ed..8e8ea4f 100644
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
@@ -102,7 +107,16 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
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
 	 .callback = dmi_matched,
-- 
1.9.1
