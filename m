From: Ang Way Chuang <wcang79@gmail.com>
Subject: [PATCH]: Dell Vostro 3350 touchpad LED
Date: Thu, 12 Apr 2012 13:11:27 +0800
Message-ID: <4F8663FF.8020302@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:60509 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755165Ab2DLFLo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 Apr 2012 01:11:44 -0400
Received: by pbcun15 with SMTP id un15so1941330pbc.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Apr 2012 22:11:43 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>

Add Vostro 3350 into quirks so that the touchpad LED works.

Signed-off-by: Ang Way Chuang <wcang79@gmail.com>
---
diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index a05fc9c..a25d8d9 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -187,6 +187,15 @@ static struct dmi_system_id __devinitdata dell_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
+		.ident = "Dell Vostro 3350",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 3350"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
+	{
+		.callback = dmi_matched,
 		.ident = "Dell Vostro 3555",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
