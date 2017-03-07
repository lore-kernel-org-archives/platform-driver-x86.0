From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v3 2/4] platform/x86: fujitsu-laptop: sync backlight power status in acpi_fujitsu_laptop_add()
Date: Tue,  7 Mar 2017 11:15:14 +0100
Message-ID: <20170307101516.9852-3-kernel@kempniu.pl>
References: <20170307101516.9852-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35379 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755266AbdCGKPY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Mar 2017 05:15:24 -0500
Received: by mail-lf0-f67.google.com with SMTP id v2so8635417lfi.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Mar 2017 02:15:22 -0800 (PST)
In-Reply-To: <20170307101516.9852-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Registering an ACPI driver does not mean the device it handles has to
exist.  As the code which syncs backlight power status uses
call_fext_func(), it needs the FUJ02E3 ACPI device to be present, so
ensure that code is only run once the FUJ02E3 device is detected.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 185c929898d9..348af17cdc94 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -955,6 +955,14 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	/* Suspect this is a keymap of the application panel, print it */
 	pr_info("BTNI: [0x%x]\n", call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0));
 
+	/* Sync backlight power status */
+	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+		if (call_fext_func(FUNC_BACKLIGHT, 0x2, 0x4, 0x0) == 3)
+			fujitsu_bl->bl_device->props.power = FB_BLANK_POWERDOWN;
+		else
+			fujitsu_bl->bl_device->props.power = FB_BLANK_UNBLANK;
+	}
+
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
 	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
 		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
@@ -1272,14 +1280,6 @@ static int __init fujitsu_init(void)
 	if (ret)
 		goto fail_laptop1;
 
-	/* Sync backlight power status (needs FUJ02E3 device, hence deferred) */
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-		if (call_fext_func(FUNC_BACKLIGHT, 0x2, 0x4, 0x0) == 3)
-			fujitsu_bl->bl_device->props.power = FB_BLANK_POWERDOWN;
-		else
-			fujitsu_bl->bl_device->props.power = FB_BLANK_UNBLANK;
-	}
-
 	pr_info("driver " FUJITSU_DRIVER_VERSION " successfully loaded\n");
 
 	return 0;
-- 
2.12.0
