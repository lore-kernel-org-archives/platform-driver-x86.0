Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B304DC04AA5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Aug 2022 00:43:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiHYAnS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Aug 2022 20:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiHYAnS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 20:43:18 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C528C031
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 17:43:17 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id p13so5764231pld.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 17:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=5NyE7ddGexR3qBkfUPKXwE82DRyekUvvMAtk/kcYrdQ=;
        b=o3doCklM0HeMpV3GqDHBwihS1DXHdpat1uEIX0vAfqiBx7I3d3FSXO3ltGx3LZ91N7
         TdTjCbbFZzCTKtVtozr8dPcKjzvdtC8/jWnrEBK9ThzHqCLMc7EXEUNVdQj6O5qrlGQ+
         A48qSwSl6l1uurtvN8Jh5uRxqYhaTMB6AlotRSjwC6XAueFCkJP8i41N8pYWfXeZ2dbp
         zqVtGj/kmOCr9rczkrFy66M+5hnuUakVWzcrmiKR0xd9Xq80LVfad/EF3GbHPkQ765y5
         e7A4HnUAOhjNE4HoJTU573ae30+MjFfZRJbtwl8+54zUfx2K057705Dky6B2028stCWd
         Bccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=5NyE7ddGexR3qBkfUPKXwE82DRyekUvvMAtk/kcYrdQ=;
        b=RpJbWdmYhuVPSLWXcPlfAAbDUr8taexnVZY2W/Vxqr4QpYOnccRumLdZrvEJ36dLIK
         K1vbWGUsUIjZokAnVRQ10LzLK6qQrubxgz2GCqN462PJ0fJwScVSsS6Nmyf0fRHSiB37
         /0Wz8dTGldUDKg2t2V0auXUv7KwqxzNnfTVJkh96sR1NnVXfyCut1cMLjw3jpTmJ42xT
         Z1yIwlb6s9qqyFgu38SwptXEJdc474BoBpeChqmLhtaJF+YqimjYS0m4HTIMW7TRmgDx
         ySdkxR+qezYoDYwxnOfaLHu1KhgidWv6MupzwgfGKy9lTprumROCRF+bQCnkDAO9HsWu
         4rFg==
X-Gm-Message-State: ACgBeo1A7L6nOo38zwuxxcRaSR3xhRQDy7tjRhuX3a1vLc9OKazAz4/+
        3pgyAIbkD/vhN6Zyjgzbd8s=
X-Google-Smtp-Source: AA6agR5QZLWx+XCEs28JmuSXHngi6sscaR2UXJgZ835C1PHN2gEtc0zWvBzuCA0faYU9Us8PK9iUjg==
X-Received: by 2002:a17:90b:4a85:b0:1fb:7466:b33d with SMTP id lp5-20020a17090b4a8500b001fb7466b33dmr8456269pjb.48.1661388196741;
        Wed, 24 Aug 2022 17:43:16 -0700 (PDT)
Received: from localhost.localdomain (61-216-65-192.hinet-ip.hinet.net. [61.216.65.192])
        by smtp.gmail.com with ESMTPSA id a5-20020a170902710500b00172cea5467dsm9609373pll.274.2022.08.24.17.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 17:43:16 -0700 (PDT)
From:   PaddyKP_Yao <ispaddy@gmail.com>
X-Google-Original-From: PaddyKP_Yao <PaddyKP_Yao@asus.com>
To:     corentin.chary@gmail.com, hdegoede@redhat.com, markgross@kernel.org
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, paddykp_yao@asus.com,
        PaddyKP_Yao <PaddyKP_Yao@asus.com>
Subject: [PATCH v1 1/1] platform/x86: asus-wmi: Fix name of mic-mute LED classdev
Date:   Thu, 25 Aug 2022 08:43:05 +0800
Message-Id: <20220825004305.709539-1-PaddyKP_Yao@asus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

According to well-known-leds.txt, we sould use "platform::micmute"
instead of "asus::micmute" for name of mic-mute LED classdev. This patch
fix it into good name.

Signed-off-by: PaddyKP_Yao <PaddyKP_Yao@asus.com>
---
 drivers/platform/x86/asus-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 89b604e04d7f..3acc75c24c79 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1118,7 +1118,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 	}
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MICMUTE_LED)) {
-		asus->micmute_led.name = "asus::micmute";
+		asus->micmute_led.name = "platform::micmute";
 		asus->micmute_led.max_brightness = 1;
 		asus->micmute_led.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
 		asus->micmute_led.brightness_set_blocking = micmute_led_set;
-- 
2.34.1

