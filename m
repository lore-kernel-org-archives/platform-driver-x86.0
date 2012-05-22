From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] dell-laptop: Add touchpad led support for Dell V3450
Date: Tue, 22 May 2012 12:38:51 +0800
Message-ID: <1337661531-31469-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:49289 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752751Ab2EVEi5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 22 May 2012 00:38:57 -0400
Received: by mail-pz0-f46.google.com with SMTP id y13so7706401dad.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 May 2012 21:38:56 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

Add Dell Vostro 3450 quirk to support touchpad LED.

CC: Mariusz Fik <fisiu@opensuse.org>
Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/dell-laptop.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 255040b..c188d43 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -248,6 +248,15 @@ static struct dmi_system_id __devinitdata dell_quirks[] = {
 		},
 		.driver_data = &quirk_dell_vostro_v130,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Vostro 3450",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell System Vostro 3450"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
 	{ }
 };
 
-- 
1.7.9.5
