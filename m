Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A59C678D4
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Mar 2023 15:04:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbjCFPE2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Mar 2023 10:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjCFPE1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Mar 2023 10:04:27 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885DA1F49F
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Mar 2023 07:04:25 -0800 (PST)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 706C33F216
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Mar 2023 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1678112699;
        bh=jLrOdxm4BfVg1b7ahin7NvZThIQkleQBnBBbiXWn1WA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=GVnl37q+/EsfTgdqmsx5s8qK/9OSth1IZXZt8W/XR+FGxaoAbGsENzJMlqrFEg2hG
         7w3WA8wlD5CcRzqrBBJKu5MKGubGR0X5nT5MSGNdgJJJJB5wgI+PxvFHeB/AHJFJHg
         hFVuNXW8IFFauYbT3UoX3miwmBGaNB7ae/3c5TTamjGWQsai06ml4F18wi8+OylDOi
         EBJvJyVA1RlwkbuB/xQXQBlYoKSu7QQW4W83uqKmFP3XyA4GyRBO9eR9IaajluxDtB
         wEINLu+iLCcmJ5r3DiKCvqHlbcL4B4cMbfLhcRQFErsM1M3q+uKp9OZjGj4zQh2DqC
         YwvW/TWwDybwA==
Received: by mail-pl1-f199.google.com with SMTP id i6-20020a170902c94600b0019d16e4ac0bso5919152pla.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Mar 2023 06:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678112697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLrOdxm4BfVg1b7ahin7NvZThIQkleQBnBBbiXWn1WA=;
        b=zWN/Bl4v/BZ8yE+2aBhFZqtNBPxIGOeW5pOrXwgSVNq+smgy63nFmgzdJ/27c9F58Z
         5gfKQvpjntbDFY2Mw053yV16ZuPyvUTX6YUtxE9FooUOPDy1XEQhKeZRHWRDfDey28+z
         zebTjjNWNKxGeYSHTDX9szjkblviVc4YsMaG4uUT2HSb/56p+fvCvF02Bg64Vkn/GRz6
         0Yvj/X2OySjMYgJHq1/fjRB7Wp/fdvrr96TfjBTAIeIHtXz0yo6TzhDQ4kBWKzZ7xnln
         HRNctOJ5dp0n6Y3EGgRX7U6XdYWYZWEvIEbtGCGF7R7VEeVUOAgZVplnlbR/087nsbE8
         gy+g==
X-Gm-Message-State: AO0yUKX8cV9Xr+4FgnfoucLZ9KNytvzpMoYZEp2oBtNzi+4fogL9FoKV
        f4cuZwj5oMZK6RNtg/Y56QZRoHnyqTEbxr5uXrMQltk3lksnjKw6AqsVH8GlwkPYZcVwDLMiYVx
        cX7orlyXwTg2jiUDpzZXLAKF44X1WqxDbQGozhxHGhEMQsdvXmqTvxKbMWUY=
X-Received: by 2002:a17:902:dace:b0:19a:abb0:1e with SMTP id q14-20020a170902dace00b0019aabb0001emr13793806plx.38.1678112696982;
        Mon, 06 Mar 2023 06:24:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8yRm6vMsguUdvFvF4CPKFmlidP5fs0hAF1op/NAMOxO7KqGHcOXh11AXZYZBR4Zlv8TUKA7Q==
X-Received: by 2002:a17:902:dace:b0:19a:abb0:1e with SMTP id q14-20020a170902dace00b0019aabb0001emr13793771plx.38.1678112696545;
        Mon, 06 Mar 2023 06:24:56 -0800 (PST)
Received: from canonical.com (2001-b011-3007-39ac-d0ea-4b57-e3f1-317b.dynamic-ip6.hinet.net. [2001:b011:3007:39ac:d0ea:4b57:e3f1:317b])
        by smtp.gmail.com with ESMTPSA id kw6-20020a170902f90600b0019cad2de86bsm6822224plb.156.2023.03.06.06.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 06:24:56 -0800 (PST)
From:   Koba Ko <koba.ko@canonical.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-laptop: Register ctl-led for speaker-mute
Date:   Mon,  6 Mar 2023 22:24:54 +0800
Message-Id: <20230306142454.722020-1-koba.ko@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some platforms have the speaker-mute led and
current driver doesn't control it.

If the platform support the control of speaker-mute led, register it

Signed-off-by: Koba Ko <koba.ko@canonical.com>
---
 drivers/platform/x86/dell/dell-laptop.c | 43 +++++++++++++++++++++++++
 drivers/platform/x86/dell/dell-smbios.h |  2 ++
 2 files changed, 45 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 1321687d923ed..38d95bae8e3ab 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -97,6 +97,7 @@ static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
 static bool force_rfkill;
 static bool micmute_led_registered;
+static bool mute_led_registered;
 
 module_param(force_rfkill, bool, 0444);
 MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted models");
@@ -2177,6 +2178,34 @@ static struct led_classdev micmute_led_cdev = {
 	.default_trigger = "audio-micmute",
 };
 
+static int mute_led_set(struct led_classdev *led_cdev,
+			   enum led_brightness brightness)
+{
+	struct calling_interface_buffer buffer;
+	struct calling_interface_token *token;
+	int state = brightness != LED_OFF;
+
+	if (state == 0)
+		token = dell_smbios_find_token(GLOBAL_MUTE_DISABLE);
+	else
+		token = dell_smbios_find_token(GLOBAL_MUTE_ENABLE);
+
+	if (!token)
+		return -ENODEV;
+
+	dell_fill_request(&buffer, token->location, token->value, 0, 0);
+	dell_send_request(&buffer, CLASS_TOKEN_WRITE, SELECT_TOKEN_STD);
+
+	return 0;
+}
+
+static struct led_classdev mute_led_cdev = {
+	.name = "platform::mute",
+	.max_brightness = 1,
+	.brightness_set_blocking = mute_led_set,
+	.default_trigger = "audio-mute",
+};
+
 static int __init dell_init(void)
 {
 	struct calling_interface_token *token;
@@ -2230,6 +2259,16 @@ static int __init dell_init(void)
 		micmute_led_registered = true;
 	}
 
+	if (dell_smbios_find_token(GLOBAL_MUTE_DISABLE) &&
+	    dell_smbios_find_token(GLOBAL_MUTE_ENABLE) &&
+	    !dell_privacy_has_mic_mute()) {
+		mute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MUTE);
+		ret = led_classdev_register(&platform_device->dev, &mute_led_cdev);
+		if (ret < 0)
+			goto fail_led;
+		mute_led_registered = true;
+	}
+
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		return 0;
 
@@ -2277,6 +2316,8 @@ static int __init dell_init(void)
 fail_backlight:
 	if (micmute_led_registered)
 		led_classdev_unregister(&micmute_led_cdev);
+	if (mute_led_registered)
+		led_classdev_unregister(&mute_led_cdev);
 fail_led:
 	dell_cleanup_rfkill();
 fail_rfkill:
@@ -2299,6 +2340,8 @@ static void __exit dell_exit(void)
 	backlight_device_unregister(dell_backlight_device);
 	if (micmute_led_registered)
 		led_classdev_unregister(&micmute_led_cdev);
+	if (mute_led_registered)
+		led_classdev_unregister(&mute_led_cdev);
 	dell_cleanup_rfkill();
 	if (platform_device) {
 		platform_device_unregister(platform_device);
diff --git a/drivers/platform/x86/dell/dell-smbios.h b/drivers/platform/x86/dell/dell-smbios.h
index 75fa8ea0476dc..eb341bf000c67 100644
--- a/drivers/platform/x86/dell/dell-smbios.h
+++ b/drivers/platform/x86/dell/dell-smbios.h
@@ -34,6 +34,8 @@
 #define KBD_LED_AUTO_100_TOKEN	0x02F6
 #define GLOBAL_MIC_MUTE_ENABLE	0x0364
 #define GLOBAL_MIC_MUTE_DISABLE	0x0365
+#define GLOBAL_MUTE_ENABLE	0x058C
+#define GLOBAL_MUTE_DISABLE	0x058D
 
 struct notifier_block;
 
-- 
2.25.1

