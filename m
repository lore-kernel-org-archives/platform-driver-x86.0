Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FB4C432BE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Aug 2021 12:07:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27561608FE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Aug 2021 12:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235267AbhH2MIF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 29 Aug 2021 08:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235256AbhH2MIE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 29 Aug 2021 08:08:04 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7A2C061575
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Aug 2021 05:07:12 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id ia27so24601177ejc.10
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Aug 2021 05:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version;
        bh=p12JvPtoyqfgUnbiVPzsEUxqo4CpfcVrsP8eawBm2Vc=;
        b=gboa2+Ms1J5mbEFlhSxSRjNLf/EXLm7itQwjxtMdbu/qkb9VZ+0fcKdIWsaA5ukIXW
         oykYEwVRiJSuQZdwp1ugYYrZ9CdAGLryYwcU0BDl3cxK8m5jE0Z8t1AWOtqll69ETW+J
         Alkp2ixP99/fLWBrRMwILPLJeSSVbaiM04k8BRaDW/WfdLiKmUd0bpuHu87RCDpcnjM+
         RNnvP93EVYqEUpGp/Rxvz9w2UuwO9CqPMYQc26TK+Agf8iiz4Bgh2SoB4LR2GerKIXkN
         YYNMOFcdml0gDotSncTzcea1n3V0oRLUEQYSIfjvTmUhm2jVjfzGMgMauX+aAN1mdBXP
         hZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version;
        bh=p12JvPtoyqfgUnbiVPzsEUxqo4CpfcVrsP8eawBm2Vc=;
        b=REON198WJGbIG7lVIVdVNwTQkoTuaUv2B3JNJbHLt/RSDmEVp6v6kxsD2pQGnIPxq3
         sjGTx89ntarQh0GIUls9xqlkrB1YcmhYnsF3Rvi/gxM1UuLbo1xCg21Z2vhGErfT+G88
         Aw0eNIH9GrJxtB6QTJpwq4xYOTBkzqHH3IX2Qf+mZSnKvCo+RDoaW/mdZX2rMy8hMcDu
         exxHf9ZQqpr723+DXp4yk00hcRYJz5yi1emRbzFSU8/Q9C8J33hfr6JyFMbxtE0/StWq
         Ly+26aN15dbityhJuTDJGKQpZtygBZVBnF27m1LfNcX7+rC7iBBqlIJMAK8xPp4UKQqG
         Mspw==
X-Gm-Message-State: AOAM530YOAZkzUmmWbrq89PdFdUiRzgFIj+l52tAzPRbvmewh9mU/dUb
        nVIbMvqCa+eeY3EgQbNGtKf5BJBgOzxRTCI=
X-Google-Smtp-Source: ABdhPJyikCAdZKE15jMN7Ezt2IeDeH6TTujDh4KJVcD/H6UeE7EFeIhDt2K36Yi1mscwSZ8BQ3Kbqg==
X-Received: by 2002:a17:906:3498:: with SMTP id g24mr20341289ejb.490.1630238830662;
        Sun, 29 Aug 2021 05:07:10 -0700 (PDT)
Received: from localhost ([2a00:a040:195:275f:a6c:9a74:aff1:31c5])
        by smtp.gmail.com with ESMTPSA id p23sm6292383edw.94.2021.08.29.05.07.09
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 05:07:09 -0700 (PDT)
Received: from 127.0.0.1 (ident=unknown) by matan.home with esmtp
 (masqmail 0.2.21) id 1mKJae-7dK-00; Sun, 29 Aug 2021 15:07:08 +0300
Date:   Sun, 29 Aug 2021 15:07:08 +0300 (IDT)
From:   Matan Ziv-Av <matan@svgalib.org>
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
cc:     Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] lg-laptop: Correctly handle dmi_get_system_info() returning
 NULL
Message-ID: <93ff3bb-503b-f73-bf18-87bae1699ed@svgalib.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


The laptop model is identified by parsing the product name. If no 
product name is available, do not try to parse it.
Default model is 2017.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 drivers/platform/x86/lg-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index 3e520d5bca07..88b551caeaaf 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -655,7 +655,7 @@ static int acpi_add(struct acpi_device *device)
 		goto out_platform_registered;
 	}
 	product = dmi_get_system_info(DMI_PRODUCT_NAME);
-	if (strlen(product) > 4)
+	if (product && strlen(product) > 4)
 		switch (product[4]) {
 		case '5':
 		case '6':
-- 
2.31.1

-- 
Matan.

