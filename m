From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 11/14] platform/x86: panasonic-laptop: remove sparse_keymap_free() calls
Date: Thu,  9 Mar 2017 13:11:47 +0100
Message-ID: <20170309121150.10553-12-kernel@kempniu.pl>
References: <20170309121150.10553-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34819 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932206AbdCIMMn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2017 07:12:43 -0500
Received: by mail-lf0-f68.google.com with SMTP id v2so4478403lfi.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2017 04:12:42 -0800 (PST)
In-Reply-To: <20170309121150.10553-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Harald Welte <laforge@gnumonks.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

As sparse_keymap_setup() now uses a managed memory allocation for the
keymap copy it creates, the latter is freed automatically.  Remove all
calls to sparse_keymap_free().

As this reduces acpi_pcc_destroy_input() to one line, replace all calls
to that function with direct calls to input_unregister_device().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/panasonic-laptop.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 59b8eb626dcc..975f4e100dbd 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -520,29 +520,17 @@ static int acpi_pcc_init_input(struct pcc_acpi *pcc)
 	if (error) {
 		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
 				  "Unable to register input device\n"));
-		goto err_free_keymap;
+		goto err_free_dev;
 	}
 
 	pcc->input_dev = input_dev;
 	return 0;
 
- err_free_keymap:
-	sparse_keymap_free(input_dev);
  err_free_dev:
 	input_free_device(input_dev);
 	return error;
 }
 
-static void acpi_pcc_destroy_input(struct pcc_acpi *pcc)
-{
-	sparse_keymap_free(pcc->input_dev);
-	input_unregister_device(pcc->input_dev);
-	/*
-	 * No need to input_free_device() since core input API refcounts
-	 * and free()s the device.
-	 */
-}
-
 /* kernel module interface */
 
 #ifdef CONFIG_PM_SLEEP
@@ -640,7 +628,7 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 out_backlight:
 	backlight_device_unregister(pcc->backlight);
 out_input:
-	acpi_pcc_destroy_input(pcc);
+	input_unregister_device(pcc->input_dev);
 out_sinf:
 	kfree(pcc->sinf);
 out_hotkey:
@@ -660,7 +648,7 @@ static int acpi_pcc_hotkey_remove(struct acpi_device *device)
 
 	backlight_device_unregister(pcc->backlight);
 
-	acpi_pcc_destroy_input(pcc);
+	input_unregister_device(pcc->input_dev);
 
 	kfree(pcc->sinf);
 	kfree(pcc);
-- 
2.12.0
