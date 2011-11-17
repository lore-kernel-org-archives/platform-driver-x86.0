From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] dell-laptop: add 3 machines that has touchpad LED
Date: Thu, 17 Nov 2011 15:30:42 +0800
Message-ID: <1321515042-17089-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:42450 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752032Ab1KQHat (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 17 Nov 2011 02:30:49 -0500
Received: by yenq3 with SMTP id q3so687318yen.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2011 23:30:48 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

Add "Vostro 3555", "Inspiron N311z", and "Inspiron M5110" into quirks,
so that they could have touchpad LED function work.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/dell-laptop.c |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index a43cfd9..71025ea 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -184,6 +184,33 @@ static struct dmi_system_id __devinitdata dell_quirks[] = {
 		},
 		.driver_data = &quirk_dell_vostro_v130,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Vostro 3555",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 3555"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron N311z",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron N311z"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron M5110",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron M5110"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
 };
 
 static struct calling_interface_buffer *buffer;
-- 
1.7.5.4
