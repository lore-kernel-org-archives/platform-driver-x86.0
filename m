Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA893EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Sun, 25 Jun 2023 16:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbjFYQ21 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 25 Jun 2023 12:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbjFYQ21 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 25 Jun 2023 12:28:27 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5CF193
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:28:25 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-977e0fbd742so292511466b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710504; x=1690302504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZvbC3ZPt55NmPj9EWoBgNDeYcxlZ+9WZ1c1ZpUtvDs=;
        b=V3MOXov53g3ZDu8LrcB6yeY3mCKfLjTgv8aERjwD6ZwjRyP74+miUwM/OWlxgCKtyN
         y5wq3vW9LNqZVFmyctn9GDTylK7ShRLmGWcdy+i+YlPhORyLkho48YWmPhhCleBCCCOk
         lwwtwGBnoej1wmCBzbqv7hFR+DTmWUo3VXJUSeq1HsyCcGTx70//ycUCBodR3Pj0qrWG
         ym3Q1M+U8QonDF9G5KdwgsFkRYl4/qvsnZLaKo2u00CCq7gRiYZCc5Co46UzgreV43Q8
         J3NwB5fTLMaoAlsrWzVbnhIYn6kQHgU6/s1zvgFnLSXw15nBxsibJAo+WA3HqzDn3IIk
         HTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710504; x=1690302504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZvbC3ZPt55NmPj9EWoBgNDeYcxlZ+9WZ1c1ZpUtvDs=;
        b=a45mHkR36NdFZrNtfdX/OR3+UlK7kn7U3IXWK/6MI1IAvdsovDG7S8aF6UkMtvStsI
         yanLWUPfRR2Jp7jnOHFjFt/3tp+MM//AiVi4OLjRMnNYGo5/l9Z41dLQA+DF0dHKSSAN
         MLX+IX2WDZn3NT0ipQiVfBSenpEoYqC+DTfUkorUdwmbM1IpOA+rWqq2xXOoWGfq11kN
         kkY0SNBNW7PIqGqLCke4gNiAsb9ojLkOFD+yvHOZvbURM36H23sUCRCjSYMEkjv2fCzO
         Xex1IkYR8TUqoRjaEc6ofR4Xf1J2RLKyvPKpO0RUGScUpUh4BgmIiFrW8MsuHvQvIiZT
         g02A==
X-Gm-Message-State: AC+VfDykQCYApNgijnTwKvyIgbEV7CWAUeBhqrh93/ju+3qT4MqgalKI
        sIz/82Np9P8EsvuZCncN74iIyA==
X-Google-Smtp-Source: ACHHUZ7LwF/EkwHPQat94JubUk3MHUNZkHDbypKquqibnFIEfO4pVx/UQakxKBC+rYD5qsC2uKy9nw==
X-Received: by 2002:a17:907:8688:b0:973:e349:43c8 with SMTP id qa8-20020a170907868800b00973e34943c8mr23825334ejc.69.1687710504335;
        Sun, 25 Jun 2023 09:28:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 01/24] Input: gpio_keys_polled - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:27:54 +0200
Message-Id: <20230625162817.100397-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
References: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/input/keyboard/gpio_keys_polled.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index c3937d2fc744..ba00ecfbd343 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -299,13 +299,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 							     NULL, GPIOD_IN,
 							     button->desc);
 			if (IS_ERR(bdata->gpiod)) {
-				error = PTR_ERR(bdata->gpiod);
-				if (error != -EPROBE_DEFER)
-					dev_err(dev,
-						"failed to get gpio: %d\n",
-						error);
 				fwnode_handle_put(child);
-				return error;
+				return dev_err_probe(dev, PTR_ERR(bdata->gpiod),
+						     "failed to get gpio\n");
 			}
 		} else if (gpio_is_valid(button->gpio)) {
 			/*
-- 
2.34.1

