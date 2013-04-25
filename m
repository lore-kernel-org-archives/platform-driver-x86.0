From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] asus-nb-wmi: set wapf=4 for ASUSTeK COMPUTER INC. X75A
Date: Thu, 25 Apr 2013 15:11:07 +0800
Message-ID: <1366873867-17542-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-da0-f53.google.com ([209.85.210.53]:62827 "EHLO
	mail-da0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751120Ab3DYHLM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 25 Apr 2013 03:11:12 -0400
Received: by mail-da0-f53.google.com with SMTP id n34so1275652dal.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Apr 2013 00:11:12 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Corentin Chary <corentin.chary@gmail.com>

BugLink: http://bugs.launchpad.net/bugs/1172151

Need to set wapf to 4 for ASUSTeK COMPUTER INC. X75A, so that
user can toggle wifi function through function key correctly.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 210b5b8..8fcb41e 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -171,6 +171,15 @@ static struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_x401u,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X75A",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X75A"),
+		},
+		.driver_data = &quirk_asus_x401u,
+	},
 	{},
 };
 
-- 
1.8.1.2
