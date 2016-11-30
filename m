From: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Subject: [PATCH v3 RESEND] platform/x86/asus-nb-wmi.c: Add X45U quirk
Date: Tue, 29 Nov 2016 23:23:06 -0200
Message-ID: <20161130012307.8059-1-marcos.souza.org@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:36198 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753195AbcK3BXQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Nov 2016 20:23:16 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
Cc: andy.shevchenko@gmail.com, stable@vger.kernel.org, Marcos Paulo de Souza <marcos.souza.org@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Without this patch, the Asus X45U wireless card can't be turned
on (hard-blocked), but after a suspend/resume it just starts working.

Following this bug report[1], there are other cases like this one, but
this Asus is the only model that I can test.

[1] https://ubuntuforums.org/showthread.php?t=2181558

Cc: stable@vger.kernel.org # 4.4.x-
Signed-off-by: Marcos Paulo de Souza <marcos.souza.org@gmail.com>

---
v2 -> v3:
 Add stable version in the CC line of stable email address
v1 -> v2:
 Add stable copy and specify the stable version to apply this patch

 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 26e4cbc..6032b70 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -175,6 +175,15 @@ static const struct dmi_system_id asus_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X45U",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X45U"),
+		},
+		.driver_data = &quirk_asus_wapf4,
+	},
+	{
+		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. X456UA",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.7.4
