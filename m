From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 2/2] asus-nb-wmi: Add ASUSTeK COMPUTER INC. X200CA
Date: Wed,  9 Jul 2014 16:18:19 +0800
Message-ID: <1404893899-10082-2-git-send-email-acelan.kao@canonical.com>
References: <1404893899-10082-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:63016 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754915AbaGIIS3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Jul 2014 04:18:29 -0400
Received: by mail-pa0-f41.google.com with SMTP id fb1so8877277pad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jul 2014 01:18:29 -0700 (PDT)
In-Reply-To: <1404893899-10082-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Corentin Chary <corentin.chary@gmail.com>

BIOS won't light on the wifi-led after S3, so asus-wmi driver needs to
control the wifi and wifi-led status.
But, it'll lead to bt status error if asus-wmi driver controls bt as well.
So, for X200CA, asus-wmi driver controls wifi status only and have to set
wapf to 1.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 563f59e..32a177b 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -74,6 +74,10 @@ static struct quirk_entry quirk_asus_x401u = {
 	.wapf = 4,
 };
 
+static struct quirk_entry quirk_asus_x200ca = {
+	.wapf = 2,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	quirks = dmi->driver_data;
@@ -198,6 +202,15 @@ static struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_x401u,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X200CA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X200CA"),
+		},
+		.driver_data = &quirk_asus_x200ca,
+	},
 	{},
 };
 
-- 
1.8.3.2
