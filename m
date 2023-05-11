Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F17C7EE25
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 May 2023 17:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239122AbjEKR5Q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 May 2023 13:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239074AbjEKR5D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 May 2023 13:57:03 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8DA93F8
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 May 2023 10:56:38 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bc3a2d333so13566730a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 May 2023 10:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683827795; x=1686419795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCyxJcaAFa337XSHNk4ZEZ5EvAPLYPe0lv9iIwuR3yw=;
        b=FxrBM+wVO5lKNfaem66x85lmcOmC3PdTSCKVL/Q0Wgq9Y11SanV3QDvrZHVJJSTJqV
         79ksGxCXpH+ejS3t7KBwAwDJQs3qho2ToV3NMmGzd7GIpJ6Y5mg/pGxe01zsjIzrcD/k
         dM8/Gu+/4AEBEOQ0POhVkPowtemxRYmmQq6kj3p6AeaNe+7bSM++hmpNv3u5T8oslSIl
         C8n6QO0xmXmG5wzy5RqjmvDTITj7Uy5vy/i+VMGZ9/1nV+qdkrnhT7PQibvc7beQWrvn
         OoYTMSngvRO/tGKkqGAv8VSlM7OEeuAP6yaShqX6eqmKtDl3t7KETWSjaM8sGZwN2/HL
         QThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683827795; x=1686419795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCyxJcaAFa337XSHNk4ZEZ5EvAPLYPe0lv9iIwuR3yw=;
        b=JqQQOOWecju5NFndgh37yXjRoncSv874NAZpft2manPJMQfjp1CeqKYTgY33oIwZrT
         rQlaBOyagwbb26W1mmlOhTJj4vK8hvL+OAosImQsunVcyX6lkKL7sygUXJQjI2/O/K+f
         +QTGjxy2H1S0Hn+WS/F0JmpyeeVdpg848hZDKNAD7yXWIs/VsPMa4a9+X9S3Fpkw97AK
         JMsjoyP0nENnDam+J9TQ8ILCeifSogYvaiSdYTuy1fuHnxrs7Q9yZOdgW5W8PrsJWdNH
         s6/OtirZ2p3+qrYk3uELa3HT9YVvl7Rz5TXuG4O5EnL+lm5ssF9dvsxcRToJkp99meLG
         aojw==
X-Gm-Message-State: AC+VfDwIdBQjRUZmi+KvdcwcrIAZb+bq33COSQ0C/VDMMAYyRVDDtcHM
        cz9ToEikoPFj21AdiHytqo/0dg==
X-Google-Smtp-Source: ACHHUZ6BwS51Kq9J2gQ3d/+7rl1iu+B2UgPf/z6zT3iyqJOrue5IN8+UWbnD4Wrr2HHfBkgbOZReNg==
X-Received: by 2002:a05:6402:14c3:b0:50d:fcfb:8633 with SMTP id f3-20020a05640214c300b0050dfcfb8633mr1872363edx.9.1683827795034;
        Thu, 11 May 2023 10:56:35 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
        by smtp.gmail.com with ESMTPSA id l14-20020a056402028e00b00506addaaab0sm3099202edv.32.2023.05.11.10.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 10:56:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@weissschuh.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Jeremy Soller <jeremy@system76.com>,
        System76 Product Development <productdev@system76.com>,
        Azael Avalos <coproscefalo@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 4/4] platform/x86: toshiba: constify pointers to hwmon_channel_info
Date:   Thu, 11 May 2023 19:56:27 +0200
Message-Id: <20230511175627.282246-4-krzysztof.kozlowski@linaro.org>
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
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index b34984bbee33..291f14ef6702 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -3037,7 +3037,7 @@ static int toshiba_acpi_hwmon_read(struct device *dev, enum hwmon_sensor_types t
 	return -EOPNOTSUPP;
 }
 
-static const struct hwmon_channel_info *toshiba_acpi_hwmon_info[] = {
+static const struct hwmon_channel_info * const toshiba_acpi_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
 	NULL
 };
-- 
2.34.1

