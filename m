From: Daniel Drake <drake@endlessm.com>
Subject: [PATCH] asus-nb-wmi: Add wapf=4 quirk for X456UA/X456UF
Date: Wed,  2 Sep 2015 16:10:34 -0600
Message-ID: <1441231834-12873-1-git-send-email-drake@endlessm.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:36635 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932097AbbIBWK4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 2 Sep 2015 18:10:56 -0400
Received: by pacwi10 with SMTP id wi10so24160095pac.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Sep 2015 15:10:56 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com, dvhart@infradead.org
Cc: acelan.kao@canonical.com, carlo@endlessm.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

These laptops boot with wifi as hard-blocked, with no obvious way to
enable it. Using a quirk to set wapf=4 solves the problem.

Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index abdaed3..131fee2 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -128,6 +128,24 @@ static const struct dmi_system_id asus_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X456UA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X456UA"),
+		},
+		.driver_data = &quirk_asus_wapf4,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X456UF",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X456UF"),
+		},
+		.driver_data = &quirk_asus_wapf4,
+	},
+	{
+		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. X501U",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.1.4
