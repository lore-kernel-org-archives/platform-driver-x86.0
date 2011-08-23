From: =?UTF-8?Q?Ren=C3=A9_Bolldorf?= <xsecute@googlemail.com>
Subject: [PATCH]: Check if acpi already handle backlight power in
 'ideapad_backlight_notify_power' to avoid a page fault
Date: Wed, 24 Aug 2011 00:10:58 +0200
Message-ID: <CAEWqx59Hr=HBUGyDOstVbr7VEXc2JEaByCJfDZAcce5D3XiF5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:34517 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752730Ab1HWWK7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Aug 2011 18:10:59 -0400
Received: by qwk3 with SMTP id 3so394177qwk.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2011 15:10:58 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

Hi Matthew,

this patch avoid a page fault in the ideapad-laptop extras when
turning the backlight power on or off.

Signed-off-by: Rene Bolldorf <xsecute@googlemail.com>
---
diff --git a/drivers/platform/x86/ideapad-laptop.c
b/drivers/platform/x86/ideapad-laptop.c
index 0c59541..0766a9f 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -491,11 +491,13 @@ static void ideapad_backlight_exit(struct
ideapad_private *priv)
 static void ideapad_backlight_notify_power(struct ideapad_private *priv)
 {
        unsigned long power;
-       struct backlight_device *blightdev = priv->blightdev;

-       if (read_ec_data(ideapad_handle, 0x18, &power))
+       if (priv->blightdev == NULL) {
+               read_ec_data(ideapad_handle, 0x18, &power);
                return;
-       blightdev->props.power = power ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
+       }
+
+       priv->blightdev->props.power = power ? FB_BLANK_UNBLANK :
FB_BLANK_POWERDOWN;
 }

 static void ideapad_backlight_notify_brightness(struct ideapad_private *priv)
--
