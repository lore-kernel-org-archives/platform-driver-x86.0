Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41174EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Sun, 25 Jun 2023 16:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbjFYQ3C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 25 Jun 2023 12:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbjFYQ2s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 25 Jun 2023 12:28:48 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD7710F1
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:28:39 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-98e25fa6f5bso160104666b.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710517; x=1690302517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNSURL3k6Qay5bYk2FFSYR3PPWS59SfGVXg9PpOHVeA=;
        b=AxBkfFnSYMeyDyifssvOcSpvlHZk/yg55Z26BVi9K72MFLzpaCXoujbiTwBfdjxD7l
         NwbDaAVbb3yecQ0+2am8/x2+MoSlMSi7sdvA1NXXAImIeFia6yJMnK0XF9M87RXMMShs
         uS6w256K389mkMZUuaxfhPEzd1tGrRJjlvUwBCC/jPgNIB+AGC04hU17X2XqS0IAybjr
         RQfOEz7Ip6zcf1vCF4sJwPMtsMTdpfAswuF3h/2P0cCHOCeVOcsV1xvN0IR96sPa+i7e
         +Df1gBmmmatCAmK1Hsfx/kwck9xTku4oENk2YanlIM+kCucMLFXUSGqLmkojmc3s3353
         pdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710517; x=1690302517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNSURL3k6Qay5bYk2FFSYR3PPWS59SfGVXg9PpOHVeA=;
        b=acLO0lxT43Fesc0+3ieJdggj+/U9CsIXGcHKp+8ugPLnkELE7RKmiE3Bn+BE2giV48
         xr+ocZjjMkrUwICXuPTiYSvSS2wfa47hG4Z3LcDQ/pTIuygDmaocJWEHVh7vVtoGTQ4k
         8/sscABamS2LEh4K8OtUsjJjwm8pL1/d940RZClfpzvDpZ3GHz2GVw7purBNS3IioHmU
         QQDVPov2PBDdG2XE8gCm5ppiMgvgDcPoGjv49HoP4qJzBjq8WxE3/bzSU8vcoicLXWom
         hxII6x4aAt5beFsBxGeo8LcWSRpHxfCmdlbogVhPDyfiQk82Wbdq7x1tXbX/hBHpyxoP
         ht5Q==
X-Gm-Message-State: AC+VfDwq+HNkgbRT1L0JgGY+JcDtyQO9n0jtzU8N7FVx3AUG33vTKbO+
        fBtiv3DAOXs3EEiEYwyPuwch2A==
X-Google-Smtp-Source: ACHHUZ6lD7/CWj82ahxcfEOP8/nJp76/ZTg0zjKVEgdES8zkonc7cJzxuOss8kjQgM4ycKMUTwMHhA==
X-Received: by 2002:a17:907:8a1a:b0:98e:419b:4cbc with SMTP id sc26-20020a1709078a1a00b0098e419b4cbcmr2616998ejc.12.1687710517664;
        Sun, 25 Jun 2023 09:28:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:37 -0700 (PDT)
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
Subject: [PATCH v4 08/24] Input: chipone_icn8318 - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:01 +0200
Message-Id: <20230625162817.100397-9-krzysztof.kozlowski@linaro.org>
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
 drivers/input/touchscreen/chipone_icn8318.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/chipone_icn8318.c b/drivers/input/touchscreen/chipone_icn8318.c
index 9fbeaf17f00b..d6876d10b252 100644
--- a/drivers/input/touchscreen/chipone_icn8318.c
+++ b/drivers/input/touchscreen/chipone_icn8318.c
@@ -191,12 +191,8 @@ static int icn8318_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->wake_gpio = devm_gpiod_get(dev, "wake", GPIOD_OUT_LOW);
-	if (IS_ERR(data->wake_gpio)) {
-		error = PTR_ERR(data->wake_gpio);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Error getting wake gpio: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(data->wake_gpio))
+		return dev_err_probe(dev, PTR_ERR(data->wake_gpio), "Error getting wake gpio\n");
 
 	input = devm_input_allocate_device(dev);
 	if (!input)
-- 
2.34.1

