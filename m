Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10240C7EE24
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 May 2023 17:57:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239065AbjEKR5K (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 May 2023 13:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239088AbjEKR47 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 May 2023 13:56:59 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41ADF8698
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 May 2023 10:56:35 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bc456cc39so13330974a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 May 2023 10:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683827792; x=1686419792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7FN5EFH4KBac4/ZvODbt2chzmKokVJu41Eq2V61hww=;
        b=Ckoxt4MXbiGzc3oJKuG/KM6YiFy3QeFI/+dQye6TbeUSU4EleyP5YK2Gs78/LMYVV4
         DL8/q40nETC8NkyT8FDKbHWqDhV2vLedB7mVNbs5LQLRTXfWrlFbOWQ2gkO+HjRrdv/H
         tfXPgC4kjGs0432uMf/DX236CX8mRPDNNcet7VxUQD0P4x1tbb5xidJOaPLAOquKUXgn
         S3sqD30iDEdFLlc6KqJ1hyMWI5puJqzhdcyYRjCWgeKIVlnOywTifGlp6ZDqD6Ak4nZJ
         noHX93f2c4qJLRlh5VfbnSpUkziRwobZOB9D7xhF6IW1+dDxbzA0o3vi0rHd5unQ4lem
         JvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683827792; x=1686419792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7FN5EFH4KBac4/ZvODbt2chzmKokVJu41Eq2V61hww=;
        b=hCx2it9zhZhaXBs4q7AIBkcUeVhkmLHWZjEYeUexKtFzyJdLhFkqfGXS/+7I0ca686
         SW5afElhm+nVstTJ0MoKKJGKVCIfN3GwV5gP2gknQxFAh36/LGOVMlj5YmKpCA2k/vdu
         JDh7hK9QpAgCRU6mTk5guofNyUg+pK9lz+em6JckKckU+HNEPzmpG96cR7X2bgCd0scN
         403wyY8f4LxNG4e5YJWHgHeJxRpTSYzS+yTwuPNrwCEF97l9cTuo+LEEq/5C38J1myw0
         1O3hP372CDVJDoH286DGk8d6gzKjBq7lq/53EjJLmA7gaBnRpQIXN1v2K1W4GvBgznuJ
         6q0A==
X-Gm-Message-State: AC+VfDx/PJgZfgIxzpxmm2zCxQADTNuRDip5ZKrzH6UbfLODsFbtVkIk
        K/2k8aSRIFOGS2Hs1WyzcuzuHF+DxEmX2tF65KG5nw==
X-Google-Smtp-Source: ACHHUZ7JgTc7lzRjs6O7KBEfpdv2k+JY52kFwpFw3tfal7pz8tnhnl5OdOTt4XulMNGQBoAaBl44hA==
X-Received: by 2002:a05:6402:1358:b0:50d:f9b3:444d with SMTP id y24-20020a056402135800b0050df9b3444dmr2316628edw.21.1683827792436;
        Thu, 11 May 2023 10:56:32 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
        by smtp.gmail.com with ESMTPSA id l14-20020a056402028e00b00506addaaab0sm3099202edv.32.2023.05.11.10.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 10:56:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@weissschuh.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Jeremy Soller <jeremy@system76.com>,
        System76 Product Development <productdev@system76.com>,
        Azael Avalos <coproscefalo@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 2/4] platform/x86: hp: constify pointers to hwmon_channel_info
Date:   Thu, 11 May 2023 19:56:25 +0200
Message-Id: <20230511175627.282246-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511175627.282246-1-krzysztof.kozlowski@linaro.org>
References: <20230511175627.282246-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Statically allocated array of pointers to hwmon_channel_info can be made
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 2749433b713f..7eb66cfef208 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -1536,7 +1536,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	}
 }
 
-static const struct hwmon_channel_info *info[] = {
+static const struct hwmon_channel_info * const info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
 	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
 	NULL
-- 
2.34.1

