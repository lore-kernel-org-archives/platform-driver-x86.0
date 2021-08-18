Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E12C4320A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 13:41:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B20AD60FE6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 13:41:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238147AbhHRNl6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 09:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238984AbhHRNlh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 09:41:37 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352C5C061230
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 06:40:38 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id b15so5092801ejg.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 06:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:from:date:subject:to:cc;
        bh=8HRoyFvN7Z/+l16grrRHlP4RjkUG6+DU4WLgbX8OWx0=;
        b=QL5PxM1xTuHeVQBTrU5BPnXXtXEP7PGTRdsjJpIsLEBRYeluRgh0xsU4NLU7fHb70U
         uaYV9R85MfzZiFnxkdESiwi6iFlodYmsqbUG6qw0FZiljf547e9Uo5GDDmHtN+L4A3vO
         /GqNEUa6JRE6YOC+FMsin6OtxQmLkduhmQ1ABvunwV3EXUMqiJzap3KdAdS3eTKOLgp0
         C2BtFy14u6Dle4P1oChE1726dH2m49ZLnjXzjJqpy1eRyTXpbH8nbH3cJzdgZRKp0a8R
         rRKX17zuCZWagUjW0KyI1D8JV9eR5rCfz5p4eQbnKsre4ckYHXqNcpHRfqVrvRC8LOEV
         5VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:to:cc;
        bh=8HRoyFvN7Z/+l16grrRHlP4RjkUG6+DU4WLgbX8OWx0=;
        b=cmvZ18d9WbrqxJsLaU3LYVggGMXIvwKeRElj6VFqANrxWhrf/fH8ABjGxJHX2D8fEA
         Pt/LruYSDnr1tJvCtgHgJIjgfx5SJQXvwm8LneSMSWZYo9SPvy0mT5EAFmPBDBEbt3TP
         8DJ54P4pBfJNr9JwW8LNN2cycxRsLzNe7qCTmcaJq+HwR8PYQ+/ntUE0v/+EKyXluvG8
         ptMuo7E0rJXh70edtRFIOVG1G9L0U+ArDYljuh4UPOPzTNtSaXO2rT/zsTJ59m9nB5WD
         LtmEb8XG/Q7FGdePeAJvy7pD/Xb2fdO730hHr4jtLn2iBUv94FfJDukk3bCjiLxGVi/o
         WCMw==
X-Gm-Message-State: AOAM533gxFx+7tgAh8stuPhUx0YSple8jQPbBkjHZ7B8uXFgso4CKNW6
        3w8CNEbQBuNntNtEOSVxEyHj5np7VF2mQHs=
X-Google-Smtp-Source: ABdhPJyoiziI6xWVbP0B0qQNO3dYuHApBNptcGTpKphijgDxusrmUAg/gjr9xI1N5yvOrMv/1CVnbg==
X-Received: by 2002:a17:906:cf91:: with SMTP id um17mr10060944ejb.490.1629294036360;
        Wed, 18 Aug 2021 06:40:36 -0700 (PDT)
Received: from localhost ([2a00:a040:195:275f:ad44:6808:2596:8580])
        by smtp.gmail.com with ESMTPSA id g29sm14622edf.31.2021.08.18.06.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 06:40:35 -0700 (PDT)
Message-Id: <2196990f167efe6a42d51fb85f4db4cdf4d9e80e.1629291912.git.matan@svgalib.org>
In-Reply-To: <cover.1629291912.git.matan@svgalib.org>
References: <cover.1629291912.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Wed, 18 Aug 2021 15:47:31 +0300
Subject: [PATCH V2 3/3] platform/x86: lg-laptop: Use correct event for
 keyboard backlight FN-key
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use led_classdev_notify_brightness_hw_changed() instead of F16 key.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 .../admin-guide/laptops/lg-laptop.rst         |  2 --
 drivers/platform/x86/lg-laptop.c              | 30 ++++++++++++++-----
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/laptops/lg-laptop.rst b/Documentation/admin-guide/laptops/lg-laptop.rst
index 13d7ec427e76..6fbe165dcd27 100644
--- a/Documentation/admin-guide/laptops/lg-laptop.rst
+++ b/Documentation/admin-guide/laptops/lg-laptop.rst
@@ -15,8 +15,6 @@ The following FN keys are ignored by the kernel without this driver:
 - FN-F1 (LG control panel)   - Generates F15
 - FN-F5 (Touchpad toggle)    - Generates F21
 - FN-F6 (Airplane mode)      - Generates RFKILL
-- FN-F8 (Keyboard backlight) - Generates F16.
-  This key also changes keyboard backlight mode.
 - FN-F9 (Reader mode)        - Generates F14
 
 The rest of the FN keys work without a need for a special driver.
diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index 12b497a11c6f..3e520d5bca07 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -17,11 +17,12 @@
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
-#define LED_DEVICE(_name, max) struct led_classdev _name = { \
+#define LED_DEVICE(_name, max, flag) struct led_classdev _name = { \
 	.name           = __stringify(_name),   \
 	.max_brightness = max,                  \
 	.brightness_set = _name##_set,          \
 	.brightness_get = _name##_get,          \
+	.flags = flag,                          \
 }
 
 MODULE_AUTHOR("Matan Ziv-Av");
@@ -71,6 +72,8 @@ static u32 inited;
 #define INIT_SPARSE_KEYMAP      0x80
 
 static int battery_limit_use_wmbb;
+static struct led_classdev kbd_backlight;
+static enum led_brightness get_kbd_backlight_level(void);
 
 static const struct key_entry wmi_keymap[] = {
 	{KE_KEY, 0x70, {KEY_F15} },	 /* LG control panel (F1) */
@@ -217,10 +220,16 @@ static void wmi_notify(u32 value, void *context)
 		int eventcode = obj->integer.value;
 		struct key_entry *key;
 
-		key =
-		    sparse_keymap_entry_from_scancode(wmi_input_dev, eventcode);
-		if (key && key->type == KE_KEY)
-			sparse_keymap_report_entry(wmi_input_dev, key, 1, true);
+		if (eventcode == 0x10000000) {
+			led_classdev_notify_brightness_hw_changed(
+				&kbd_backlight, get_kbd_backlight_level());
+		} else {
+			key = sparse_keymap_entry_from_scancode(
+				wmi_input_dev, eventcode);
+			if (key && key->type == KE_KEY)
+				sparse_keymap_report_entry(wmi_input_dev,
+							   key, 1, true);
+		}
 	}
 
 	pr_debug("Type: %i    Eventcode: 0x%llx\n", obj->type,
@@ -548,7 +557,7 @@ static enum led_brightness tpad_led_get(struct led_classdev *cdev)
 	return ggov(GOV_TLED) > 0 ? LED_ON : LED_OFF;
 }
 
-static LED_DEVICE(tpad_led, 1);
+static LED_DEVICE(tpad_led, 1, 0);
 
 static void kbd_backlight_set(struct led_classdev *cdev,
 			      enum led_brightness brightness)
@@ -565,7 +574,7 @@ static void kbd_backlight_set(struct led_classdev *cdev,
 	kfree(r);
 }
 
-static enum led_brightness kbd_backlight_get(struct led_classdev *cdev)
+static enum led_brightness get_kbd_backlight_level(void)
 {
 	union acpi_object *r;
 	int val;
@@ -596,7 +605,12 @@ static enum led_brightness kbd_backlight_get(struct led_classdev *cdev)
 	return val;
 }
 
-static LED_DEVICE(kbd_backlight, 255);
+static enum led_brightness kbd_backlight_get(struct led_classdev *cdev)
+{
+	return get_kbd_backlight_level();
+}
+
+static LED_DEVICE(kbd_backlight, 255, LED_BRIGHT_HW_CHANGED);
 
 static void wmi_input_destroy(void)
 {
-- 
Matan.

