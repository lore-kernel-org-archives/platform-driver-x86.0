Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7F7C001DD
	for <platform-driver-x86@archiver.kernel.org>; Sun, 25 Jun 2023 16:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbjFYQ3p (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 25 Jun 2023 12:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjFYQ3g (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 25 Jun 2023 12:29:36 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1ECC10E4
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:29:12 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-98df6bc0048so154688966b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710530; x=1690302530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFr85Va+I3JFQ/CS1AHNqQf8ybLG0IaDbtC5ESPVDI4=;
        b=P4/793FflPwuLOra9+yrjA1oii1q+mVvOCozzGq6xWF1CWxQa5aZaBBkMLzabIuC62
         Yvd4/yFuCpxebdB1dgr8lR14V4yBjqIr5vrShuzX7UtrZ6Xmj6TDNHeJDvsL540s/0kh
         jg1bjAJJlDKifdR5vSy9w+PBoKbOBp2JmHYqnkWjUeuxy5lMtNflQkL/YHpfyMBTx6Sr
         /xf8EdttzMS2cRAbvHLzP3cnSiWJMPbRAEDoeBCXxOqfw9uBus9Wio2VRQxTTEMdrYES
         53N507f6V0yvEqvE8EnkwGCgxv9U0V2LkZJHk1M1Kzl9vCqW1qNzKUhQ3uUJEEIM6rb6
         g9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710530; x=1690302530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFr85Va+I3JFQ/CS1AHNqQf8ybLG0IaDbtC5ESPVDI4=;
        b=fMBN5IoA/JEStfn5dd7hnYVMO7VCHXdC/z/67qob44zFMkUQU7tJvsTHDQCCX3dVcN
         xBUK1s07ojNnglhyFznB2RIX+IkU8v+ECewZGxHzb31QRqveX4SRAs15HjHjAi0zxTT1
         BF9f1xvjU688ZTe4ocb23cY8zXzFQYMoZhWfHKTx9OPYA6ZzwuCAoSXFMnaMg9A7G7D3
         QcVG2GCnib8SPWNBvcpioTjqXKeP6H+UY+XI1xe4Dy5/z8QeqIrU82fKHLI3d5iOH5H7
         Tq635kYZvKq4y04XrnTRXYiQ1QAcV69+Ydl/PHehZMBBsr72cjRRyZZJ/yl+D4EvyMHO
         U3LA==
X-Gm-Message-State: AC+VfDxkQtGEyjMuNUnf6bGooh2Twjo4srT17kckJaoaPxXlKrGwyQRd
        7k6IR2xp3FXfmP64M5Lm761j4g==
X-Google-Smtp-Source: ACHHUZ4iIpuVAQ8JeSeF/0XeL1REszISpgqSO7v4nyUS+OWRO4inwAZIh67lnuhSqW8mMFQdRGOTpg==
X-Received: by 2002:a17:907:3e88:b0:97d:cdf4:719f with SMTP id hs8-20020a1709073e8800b0097dcdf4719fmr25395707ejc.68.1687710530492;
        Sun, 25 Jun 2023 09:28:50 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:50 -0700 (PDT)
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
Subject: [PATCH v4 15/24] Input: pixcir_i2c_ts - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:08 +0200
Message-Id: <20230625162817.100397-16-krzysztof.kozlowski@linaro.org>
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
 drivers/input/touchscreen/pixcir_i2c_ts.c | 38 +++++++----------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
index 554e179c2e48..0b4576091dac 100644
--- a/drivers/input/touchscreen/pixcir_i2c_ts.c
+++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
@@ -515,41 +515,27 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client)
 	input_set_drvdata(input, tsdata);
 
 	tsdata->gpio_attb = devm_gpiod_get(dev, "attb", GPIOD_IN);
-	if (IS_ERR(tsdata->gpio_attb)) {
-		error = PTR_ERR(tsdata->gpio_attb);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to request ATTB gpio: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(tsdata->gpio_attb))
+		return dev_err_probe(dev, PTR_ERR(tsdata->gpio_attb),
+				     "Failed to request ATTB gpio\n");
 
 	tsdata->gpio_reset = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_LOW);
-	if (IS_ERR(tsdata->gpio_reset)) {
-		error = PTR_ERR(tsdata->gpio_reset);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to request RESET gpio: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(tsdata->gpio_reset))
+		return dev_err_probe(dev, PTR_ERR(tsdata->gpio_reset),
+				     "Failed to request RESET gpio\n");
 
 	tsdata->gpio_wake = devm_gpiod_get_optional(dev, "wake",
 						    GPIOD_OUT_HIGH);
-	if (IS_ERR(tsdata->gpio_wake)) {
-		error = PTR_ERR(tsdata->gpio_wake);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get wake gpio: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(tsdata->gpio_wake))
+		return dev_err_probe(dev, PTR_ERR(tsdata->gpio_wake),
+				     "Failed to get wake gpio\n");
 
 	tsdata->gpio_enable = devm_gpiod_get_optional(dev, "enable",
 						      GPIOD_OUT_HIGH);
-	if (IS_ERR(tsdata->gpio_enable)) {
-		error = PTR_ERR(tsdata->gpio_enable);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get enable gpio: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(tsdata->gpio_enable))
+		return dev_err_probe(dev, PTR_ERR(tsdata->gpio_enable),
+				     "Failed to get enable gpio\n");
 
 	if (tsdata->gpio_enable)
 		msleep(100);
-- 
2.34.1

