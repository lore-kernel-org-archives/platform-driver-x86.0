From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 06/14] platform/x86: eeepc-laptop: remove sparse_keymap_free() calls
Date: Thu,  9 Mar 2017 13:11:42 +0100
Message-ID: <20170309121150.10553-7-kernel@kempniu.pl>
References: <20170309121150.10553-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34159 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754640AbdCIMMa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2017 07:12:30 -0500
Received: by mail-lf0-f67.google.com with SMTP id y193so4469406lfd.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2017 04:12:29 -0800 (PST)
In-Reply-To: <20170309121150.10553-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

As sparse_keymap_setup() now uses a managed memory allocation for the
keymap copy it creates, the latter is freed automatically.  Remove all
calls to sparse_keymap_free().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/eeepc-laptop.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index 8cdf315f9730..6f11c51b7e60 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -1205,14 +1205,12 @@ static int eeepc_input_init(struct eeepc_laptop *eeepc)
 	error = input_register_device(input);
 	if (error) {
 		pr_err("Unable to register input device\n");
-		goto err_free_keymap;
+		goto err_free_dev;
 	}
 
 	eeepc->inputdev = input;
 	return 0;
 
-err_free_keymap:
-	sparse_keymap_free(input);
 err_free_dev:
 	input_free_device(input);
 	return error;
@@ -1220,10 +1218,8 @@ static int eeepc_input_init(struct eeepc_laptop *eeepc)
 
 static void eeepc_input_exit(struct eeepc_laptop *eeepc)
 {
-	if (eeepc->inputdev) {
-		sparse_keymap_free(eeepc->inputdev);
+	if (eeepc->inputdev)
 		input_unregister_device(eeepc->inputdev);
-	}
 	eeepc->inputdev = NULL;
 }
 
-- 
2.12.0
