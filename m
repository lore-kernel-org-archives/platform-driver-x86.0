Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A4DC55178
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 00:09:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F65322268
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 00:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VPnuisHS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgKCAJt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 2 Nov 2020 19:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbgKCAJt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Nov 2020 19:09:49 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6061FC061A47
        for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2020 16:09:49 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id 126so19789070lfi.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2020 16:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V8skaM7syXmbfJm4r1OgvU6gcYaHXE62TFQBSGlozhU=;
        b=VPnuisHSt7KrX8al+dtlg++Qv7oCD8ZSQh9IGw0n1HPE37QSrZEJW44og/cG2KkNUM
         ZvZbGsifKj022dvdpqsGfbON1hQ1C2fhCkgu/oqfb+Pf3PY4dwaf/Wo0HFrwTKi5GjEI
         iklgVW6n49OGfnQp5fy87V5x620YoCiagJ6DMaL2Nrsb/TTrBvWBrucEAv7aFbS4nwFh
         Fly1f19IVkNOk63tHpr0AGR/93ZW6HhBND1zlxY05NLgDLrD5ms1bKzwfLjhLOxdkzca
         YcBwEirD+fk3m/uNC7ZoM9YlplfBBjMsGX/EwKCZlyiHxxoYZqNt13466NIDAgE0xhss
         2iOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V8skaM7syXmbfJm4r1OgvU6gcYaHXE62TFQBSGlozhU=;
        b=nCGt9XYoJosRxIJcE66TWmFpBEYwKt5YX6jP64DLztmFmGEIl8IzXYQOGGrLCXbrm8
         XHfMfWSxo9wcSe/3+JvS7xy4yaQh10HXTUqG0nio20gr8AkF862u9DHEcBm+vDMrVAcL
         ul2bJlzA1M+DyIOjPkI8S2Qq9zr6FulXYrd0QP2t7p1TQZxaVX4Q3bSJEOH2KVnRh4Z8
         f2cl5FwJgMZVZ+MaDeLHOVVWyRvW6vuH7dPKRKeIfL/f7wgJh8o5jD5vM+q52PCw9EU3
         flXzV4AA3/4eBseupzchnbw3ycmJFZn6EfkLIIXjKItb4GOg24dXqz865QRyfVFFDlZ7
         qpug==
X-Gm-Message-State: AOAM530WUNNaxo35m6VncQ2T0MeCZX2Vad0LCs+ZRx/zirCzmIyLM5qh
        5Xv5ALLgTRnDJ4JzeY4xpg/upw==
X-Google-Smtp-Source: ABdhPJx/IuAt811CpR0lxNywx/16JQNv0Oq7oOvk2mSd1UjmTTvjm6mdenCkmGpin2oeyX9IG1eFnA==
X-Received: by 2002:ac2:5c4c:: with SMTP id s12mr6105789lfp.174.1604362187923;
        Mon, 02 Nov 2020 16:09:47 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id a14sm671492lfo.116.2020.11.02.16.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 16:09:47 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-geode@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH 3/3 v3] x86/platform/geode: Convert alix LED to GPIO machine descriptor
Date:   Tue,  3 Nov 2020 01:04:39 +0100
Message-Id: <20201103000439.325448-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103000439.325448-1-linus.walleij@linaro.org>
References: <20201103000439.325448-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This makes the machine look up the LED from a GPIO machine
descriptor table. The Geode LEDs should be on the CS5535
companion chip.

Cc: linux-gpio@vger.kernel.org
Cc: linux-geode@lists.infradead.org
Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Rebase on v5.10-rc1
- Resend
ChangeLog v1->v2:
- Drop excess comma after terminator { }
- Collect Andy's Reviewed-by
---
 arch/x86/platform/geode/alix.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/x86/platform/geode/alix.c b/arch/x86/platform/geode/alix.c
index c33f744b5388..b39bf3b5e108 100644
--- a/arch/x86/platform/geode/alix.c
+++ b/arch/x86/platform/geode/alix.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
 #include <linux/dmi.h>
 
 #include <asm/geode.h>
@@ -69,21 +70,15 @@ static struct platform_device alix_buttons_dev = {
 static struct gpio_led alix_leds[] = {
 	{
 		.name = "alix:1",
-		.gpio = 6,
 		.default_trigger = "default-on",
-		.active_low = 1,
 	},
 	{
 		.name = "alix:2",
-		.gpio = 25,
 		.default_trigger = "default-off",
-		.active_low = 1,
 	},
 	{
 		.name = "alix:3",
-		.gpio = 27,
 		.default_trigger = "default-off",
-		.active_low = 1,
 	},
 };
 
@@ -92,6 +87,17 @@ static struct gpio_led_platform_data alix_leds_data = {
 	.leds = alix_leds,
 };
 
+static struct gpiod_lookup_table alix_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		/* The Geode GPIOs should be on the CS5535 companion chip */
+		GPIO_LOOKUP_IDX("cs5535-gpio", 6, NULL, 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("cs5535-gpio", 25, NULL, 1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("cs5535-gpio", 27, NULL, 2, GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
 static struct platform_device alix_leds_dev = {
 	.name = "leds-gpio",
 	.id = -1,
@@ -106,6 +112,7 @@ static struct platform_device *alix_devs[] __initdata = {
 static void __init register_alix(void)
 {
 	/* Setup LED control through leds-gpio driver */
+	gpiod_add_lookup_table(&alix_leds_gpio_table);
 	platform_add_devices(alix_devs, ARRAY_SIZE(alix_devs));
 }
 
-- 
2.26.2

