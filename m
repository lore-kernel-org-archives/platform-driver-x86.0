From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 2/2] asus-nb-wmi: Add ASUSTeK COMPUTER INC. X200CA
Date: Wed,  2 Oct 2013 11:41:04 +0800
Message-ID: <1380685264-18619-2-git-send-email-acelan.kao@canonical.com>
References: <1380685264-18619-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:44574 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752568Ab3JBDlN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 1 Oct 2013 23:41:13 -0400
Received: by mail-pd0-f179.google.com with SMTP id v10so300179pde.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Oct 2013 20:41:13 -0700 (PDT)
In-Reply-To: <1380685264-18619-1-git-send-email-acelan.kao@canonical.com>
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
