Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E5CC77B7F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 May 2023 17:57:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239047AbjEKR5I (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 May 2023 13:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239057AbjEKR4z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 May 2023 13:56:55 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A9493F1
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 May 2023 10:56:33 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bdd7b229cso16201102a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 May 2023 10:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683827791; x=1686419791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=24nE1/kCUIt4VxUYaOy3n42p9I+OEZpARvSoMuz1JcY=;
        b=romEM7onwBvttCZ6Iyh6XGlNl6BiuxxstU5nRxUtYf7UMwLRAB9f4qvhYA8Hk2/b0E
         eTFG/hxUU2Y8XxM7FIoZzrxACMoLc2S+4DmXpR7cSpCMJ52jyWfqJ8E1+h/hJTgrAoss
         zfLX/TcL2GXp82O73J4Q9kpATOy1zv31OkVg3pZse57SQJHZDCLhBSQINeiw2+xNalw6
         sK5lnFN2l22vsfVDcTG5I7EX5iEwCvlEhPPMbPZgDUdMUQcUqMPcoGXjE0AksElbgo4q
         AUG3A41/nx7TSKXyQpyjjStAlTU6ypVr9THjLBW9c0EUFYbWHqHCkSQhX0Wu8Uc8kOUd
         3Gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683827791; x=1686419791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24nE1/kCUIt4VxUYaOy3n42p9I+OEZpARvSoMuz1JcY=;
        b=ZD/xxk5oq1Bf5YHmk+WUwETXML85QFfD66vso/Jo+65aFQzQTbNrgklGNvMcJJgYOK
         prUm4bbsncLTYWF42KsctjjstGpYRv1MKKwKCNHpKR0kHBT43IXECx0NwTeSpctHDgUr
         4iNTdx3mVCGf1LNzYjP62mjRM277s65/P2Eio311/iHlqc+0jh/9zD3CTBHA7XhfTOJz
         qEbymSJ4Ek5AaO2aroZfdmooPovkUC8ia9B+IGAY1p1aYpqF3V1hycp8zql+6oN3qT6Z
         UgC4uHUnEc2xlr8928b0rCHtTSprbW31awD8oFQ9Fs7xsrqF+zWs/m3YSdo7hFwTbaSq
         it1g==
X-Gm-Message-State: AC+VfDylOnZPbUk0i2ERdjhJRcyDlNxpe/3KMvUq5+3PwMdVrBeFv5WG
        yaiLpAZXkW2AHGIpgqR4BUuQBA==
X-Google-Smtp-Source: ACHHUZ4dVYd1ckDx8XuEHai8ueEHM1w9oSLwr1AQap+eSxw5kA9JOvV6VACtscHKKLA9r+o5MewQ/w==
X-Received: by 2002:a50:ed99:0:b0:50b:d30c:c595 with SMTP id h25-20020a50ed99000000b0050bd30cc595mr16582930edr.7.1683827791134;
        Thu, 11 May 2023 10:56:31 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
        by smtp.gmail.com with ESMTPSA id l14-20020a056402028e00b00506addaaab0sm3099202edv.32.2023.05.11.10.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 10:56:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@weissschuh.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Jeremy Soller <jeremy@system76.com>,
        System76 Product Development <productdev@system76.com>,
        Azael Avalos <coproscefalo@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 1/4] platform/x86: gigabyte: constify pointers to hwmon_channel_info
Date:   Thu, 11 May 2023 19:56:24 +0200
Message-Id: <20230511175627.282246-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Statically allocated array of pointers to hwmon_channel_info can be made
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/platform/x86/gigabyte-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
index 8aa665e866b8..f6ba88baee4d 100644
--- a/drivers/platform/x86/gigabyte-wmi.c
+++ b/drivers/platform/x86/gigabyte-wmi.c
@@ -94,7 +94,7 @@ static umode_t gigabyte_wmi_hwmon_is_visible(const void *data, enum hwmon_sensor
 	return usable_sensors_mask & BIT(channel) ? 0444  : 0;
 }
 
-static const struct hwmon_channel_info *gigabyte_wmi_hwmon_info[] = {
+static const struct hwmon_channel_info * const gigabyte_wmi_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT,
 			   HWMON_T_INPUT,
-- 
2.34.1

