Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF9CEB64DC
	for <platform-driver-x86@archiver.kernel.org>; Sun, 25 Jun 2023 16:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbjFYQaF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 25 Jun 2023 12:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjFYQ3j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 25 Jun 2023 12:29:39 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EED1AB
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:29:18 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51d7e8dd118so2257652a12.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710534; x=1690302534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcWzH/RHmwMa3/x+/zg00uCVAY2MK7RPL3Qa0SH0q0U=;
        b=UlmhGix7s5v0WhZkyYVMXvB33R9ZUZPAYDNOZkYKTMgXi6rkhMM4Vc0XmOIFCG+VPJ
         Y/9NC31kGfA1YYnz7oOzt67TUwsNwLFNPK7n3Ve8KiHvQeNypruvpwoggl9xf8MZhH6Q
         wcrlngx+qd6mUA8fSlQ8K5JNLSGkFGxbMb5gOEriEV/xhbtkqHUoYBAZDZe5F5CTvzxo
         41xpTQR0TgfNUnVVjDuWmy8TrC1cy4MiZGz0AwLBy4XnnJ5IA9Nv56PJCGMlrsnDJuy2
         He6+gwMUR++usJd/7S0EdGCYRXktAjjB4PVcNQ+iH+1IdIjUaidrAOpYNdVoJQ0JpL6d
         fnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710534; x=1690302534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcWzH/RHmwMa3/x+/zg00uCVAY2MK7RPL3Qa0SH0q0U=;
        b=F9jd8p5akXFhkbI17OiyYHcwUSlTtdxa4LaRBIl0YLfRP4w56lkUZsbvVArfgRJf7p
         f9gaWYQxlXsjYJkOabuxv0r/TgHnqBX0ZKbe3LwFfhMM2FEihI1utEg987EJMi/cghWG
         +HHpy0tFAX3hIKd4SPNs5P5Snk3DEKpVrTiRntncJPwoyDIDMDdeVYLqtptn31eQUtHt
         mLSO6AztdCujA55i8BfQdyN1Q2OVj98wFeDuSdvO3llcCGenURKyLpz1QCVFLfjYweR/
         B1XhQm3p6Kuq6sQXUY7hcRUjvIi+59EPzQ/TD01aqyOe4XB6qL1fiMQ5PK1iN/OHitNx
         xAUw==
X-Gm-Message-State: AC+VfDy1IG14FagQABuJYpiklYnjcq29kL/ws5O6cpIKs9GQo0RanZLQ
        E9uQl/+wz09VLC4Szg0KbnS8OyRxGI0h0ORySn4=
X-Google-Smtp-Source: ACHHUZ5luKl0u5pODvkSWW7OV5oi9JK3VKz1V/ffHGil8YhRFO4e+LGCOFQmaOEzMNU6Wu8kjAHvMQ==
X-Received: by 2002:a17:907:3d94:b0:98c:d733:bf03 with SMTP id he20-20020a1709073d9400b0098cd733bf03mr12217721ejc.43.1687710534201;
        Sun, 25 Jun 2023 09:28:54 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:53 -0700 (PDT)
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
Subject: [PATCH v4 17/24] Input: resistive-adc-touch - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:10 +0200
Message-Id: <20230625162817.100397-18-krzysztof.kozlowski@linaro.org>
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
 drivers/input/touchscreen/resistive-adc-touch.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
index 6f754a8d30b1..7e761ec73273 100644
--- a/drivers/input/touchscreen/resistive-adc-touch.c
+++ b/drivers/input/touchscreen/resistive-adc-touch.c
@@ -210,12 +210,8 @@ static int grts_probe(struct platform_device *pdev)
 
 	/* get the channels from IIO device */
 	st->iio_chans = devm_iio_channel_get_all(dev);
-	if (IS_ERR(st->iio_chans)) {
-		error = PTR_ERR(st->iio_chans);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "can't get iio channels.\n");
-		return error;
-	}
+	if (IS_ERR(st->iio_chans))
+		return dev_err_probe(dev, PTR_ERR(st->iio_chans), "can't get iio channels\n");
 
 	if (!device_property_present(dev, "io-channel-names"))
 		return -ENODEV;
-- 
2.34.1

