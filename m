From: Edward Lin <yidi.lin@canonical.com>
Subject: [PATCH] dell-laptop: Enable rfkill on Inspiron 3437
Date: Wed,  7 May 2014 15:10:03 +0800
Message-ID: <1399446603-8467-1-git-send-email-yidi.lin@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175]:62305 "EHLO
	mail-vc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751129AbaEGHKV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 May 2014 03:10:21 -0400
Received: by mail-vc0-f175.google.com with SMTP id lh4so717390vcb.34
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 May 2014 00:10:20 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org
Cc: yidi.lin@canonical.com, yk@canonical.com

Create a rfkill whitelist for the specific models.
Add Inspiron 3437 to rfkill whitelist.

Signed-off-by: Edward Lin <yidi.lin@canonical.com>
---
 drivers/platform/x86/dell-laptop.c |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index fed4111..4ead97e 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -271,6 +271,17 @@ static struct dmi_system_id dell_quirks[] = {
 	{ }
 };
 
+static struct dmi_system_id dell_rfkill_whitelist[] = {
+	{
+		.ident = "Dell Inspiron 3437",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 3437"),
+		},
+	},
+	{}
+};
+
 static struct calling_interface_buffer *buffer;
 static struct page *bufferpage;
 static DEFINE_MUTEX(buffer_mutex);
@@ -597,7 +608,7 @@ static int __init dell_setup_rfkill(void)
 	if (product &&  (strncmp(product, "Latitude", 8) == 0 ||
 			 strncmp(product, "Precision", 9) == 0))
 		whitelisted = 1;
-	if (!force_rfkill && !whitelisted)
+	if (!force_rfkill && !whitelisted && !dmi_check_system(dell_rfkill_whitelist))
 		return 0;
 
 	get_buffer();
-- 
1.7.9.5
