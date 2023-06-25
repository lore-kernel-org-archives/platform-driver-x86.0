Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94BEC001B3
	for <platform-driver-x86@archiver.kernel.org>; Sun, 25 Jun 2023 16:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjFYQaF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 25 Jun 2023 12:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbjFYQ3o (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 25 Jun 2023 12:29:44 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE60E65
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:29:25 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9741caaf9d4so194416366b.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710540; x=1690302540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFNLWz5nb9xBhB40IBJoDah+KxzePJk8q7QGRODucW0=;
        b=ob0lMxAwJrExIVf3oDeXjQ+jA6kXqRF/1aB785MgbNcpsFJMzGAFqFqFU3QJ0Wx437
         lf0QxL+6yym9EKpnkTrjiXQrQVauNv88Ex2a2QmeV3DI9cHL9R6z2laDzsULdZ38iXPk
         bENqFNUI9+CT3IE4JUaecgT+iPnkQ6zSGhSYOQN7KALHcjUy/hTk8Wq9vhfkkkiYlb3X
         fjA5Tyu406KjZ5NozbmI1U710BcMxDQVNB0rrCFGYpRjGlmqry/P4F2XRtX4wxy3OF8i
         HLe+1P+BO9bOe9oMJ3TanB7IJemcN4HveJ7rSuASMevLNsP9iMKp3mFoRTBVK89M4PYQ
         9FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710540; x=1690302540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFNLWz5nb9xBhB40IBJoDah+KxzePJk8q7QGRODucW0=;
        b=lL6SCbtZjviowLDFe22sb9b+t7X+iTIbUDZJ+rf6h4VJ7Ah2nrGOTQqhy6eihhdtDf
         uOOod6CJPWClLrXybXkL+EiPUqYadNm/3PYQJgbbDnOCcLebInxVd3CBneR2ivwu5dw9
         3LaqMZxjsG1MTVgiRCIwD/DSw+PuT9LJmbN8Q+XqpQgU7Dn3Gn+5YAGsaRQc91/olHAe
         PNFGZs3gJOuc19EgIaAiF+sQYb9Kzatl6uDfUDKfO+f26yFKWLm593jOTqk+/evSZZ6O
         xW/LOZclO5QuXte+YfEoNVxRztiFHdoC7+V9Q46hJXdawNfvajMh+CepqLhWVR3r4hZQ
         NY5g==
X-Gm-Message-State: AC+VfDzOBm8wLkPodZo/Z6V3t51WWgpdgxLVHwb7gJMLun5seigxya7O
        WWdkvU3J8f3yxp4Aj6BuEZ9ZGQ==
X-Google-Smtp-Source: ACHHUZ4IWpx7MtY7/2SvrmNwqXJvzmNUubEvlOsfgGHZlYizAAyyYC36b0mZ7/57mBFvOsRQ+jyjaw==
X-Received: by 2002:a17:907:96a5:b0:988:76ed:e55e with SMTP id hd37-20020a17090796a500b0098876ede55emr21352012ejc.13.1687710539927;
        Sun, 25 Jun 2023 09:28:59 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:59 -0700 (PDT)
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
Subject: [PATCH v4 20/24] Input: surface3_spi - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:13 +0200
Message-Id: <20230625162817.100397-21-krzysztof.kozlowski@linaro.org>
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
 drivers/input/touchscreen/surface3_spi.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
index 31d140248f2e..7efbcd0fde4f 100644
--- a/drivers/input/touchscreen/surface3_spi.c
+++ b/drivers/input/touchscreen/surface3_spi.c
@@ -221,7 +221,6 @@ static void surface3_spi_power(struct surface3_ts_data *data, bool on)
  */
 static int surface3_spi_get_gpio_config(struct surface3_ts_data *data)
 {
-	int error;
 	struct device *dev;
 	struct gpio_desc *gpiod;
 	int i;
@@ -231,15 +230,9 @@ static int surface3_spi_get_gpio_config(struct surface3_ts_data *data)
 	/* Get the reset lines GPIO pin number */
 	for (i = 0; i < 2; i++) {
 		gpiod = devm_gpiod_get_index(dev, NULL, i, GPIOD_OUT_LOW);
-		if (IS_ERR(gpiod)) {
-			error = PTR_ERR(gpiod);
-			if (error != -EPROBE_DEFER)
-				dev_err(dev,
-					"Failed to get power GPIO %d: %d\n",
-					i,
-					error);
-			return error;
-		}
+		if (IS_ERR(gpiod))
+			return dev_err_probe(dev, PTR_ERR(gpiod),
+					     "Failed to get power GPIO %d\n", i);
 
 		data->gpiod_rst[i] = gpiod;
 	}
-- 
2.34.1

