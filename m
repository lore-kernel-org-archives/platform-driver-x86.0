From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 01/14] platform/x86: acer-wmi: remove sparse_keymap_free() calls
Date: Thu,  9 Mar 2017 13:11:37 +0100
Message-ID: <20170309121150.10553-2-kernel@kempniu.pl>
References: <20170309121150.10553-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35718 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752157AbdCIMML (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2017 07:12:11 -0500
Received: by mail-lf0-f66.google.com with SMTP id v2so4477393lfi.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2017 04:12:10 -0800 (PST)
In-Reply-To: <20170309121150.10553-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <jlee@suse.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

As sparse_keymap_setup() now uses a managed memory allocation for the
keymap copy it creates, the latter is freed automatically.  Remove all
calls to sparse_keymap_free().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/acer-wmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index dac0fbe87460..8a27f0be1aec 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1987,7 +1987,7 @@ static int __init acer_wmi_input_setup(void)
 						acer_wmi_notify, NULL);
 	if (ACPI_FAILURE(status)) {
 		err = -EIO;
-		goto err_free_keymap;
+		goto err_free_dev;
 	}
 
 	err = input_register_device(acer_wmi_input_dev);
@@ -1998,8 +1998,6 @@ static int __init acer_wmi_input_setup(void)
 
 err_uninstall_notifier:
 	wmi_remove_notify_handler(ACERWMID_EVENT_GUID);
-err_free_keymap:
-	sparse_keymap_free(acer_wmi_input_dev);
 err_free_dev:
 	input_free_device(acer_wmi_input_dev);
 	return err;
@@ -2008,7 +2006,6 @@ static int __init acer_wmi_input_setup(void)
 static void acer_wmi_input_destroy(void)
 {
 	wmi_remove_notify_handler(ACERWMID_EVENT_GUID);
-	sparse_keymap_free(acer_wmi_input_dev);
 	input_unregister_device(acer_wmi_input_dev);
 }
 
-- 
2.12.0
