From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH] platform/x86: dell-laptop: Allocate buffer before rfkill use
Date: Wed, 15 Nov 2017 14:21:13 -0600
Message-ID: <1510777273-31322-1-git-send-email-mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa4.dell-outbound.iphmx.com ([68.232.149.214]:17243 "EHLO
        esa4.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S933579AbdKOUVW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Nov 2017 15:21:22 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, valdis.kletnieks@vt.edu, Mario Limonciello <mario.limonciello@dell.com>

On machines using rfkill interface the buffer needs to have been
allocated before the initial use (memset) of it.

Reported-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-laptop.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index c4903c5..2d70436 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -2073,6 +2073,11 @@ static int __init dell_init(void)
 	if (ret)
 		goto fail_platform_device2;
 
+	buffer = kzalloc(sizeof(struct calling_interface_buffer), GFP_KERNEL);
+	if (!buffer)
+		goto fail_buffer;
+
+
 	ret = dell_setup_rfkill();
 
 	if (ret) {
@@ -2080,10 +2085,6 @@ static int __init dell_init(void)
 		goto fail_rfkill;
 	}
 
-	buffer = kzalloc(sizeof(struct calling_interface_buffer), GFP_KERNEL);
-	if (!buffer)
-		goto fail_buffer;
-
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_init(&platform_device->dev);
 
-- 
2.7.4
