From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 10/14] platform/x86: msi-wmi: remove sparse_keymap_free() calls
Date: Thu,  9 Mar 2017 13:11:46 +0100
Message-ID: <20170309121150.10553-11-kernel@kempniu.pl>
References: <20170309121150.10553-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35832 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932095AbdCIMMl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2017 07:12:41 -0500
Received: by mail-lf0-f67.google.com with SMTP id v2so4478341lfi.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2017 04:12:39 -0800 (PST)
In-Reply-To: <20170309121150.10553-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

As sparse_keymap_setup() now uses a managed memory allocation for the
keymap copy it creates, the latter is freed automatically.  Remove all
calls to sparse_keymap_free().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/msi-wmi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index 9a32f8627ecc..f6209b739ec0 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -281,14 +281,12 @@ static int __init msi_wmi_input_setup(void)
 	err = input_register_device(msi_wmi_input_dev);
 
 	if (err)
-		goto err_free_keymap;
+		goto err_free_dev;
 
 	last_pressed = 0;
 
 	return 0;
 
-err_free_keymap:
-	sparse_keymap_free(msi_wmi_input_dev);
 err_free_dev:
 	input_free_device(msi_wmi_input_dev);
 	return err;
@@ -342,10 +340,8 @@ static int __init msi_wmi_init(void)
 	if (event_wmi)
 		wmi_remove_notify_handler(event_wmi->guid);
 err_free_input:
-	if (event_wmi) {
-		sparse_keymap_free(msi_wmi_input_dev);
+	if (event_wmi)
 		input_unregister_device(msi_wmi_input_dev);
-	}
 	return err;
 }
 
@@ -353,7 +349,6 @@ static void __exit msi_wmi_exit(void)
 {
 	if (event_wmi) {
 		wmi_remove_notify_handler(event_wmi->guid);
-		sparse_keymap_free(msi_wmi_input_dev);
 		input_unregister_device(msi_wmi_input_dev);
 	}
 	backlight_device_unregister(backlight);
-- 
2.12.0
