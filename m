Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601B5C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 12 Mar 2023 13:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbjCLN0t (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 12 Mar 2023 09:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjCLN0p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 12 Mar 2023 09:26:45 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE77E1A672
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Mar 2023 06:26:27 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id o12so38570976edb.9
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Mar 2023 06:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678627586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh0gYoy5qUPCzAnHJW2JcAjlXQZm3YAviGSJNEQBYZQ=;
        b=AE8WXyIsIJt5ke8dzRYox1xQcFkZ28l6Zo3mfMVVqmNUwbxVROLa6c3pvO9qmeljqY
         E/xYtw9DqE/iUiHlJOWrNNSzyI9DZIxk4tpHawu+sAulRGiTwI4A/XHXd5qzS7DSr4HF
         dK4L7LyAgFSjAvBF+MNFJaIlTdxSuokRbi8yq7tfreZChgXQUvgt2357t1NfHHxHKIM+
         xmzG0KxIU32mWu9HAmCV2csig/JBVVwqg/+RWgv6iZHh0ch/qkq4A2ri5oZT3BkJFnUJ
         msFNMLX1BQjXfxOFoVFU69JDipyDcxPwegz+7vqtIf6/mMId5fS3dlNaRGzvT8Cd87Vo
         Ja9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678627586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bh0gYoy5qUPCzAnHJW2JcAjlXQZm3YAviGSJNEQBYZQ=;
        b=KW2QHqg88t6ZsSYu4jnL+FpjkikN7BhUJjMmY5L26rPgkwkxaTdXX7/A7RXbbgLrby
         j9GR0lL/x2uJdPcQxJo3wfcIqHVkbfbAHeQLLUvYtZ/FxEqjvFEtxb5bpanO0sr1ou7u
         vyCk/Z9Hhz6OA4LZgcDiHrOT5RqIV5jPqCANOaYmbbQxAgytdDMzzspE6xVx1Po9iFre
         YGTwu9Ob95W2+tfkGDXU47hTDaDD/XbB5CLSrEdAAEONlpXHzAts5F5cDnWcPIISuSCx
         pB6GUHwuTotzxNJkE3C+HsfTb01Bi4LfPCRu4WNWt1T8DKZwwKDwrL9f2pLx6RSHyckd
         BZ4g==
X-Gm-Message-State: AO0yUKVZBmSQ4AodZtAQGMrKl6VFhDyIteaWKczfHpOLg/S1roPNCMih
        G6+FMM2ZRkmxW9sXngK+aOkSfw==
X-Google-Smtp-Source: AK7set/VqG0ty4Kc1o9DfSV+u+OvuwlIBSANdt81OhIZuVLgoU+YDCAO63rRY8F6xlJQ3YGugXrpVA==
X-Received: by 2002:a17:906:8506:b0:920:38f:b6ce with SMTP id i6-20020a170906850600b00920038fb6cemr4461649ejx.33.1678627586208;
        Sun, 12 Mar 2023 06:26:26 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id xc14-20020a170907074e00b008b904cb2bcdsm2262530ejb.11.2023.03.12.06.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:26:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>,
        Daniel Oliveira Nascimento <don@syst.com.br>,
        Mattia Dongili <malattia@linux.it>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] platform: olpc: mark SPI related data as maybe unused
Date:   Sun, 12 Mar 2023 14:26:22 +0100
Message-Id: <20230312132624.352703-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The driver can be compile tested as built-in making certain data unused:

  drivers/platform/olpc/olpc-xo175-ec.c:737:35: error: ‘olpc_xo175_ec_id_table’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/platform/olpc/olpc-xo175-ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/olpc/olpc-xo175-ec.c b/drivers/platform/olpc/olpc-xo175-ec.c
index 4823bd2819f6..04573495ef5a 100644
--- a/drivers/platform/olpc/olpc-xo175-ec.c
+++ b/drivers/platform/olpc/olpc-xo175-ec.c
@@ -734,7 +734,7 @@ static const struct of_device_id olpc_xo175_ec_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, olpc_xo175_ec_of_match);
 
-static const struct spi_device_id olpc_xo175_ec_id_table[] = {
+static const struct spi_device_id olpc_xo175_ec_id_table[] __maybe_unused = {
 	{ "xo1.75-ec", 0 },
 	{}
 };
-- 
2.34.1

