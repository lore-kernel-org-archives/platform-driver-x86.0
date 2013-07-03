From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] asus-nb-wmi: set wapf=4 for ASUSTeK COMPUTER INC. 1015E/U
Date: Wed,  3 Jul 2013 14:35:15 +0800
Message-ID: <1372833315-16166-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:50284 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753838Ab3GCGfV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 3 Jul 2013 02:35:21 -0400
Received: by mail-pd0-f173.google.com with SMTP id v14so4282629pde.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jul 2013 23:35:20 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Corentin Chary <corentin.chary@gmail.com>

Need to set wapf to 4 for ASUSTeK COMPUTER INC. 1015E/U, so that
user can toggle wifi function through function key correctly.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 8fcb41e..b44fa5e 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -180,6 +180,24 @@ static struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_x401u,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. 1015E",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "1015E"),
+		},
+		.driver_data = &quirk_asus_x401u,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. 1015U",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "1015U"),
+		},
+		.driver_data = &quirk_asus_x401u,
+	},
 	{},
 };
 
-- 
1.8.1.2
