Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBBAC678D5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Mar 2023 06:24:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjCHGYY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Mar 2023 01:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjCHGYW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Mar 2023 01:24:22 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17D8A6170
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Mar 2023 22:24:21 -0800 (PST)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A22313F828
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Mar 2023 06:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1678256660;
        bh=wzfVYu1lc6GVwDKq6EPUswqzMBTxU3gzvumtlNc5knw=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=vy36Xrc1v1AogeVYfkwfYSPpb/Muk/8wi1wvtzqmXUNLDIvG89vo6CEbA2j/VZdqw
         KNE6M0ykFojibE8yb23TKrx6+CFsnKNoS2aj85sHMiPZ4Z74r7goKAPIPG0DXLQo5d
         /VB+D9FiL2h26bnzwhULfH8pnF+GVY33ZK5ey2RAMYgspiBt/iz6pXv4bphwID3Xl8
         EPwDYsXy+lGUpNPRk/5rWgFsClfDvvcMdU2Q43ksv/6XH3rTpqiRdbmcgqP8Bueij/
         Tpe6KtQ8QVOhGezYcg/ZCnvnj4q+ko+vOdltTb5xht4zlP1u/YRnbbv71kanQhoUhh
         Hjf/mRSWUa1gw==
Received: by mail-pf1-f199.google.com with SMTP id cj27-20020a056a00299b00b005f1ef2e4e1aso8317262pfb.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Mar 2023 22:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678256658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wzfVYu1lc6GVwDKq6EPUswqzMBTxU3gzvumtlNc5knw=;
        b=HXN/AE1juwn6tTwUldU0phWFBgd66LW3SRaFMAj48QVUJ39eP/zDQjtaAGF2M2P/4h
         hSr1JwNEyHtIIJJeenkeJvrMldXNPWPEu6yvLQdoLdM4o/SQtQF0GRyZXFUZ/Ipimh86
         t/vxs6enW0af1Xg8Xxza/KyZkh7l1TeBcDV/w+awkTTuea6RTbA9t5i+JOxgmNeM8bb5
         KTF90xCod3gkkqQuDTqeA57daR9coQLlzjqfW25AJwC7KHTcwmkjeXN7x7TMIkSzZUzF
         QNN0GE2TwgIiZ0YoUt3bg+Ntk3XZG70iw3o6hjNxxwP9Lz76e+EfCzPQXxyJzxTZjuYe
         TZLg==
X-Gm-Message-State: AO0yUKUlr7ube2zTO7q7gVuT6zt96l5OROQdyVge4s5jII9ph5HS+Vq/
        LFUjP96UIDGn4sqkdIppuGkfkgg25NibD1COe9W17qI1tlu3ueRAeJAoBV/jnCFwhOHBASK88jy
        /WQIaPRTuJXDFL0YOFHEoNS+Sl/1XJmq2uqXrhV57GvsGsINaP5+Saotiu8M=
X-Received: by 2002:a05:6a20:43a2:b0:cc:491e:1a1d with SMTP id i34-20020a056a2043a200b000cc491e1a1dmr19598044pzl.22.1678256658058;
        Tue, 07 Mar 2023 22:24:18 -0800 (PST)
X-Google-Smtp-Source: AK7set/DOL38H9AJGkzT4lB9JqZv9w9kRHSG13Kd5d2wqX17J9dmFKh4a6k4ZQTLCkXcYQd5DBr75A==
X-Received: by 2002:a05:6a20:43a2:b0:cc:491e:1a1d with SMTP id i34-20020a056a2043a200b000cc491e1a1dmr19598030pzl.22.1678256657704;
        Tue, 07 Mar 2023 22:24:17 -0800 (PST)
Received: from canonical.com (2001-b011-3007-39ac-575c-b8c5-b4ff-8627.dynamic-ip6.hinet.net. [2001:b011:3007:39ac:575c:b8c5:b4ff:8627])
        by smtp.gmail.com with ESMTPSA id y8-20020a655a08000000b00502e48db9aesm8562588pgs.53.2023.03.07.22.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 22:24:17 -0800 (PST)
From:   Koba Ko <koba.ko@canonical.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2] platform/x86: dell-laptop: Register ctl-led for speaker-mute
Date:   Wed,  8 Mar 2023 14:24:14 +0800
Message-Id: <20230308062414.1048913-1-koba.ko@canonical.com>
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

V2: Remove the dell-privacy rule for speaker-mute.
---
 drivers/platform/x86/dell/dell-laptop.c | 42 +++++++++++++++++++++++++
 drivers/platform/x86/dell/dell-smbios.h |  2 ++
 2 files changed, 44 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index e92c3ad06d696..5ed628617f63c 100644
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
@@ -2230,6 +2259,15 @@ static int __init dell_init(void)
 		micmute_led_registered = true;
 	}
 
+	if (dell_smbios_find_token(GLOBAL_MUTE_DISABLE) &&
+	    dell_smbios_find_token(GLOBAL_MUTE_ENABLE)) {
+		mute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MUTE);
+		ret = led_classdev_register(&platform_device->dev, &mute_led_cdev);
+		if (ret < 0)
+			goto fail_led;
+		mute_led_registered = true;
+	}
+
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		return 0;
 
@@ -2277,6 +2315,8 @@ static int __init dell_init(void)
 fail_backlight:
 	if (micmute_led_registered)
 		led_classdev_unregister(&micmute_led_cdev);
+	if (mute_led_registered)
+		led_classdev_unregister(&mute_led_cdev);
 fail_led:
 	dell_cleanup_rfkill();
 fail_rfkill:
@@ -2299,6 +2339,8 @@ static void __exit dell_exit(void)
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
2.34.1

