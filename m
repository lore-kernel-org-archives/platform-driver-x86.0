From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] dell-laptop: switch to using use MODULE_DEVICE_TABLE
Date: Mon, 14 Nov 2011 00:25:00 -0800
Message-ID: <1321259100-10454-1-git-send-email-dmitry.torokhov@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:53465 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752269Ab1KNIZF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Nov 2011 03:25:05 -0500
Received: by gyc15 with SMTP id 15so4637081gyc.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Nov 2011 00:25:05 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

Use MODULE_DEVCE_TABLE instead of rolling MODULE_ALIAS by hand.

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---
 drivers/platform/x86/dell-laptop.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 12fc459..5f000a4 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -101,6 +101,7 @@ static const struct dmi_system_id __initdata dell_device_table[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(dmi, dell_device_table);
 
 static struct dmi_system_id __devinitdata dell_blacklist[] = {
 	/* Supported by compal-laptop */
@@ -718,6 +719,3 @@ module_exit(dell_exit);
 MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
 MODULE_DESCRIPTION("Dell laptop driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("dmi:*svnDellInc.:*:ct8:*");
-MODULE_ALIAS("dmi:*svnDellInc.:*:ct9:*");
-MODULE_ALIAS("dmi:*svnDellComputerCorporation.:*:ct8:*");
-- 
1.7.6.4
