From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH 1/3] Add support for X51-R3
Date: Wed, 27 May 2015 14:37:00 -0500
Message-ID: <1432755422-26024-2-git-send-email-mario_limonciello@dell.com>
References: <1432755422-26024-1-git-send-email-mario_limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432755422-26024-1-git-send-email-mario_limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.garrett@nebula.com
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Upcoming platform X51-R3 will support 4 LED zones.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/alienware-wmi.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index 1e1e594..69f9d72 100644
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
