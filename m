From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 6/6] platform/x86: fujitsu-laptop: simplify error handling in acpi_fujitsu_laptop_add()
Date: Fri,  7 Apr 2017 15:07:13 +0200
Message-ID: <20170407130713.8417-7-kernel@kempniu.pl>
References: <20170407130713.8417-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36487 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932534AbdDGNHX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Apr 2017 09:07:23 -0400
Received: by mail-lf0-f68.google.com with SMTP id n78so6094896lfi.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Apr 2017 06:07:22 -0700 (PDT)
In-Reply-To: <20170407130713.8417-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

As LED class devices registered by fujitsu-laptop no longer depend on
the platform device, two function calls inside acpi_fujitsu_laptop_add()
can be rearranged in order to simplify error handling.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 177b9b57ac2f..2d3d0e4083dc 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -860,18 +860,16 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 			fujitsu_bl->bl_device->props.power = FB_BLANK_UNBLANK;
 	}
 
-	error = fujitsu_laptop_platform_add();
+	error = acpi_fujitsu_laptop_leds_register(device);
 	if (error)
 		goto err_free_fifo;
 
-	error = acpi_fujitsu_laptop_leds_register(device);
+	error = fujitsu_laptop_platform_add();
 	if (error)
-		goto err_remove_platform_device;
+		goto err_free_fifo;
 
 	return 0;
 
-err_remove_platform_device:
-	fujitsu_laptop_platform_remove();
 err_free_fifo:
 	kfifo_free(&fujitsu_laptop->fifo);
 err_stop:
-- 
2.12.2
