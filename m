From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 2/7] platform/x86: fujitsu-laptop: Defer input device registration
Date: Sun, 11 Feb 2018 22:07:22 +0100
Message-ID: <20180211210727.12130-3-kernel@kempniu.pl>
References: <20180211210727.12130-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:41141 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932132AbeBKVHk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Feb 2018 16:07:40 -0500
Received: by mail-lf0-f67.google.com with SMTP id f136so17908700lff.8
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Feb 2018 13:07:39 -0800 (PST)
In-Reply-To: <20180211210727.12130-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Only register input devices after the device-specific data structures
they access are fully initialized.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index b5f782807bfa..7f30a427a16c 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -399,10 +399,6 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	strcpy(acpi_device_class(device), ACPI_FUJITSU_CLASS);
 	device->driver_data = priv;
 
-	ret = acpi_fujitsu_bl_input_setup(device);
-	if (ret)
-		return ret;
-
 	pr_info("ACPI: %s [%s]\n",
 		acpi_device_name(device), acpi_device_bid(device));
 
@@ -410,6 +406,10 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 		priv->max_brightness = FUJITSU_LCD_N_LEVELS;
 	get_lcd_level(device);
 
+	ret = acpi_fujitsu_bl_input_setup(device);
+	if (ret)
+		return ret;
+
 	ret = fujitsu_backlight_register(device);
 	if (ret)
 		return ret;
@@ -795,10 +795,6 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 		goto err_stop;
 	}
 
-	ret = acpi_fujitsu_laptop_input_setup(device);
-	if (ret)
-		goto err_free_fifo;
-
 	pr_info("ACPI: %s [%s]\n",
 		acpi_device_name(device), acpi_device_bid(device));
 
@@ -833,6 +829,10 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 			fujitsu_bl->bl_device->props.power = FB_BLANK_UNBLANK;
 	}
 
+	ret = acpi_fujitsu_laptop_input_setup(device);
+	if (ret)
+		goto err_free_fifo;
+
 	ret = acpi_fujitsu_laptop_leds_register(device);
 	if (ret)
 		goto err_free_fifo;
-- 
2.16.1
