Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D6AC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Feb 2023 14:39:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbjBSOjI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 19 Feb 2023 09:39:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbjBSOii (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Feb 2023 09:38:38 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C40B1A6
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Feb 2023 06:38:18 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id bx23so441946wrb.10
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Feb 2023 06:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cznqdx01/faUtAoqSoejbDua4FcHXQ+/pRuK304PkQ=;
        b=cBxhQu1MiOuL3c2L69272RQU7uQ6pCjBn1d6SnryOcPwzupn7ueF8v5MEdeVNvBhYS
         h4/TwVhfcN/MN9hlwB8QyTpNx+kdobugSn0/OhyFNEDgT7L7qRjm7Cd4yrhANU2OyGFV
         H1Qr5jUOIf0mZbTCAggAc4iJl9V8emZbfsBOze00UrhXGJ08aOO5AGUd+PT7QEfvz79i
         gjL7hSex7iEmPfKugolaqZ8XvolQH32Po+izM+zymyRhbarpF73Z//ViWIr/peUf/x9o
         JmHUGmsJT3ZvAFbajR3+xKxLS2GpaGjNTHYlrrha9gLDylB2mlXJOMZaHZIIyaTczr82
         jyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cznqdx01/faUtAoqSoejbDua4FcHXQ+/pRuK304PkQ=;
        b=7ucUvljJwLgx5SnLVpRhLLgz0o+VG9FHkHA0aMP8h6paIlMKOk/af/ebga3zl10aN5
         5FLWOd1ulGcA0NQrLcCTn/JllN/Vla4ejNxUhY1rI8wYnqnGe5HRuNhdlEdSnEyJtixe
         IzsTz6PgvdZtHTrrPTCa0i+Bw/gJYugfhSXDzQ+AQe56gajWP05tHfYr+UTwt71oxBhk
         UiqVkheT1q8s+rsIAQtrNHAbNqXwy+BOM9vhpatmiO4CH+JJezPSOOQWWeeBL/04MtC7
         Ec790bElHJ3w9lHupaPFgOtvXX69nrnLMZvFE79rfRwMd5IIj6J0bOt+gFN//4RAUR3V
         LBeQ==
X-Gm-Message-State: AO0yUKX9S3hGIj+duTX5FpFM7/27GBSZ8bvuHAD8gl/vg2XYZJK75D4J
        54UfTsQVGWLx1oAB/xajqG9UOQ==
X-Google-Smtp-Source: AK7set+LnJkrxCtM/Mt4QXFkrHuNKO4fIAzFAlp1XOjSJ6bYXltoBh/a3YeqKMC6XlgtTD7NaFAy2g==
X-Received: by 2002:a05:6000:1866:b0:2c4:669:fda4 with SMTP id d6-20020a056000186600b002c40669fda4mr642159wri.0.1676817497552;
        Sun, 19 Feb 2023 06:38:17 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:6f43:b92:7670:463])
        by smtp.gmail.com with ESMTPSA id a18-20020adfe5d2000000b002be505ab59asm86176wrn.97.2023.02.19.06.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 06:38:17 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org (open list:ACER ASPIRE ONE
        TEMPERATURE AND FAN DRIVER)
Subject: [PATCH v1 16/17] thermal/drivers/acerhdf: Remove pointless governor test
Date:   Sun, 19 Feb 2023 15:36:56 +0100
Message-Id: <20230219143657.241542-17-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230219143657.241542-1-daniel.lezcano@linaro.org>
References: <20230219143657.241542-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The thermal zone parameter specifies the bang-bang governor.

The Kconfig selects the bang-bang governor. So it is pointless to test
if the governor was set for the thermal zone assuming it may not have
been compiled-in.

Remove the test and prevent another access into the thermal internals.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/platform/x86/acerhdf.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 61f1c3090867..71b9c1f922d9 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -697,13 +697,6 @@ static int __init acerhdf_register_thermal(void)
 	if (ret)
 		return ret;
 
-	if (strcmp(thz_dev->governor->name,
-				acerhdf_zone_params.governor_name)) {
-		pr_err("Didn't get thermal governor %s, perhaps not compiled into thermal subsystem.\n",
-				acerhdf_zone_params.governor_name);
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
-- 
2.34.1

