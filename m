From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: only supports AMW0_GUID1 on acer family
Date: Thu, 13 Oct 2016 07:32:18 +0800
Message-ID: <1476315138-20478-1-git-send-email-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36690 "EHLO
        mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933778AbcJMDq6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Oct 2016 23:46:58 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>

The AMW0_GUID1 wmi is not only found on Acer family but also other
machines like Lenovo, Fujitsu and Medion. In the past days, acer-wmi
driver handled those non-Acer machines by quirks list.

But actually acer-wmi driver was loaded on any machines that have
AMW0_GUID1. This behavior is strange because those machines should
be supported by appropriate wmi drivers. e.g. fujitsu-laptop,
ideapad-laptop.

So, This patch adds the logic to check the machine that has AMW0_GUID1
should be in Acer/Packard Bell/Gateway white list. But, it still keeps
the quirk list of those supported non-acer machines for backward
compatible.

Tested-by: Bjørn Mork <bjorn@mork.no>
Cc: Darren Hart <dvhart@infradead.org>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c | 56 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 3bb3162..734f0da 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -355,6 +355,32 @@ static const struct dmi_system_id acer_blacklist[] __initconst = {
 	{}
 };
 
+static const struct dmi_system_id amw0_whitelist[] __initconst = {
+	{
+		.ident = "Acer",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+		},
+	},
+	{
+		.ident = "Gateway",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Gateway"),
+		},
+	},
+	{
+		.ident = "Packard Bell",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Packard Bell"),
+		},
+	},
+	{}
+};
+
+/*
+ * This quirk table is only for Acer/Gateway/Packard Bell family
+ * that those machines are supported by acer-wmi driver.
+ */
 static const struct dmi_system_id acer_quirks[] __initconst = {
 	{
 		.callback = dmi_matched,
@@ -464,6 +490,17 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_travelmate_2490,
 	},
+	{}
+};
+
+/*
+ * This quirk list is for those non-acer machines that have AMW0_GUID1
+ * but supported by acer-wmi in past days. Keeping this quirk list here
+ * is only for backward compatible. Please do not add new machine to
+ * here anymore. Those non-acer machines should be supported by
+ * appropriate wmi drivers.
+ */
+static const struct dmi_system_id non_acer_quirks[] __initconst = {
 	{
 		.callback = dmi_matched,
 		.ident = "Fujitsu Siemens Amilo Li 1718",
@@ -598,6 +635,7 @@ static void __init find_quirks(void)
 {
 	if (!force_series) {
 		dmi_check_system(acer_quirks);
+		dmi_check_system(non_acer_quirks);
 	} else if (force_series == 2490) {
 		quirks = &quirk_acer_travelmate_2490;
 	}
@@ -2121,6 +2159,24 @@ static int __init acer_wmi_init(void)
 	find_quirks();
 
 	/*
+	 * The AMW0_GUID1 wmi is not only found on Acer family but also other
+	 * machines like Lenovo, Fujitsu and Medion. In the past days,
+	 * acer-wmi driver handled those non-Acer machines by quirks list.
+	 * But actually acer-wmi driver was loaded on any machines that have
+	 * AMW0_GUID1. This behavior is strange because those machines should
+	 * be supported by appropriate wmi drivers. e.g. fujitsu-laptop,
+	 * ideapad-laptop. So, here checks the machine that has AMW0_GUID1
+	 * should be in Acer/Gateway/Packard Bell white list, or it's already
+	 * in the past quirk list.
+	 */
+	if (wmi_has_guid(AMW0_GUID1) &&
+	    !dmi_check_system(amw0_whitelist) &&
+	    quirks == &quirk_unknown) {
+		pr_err("Unsupported machine has AMW0_GUID1, unable to load\n");
+		return -ENODEV;
+	}
+
+	/*
 	 * Detect which ACPI-WMI interface we're using.
 	 */
 	if (wmi_has_guid(AMW0_GUID1) && wmi_has_guid(WMID_GUID1))
-- 
2.1.4
