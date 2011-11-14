From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] intel-oaktrail: switch to using use MODULE_DEVICE_TABLE
Date: Mon, 14 Nov 2011 00:27:00 -0800
Message-ID: <1321259220-10534-1-git-send-email-dmitry.torokhov@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:38266 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752507Ab1KNI1F (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Nov 2011 03:27:05 -0500
Received: by yenr9 with SMTP id r9so4898003yen.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Nov 2011 00:27:04 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

Use MODULE_DEVCE_TABLE instead of rolling MODULE_ALIAS by hand.

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---
 drivers/platform/x86/intel_oaktrail.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/intel_oaktrail.c b/drivers/platform/x86/intel_oaktrail.c
index 7f88c79..62a1258 100644
--- a/drivers/platform/x86/intel_oaktrail.c
+++ b/drivers/platform/x86/intel_oaktrail.c
@@ -313,6 +313,7 @@ static struct dmi_system_id __initdata oaktrail_dmi_table[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(dmi, oaktrail_dmi_table);
 
 static int __init oaktrail_init(void)
 {
@@ -394,4 +395,3 @@ MODULE_AUTHOR("Yin Kangkai (kangkai.yin@intel.com)");
 MODULE_DESCRIPTION("Intel Oaktrail Platform ACPI Extras");
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("dmi:*:svnIntelCorporation:pnOakTrailplatform:*");
-- 
1.7.6.4
