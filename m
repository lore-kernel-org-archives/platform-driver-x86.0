Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433DFC001DF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 25 Jun 2023 16:30:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbjFYQaG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 25 Jun 2023 12:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbjFYQ3r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 25 Jun 2023 12:29:47 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9131992
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:29:31 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-98e25fa6f5bso160146966b.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710543; x=1690302543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrK9BhmeRbtcXzgi7rTTXpnSu/d5rWV1MCplOE4+PiY=;
        b=qr9LMO/Q+uU19l25OB/u4TWDpd9xHm9oJH3Foo76AbbHQctIYRf5ZUFkY8L9AiHLl4
         IOGoE/YwDvYjQ7Z/RoI8LAsyAb0Oou9jV/eNjnv0tRqSdclfwqq5uy94d6B0rnmCPUUR
         iSLOq5KkZanLgOR/nRBhyLxHONuPzS/nAZpnltsISPxUbmC0LUfNyXpYLU0YpLs1vWve
         AC96ifIl+9PInt0WomEwgqB0VL3ODDiMvq9dIQEL7Sq3bYrqAHuOVxVLoe7A0CTRvKCZ
         mcw9tPNo76ttBFw4192eFXvpbfamJYHlQPGZpjvPhBEBJagw7rmSeUJ7CKA6ktmCZMlI
         AgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710543; x=1690302543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrK9BhmeRbtcXzgi7rTTXpnSu/d5rWV1MCplOE4+PiY=;
        b=dgcnPmLrN7t5SbTGouU6vLU6HMBv3LsPjtD8HKJMja86T1ixRTqYJPiiDLi9gVlfO8
         OIP1zSfubmZC7TYIe2eZIPUjIKfltXNck2H9TxNzbHdrnkRJApqwD+4QKoqS8+cKPpRf
         QOZXSJZWIvnl+iUXsuvnjMsz8VZAfaKUu3Qyk52ISuz7DyyQwXwD+rn7fSa72FYvwz0h
         H+y7eSSpYfzFmZqtfX+tzVdKMT+R3E6LPp/d1YufW7IhD5noebYHsSaeXxjYe9qdMDnt
         FoviL1G03rar/7IWDKxC+HbPkNcSulCjhqqSylYGoXPiJwH07Bvf/Ko0IwDGzYWKgqoe
         1lQw==
X-Gm-Message-State: AC+VfDx/guIefY9uB2UEL9h4u187AR8QmHBQJXWIEX+2X81VjN8ZpRM2
        bANv/iIVGNIFDjllXVY6XYBaZw==
X-Google-Smtp-Source: ACHHUZ4pmUNrCMXBMGQAiWrlzAcQbXivm8kcH4HsBYA2BwE5vUWcO7yFRLSprd8nU0O23IiOEHcsJg==
X-Received: by 2002:a17:906:58c5:b0:988:891b:28c6 with SMTP id e5-20020a17090658c500b00988891b28c6mr20998191ejs.15.1687710543723;
        Sun, 25 Jun 2023 09:29:03 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:29:03 -0700 (PDT)
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
Subject: [PATCH v4 22/24] Input: bcm-keypad - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:15 +0200
Message-Id: <20230625162817.100397-23-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
References: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe() and devm_clk_get_optional().  Less code and the error
value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

---

Changes since v1:
1. Use also devm_clk_get_optional()
---
 drivers/input/keyboard/bcm-keypad.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/input/keyboard/bcm-keypad.c b/drivers/input/keyboard/bcm-keypad.c
index 56a919ec23b5..05b09066df84 100644
--- a/drivers/input/keyboard/bcm-keypad.c
+++ b/drivers/input/keyboard/bcm-keypad.c
@@ -365,17 +365,11 @@ static int bcm_kp_probe(struct platform_device *pdev)
 		return PTR_ERR(kp->base);
 
 	/* Enable clock */
-	kp->clk = devm_clk_get(&pdev->dev, "peri_clk");
+	kp->clk = devm_clk_get_optional(&pdev->dev, "peri_clk");
 	if (IS_ERR(kp->clk)) {
-		error = PTR_ERR(kp->clk);
-		if (error != -ENOENT) {
-			if (error != -EPROBE_DEFER)
-				dev_err(&pdev->dev, "Failed to get clock\n");
-			return error;
-		}
-		dev_dbg(&pdev->dev,
-			"No clock specified. Assuming it's enabled\n");
-		kp->clk = NULL;
+		return dev_err_probe(&pdev->dev, error, "Failed to get clock\n");
+	} else if (!kp->clk) {
+		dev_dbg(&pdev->dev, "No clock specified. Assuming it's enabled\n");
 	} else {
 		unsigned int desired_rate;
 		long actual_rate;
-- 
2.34.1

