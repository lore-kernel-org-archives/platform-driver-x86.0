From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v3 5/6] alienware-wmi: Add support for two new systems: ASM200 and ASM201.
Date: Tue,  2 Feb 2016 15:38:56 -0600
Message-ID: <1454449137-16478-6-git-send-email-mario_limonciello@dell.com>
References: <1454449137-16478-1-git-send-email-mario_limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454449137-16478-1-git-send-email-mario_limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Both of these systems support:
* 2 lighting control zones
* HDMI mux control
* deep sleep control (to enable wakup from controller)

The ASM201 also supports the external graphics amplifier.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/alienware-wmi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index 55967dc..0cbcda1 100644
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
