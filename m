From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v2 1/5] Clean up whitespace for ASM100 platform
Date: Mon,  1 Feb 2016 20:28:47 -0600
Message-ID: <1454380131-24662-2-git-send-email-mario_limonciello@dell.com>
References: <1454380131-24662-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60ps301.us.dell.com ([143.166.148.206]:24798 "EHLO
	ausc60ps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754056AbcBBCc5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 1 Feb 2016 21:32:57 -0500
In-Reply-To: <1454380131-24662-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

This brings them more in line with the usage of whitespace
in other platforms.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/alienware-wmi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index 1e1e594..a8750ed 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -105,14 +105,14 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 	 .driver_data = &quirk_x51_family,
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
 
-- 
1.9.1
