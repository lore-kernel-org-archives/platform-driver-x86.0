Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A52FEB64DD
	for <platform-driver-x86@archiver.kernel.org>; Sun, 25 Jun 2023 16:28:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbjFYQ2d (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 25 Jun 2023 12:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbjFYQ2b (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 25 Jun 2023 12:28:31 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA7619F
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:28:30 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-98e1c6a687fso63528666b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jun 2023 09:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710508; x=1690302508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RFM7q0XUB/BPBex5dV6DFuQg1MifJuVODWi1OqzZMI=;
        b=nhEOiQn20PfGaXL3/ExuEYiZ5HhwbowCQ8DuAbnO38IEqytDerd0mBUBIhC8vLJ4xD
         4FmI7zaJFbIe3UhWB5oQ1phAfwybavGrzsdx2IqNshnHScdkcF6KvsG5oZQFsjac86jQ
         J84haSDvvLvGrqs2BaKLXt9IUWEaiGP2HtXu5d3BfOFxv1yZ5529Qa+Fnl3CkzfbUGB6
         mA5jK67V7fuNVYTfuE9qzDDHjswvbNqF9+sNs/S0addld1mtd4tKa8FQME5mXxp2VMSa
         9IX+qCtyW07vnz/WmjR0rzvkGJhBoip8op02F/XziRguPwhkJ/Q8K5kTBXOy3MwiY3Wi
         GdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710508; x=1690302508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RFM7q0XUB/BPBex5dV6DFuQg1MifJuVODWi1OqzZMI=;
        b=Krc1xERcVqDgDgCuBr4ydw52xkHItYKsVr+igCJ6DsrGuBDscLBsjHVAsGnkn6OUUD
         x21RduO7A01GefyogScAiLkY2hGjeIUVLxe65BJoQ2c1PiCxrYIp6rfzLnG56X8wj1Pz
         Vz/Az/4CSCNxfVH1YDd4WWtm1/tyJ5P6MzAieFk3z37EN2tpVu0zLqA8JQ31xD5roeqL
         gg0d1KUTEYGH/kci4KLm7INzm6FpegLYia7iW1ZbqxyTrOx+gnvmnBbYkAaWR+Y6Phb6
         fm8uW9LSSY/8zcDyAKYtxviyi1dGD67rTbtcxb1UQdThVp7g6XW14McsQbo6JdFmwOyu
         7L/Q==
X-Gm-Message-State: AC+VfDwcINwzcIDxp8VwBxsu39qtyDKjGeNPS36oa/I/VAYz11Y1EE5l
        iKA07b851D3nKJEllAGa4yej1w==
X-Google-Smtp-Source: ACHHUZ4e6cef4EZ52A/Qs8HD/Na/zXaoD/gPZYa9z7iVoKgnBf1LIi/G8cnlxZAPXTJKHusQFJ8BKA==
X-Received: by 2002:a17:906:9b8b:b0:98c:ef87:17ea with SMTP id dd11-20020a1709069b8b00b0098cef8717eamr9115555ejc.13.1687710508473;
        Sun, 25 Jun 2023 09:28:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:27 -0700 (PDT)
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
Subject: [PATCH v4 03/24] Input: pwm-vibra - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:27:56 +0200
Message-Id: <20230625162817.100397-4-krzysztof.kozlowski@linaro.org>
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

Changes since v3:
1. Rebase, adjust to new driver changes.

Changes since v1:
1. Remove unneeded PTR_ERR_OR_ZERO, as pointed by Andy.
---
 drivers/input/misc/pwm-vibra.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/input/misc/pwm-vibra.c b/drivers/input/misc/pwm-vibra.c
index 2ba035299db8..a3cde30ee8d2 100644
--- a/drivers/input/misc/pwm-vibra.c
+++ b/drivers/input/misc/pwm-vibra.c
@@ -140,32 +140,20 @@ static int pwm_vibrator_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
-	err = PTR_ERR_OR_ZERO(vibrator->vcc);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request regulator: %d\n",
-				err);
-		return err;
-	}
+	if (IS_ERR(vibrator->vcc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->vcc),
+				     "Failed to request regulator\n");
 
 	vibrator->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
 							GPIOD_OUT_LOW);
-	err = PTR_ERR_OR_ZERO(vibrator->enable_gpio);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request enable gpio: %d\n",
-				err);
-		return err;
-	}
+	if (IS_ERR(vibrator->enable_gpio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->enable_gpio),
+				     "Failed to request enable gpio\n");
 
 	vibrator->pwm = devm_pwm_get(&pdev->dev, "enable");
-	err = PTR_ERR_OR_ZERO(vibrator->pwm);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request main pwm: %d\n",
-				err);
-		return err;
-	}
+	if (IS_ERR(vibrator->pwm))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->pwm),
+				     "Failed to request main pwm\n");
 
 	INIT_WORK(&vibrator->play_work, pwm_vibrator_play_work);
 
-- 
2.34.1

