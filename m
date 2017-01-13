From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 3/4] platform/x86: fujitsu-laptop: sync backlight power status in acpi_fujitsu_hotkey_add()
Date: Fri, 13 Jan 2017 12:02:39 +0100
Message-ID: <20170113110240.622-4-kernel@kempniu.pl>
References: <20170113110240.622-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35699 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751495AbdAMLCr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Jan 2017 06:02:47 -0500
Received: by mail-lf0-f66.google.com with SMTP id v186so5177760lfa.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jan 2017 03:02:46 -0800 (PST)
In-Reply-To: <20170113110240.622-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
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
index df1cd0a0231d..6438bcce90d4 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -930,6 +930,14 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 	/* Suspect this is a keymap of the application panel, print it */
 	pr_info("BTNI: [0x%x]\n", call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0));
 
+	/* Sync backlight power status */
+	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+		if (call_fext_func(FUNC_BACKLIGHT, 0x2, 0x4, 0x0) == 3)
+			fujitsu->bl_device->props.power = FB_BLANK_POWERDOWN;
+		else
+			fujitsu->bl_device->props.power = FB_BLANK_UNBLANK;
+	}
+
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
 	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
 		result = led_classdev_register(&fujitsu->pf_device->dev,
@@ -1256,14 +1264,6 @@ static int __init fujitsu_init(void)
 	if (ret)
 		goto fail_hotkey1;
 
-	/* Sync backlight power status (needs FUJ02E3 device, hence deferred) */
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-		if (call_fext_func(FUNC_BACKLIGHT, 0x2, 0x4, 0x0) == 3)
-			fujitsu->bl_device->props.power = FB_BLANK_POWERDOWN;
-		else
-			fujitsu->bl_device->props.power = FB_BLANK_UNBLANK;
-	}
-
 	pr_info("driver " FUJITSU_DRIVER_VERSION " successfully loaded\n");
 
 	return 0;
-- 
2.11.0
