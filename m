Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DA5C64ED6
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Feb 2023 11:25:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjB1LY7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Feb 2023 06:24:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjB1LYW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Feb 2023 06:24:22 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C51428869
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2023 03:23:48 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id bv17so9341870wrb.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2023 03:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677583423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS5MMzUrtYY5N2w5QCadh2L/6Lyuv9jfcaqNKoRqTRU=;
        b=wmROP6AyQSd/5lYDaTnJSUSDXdhXDdPFq6dWXSe77IejOrFttF3d59ytNrebe9bWZD
         7G9JvxGcOZeqMgxxKGV78ZWGnj3tWGl5eHJp0AcWtzyoe3qEdHGW6yN3eVOEs00SdMev
         1IXw0FeceljNrRpqTqA3WpAol75g+SiSq2TGI265YAs4USbddI0OBs2VZkN0y81+KQJC
         ag97hXN8hnVLeuV73nCVIlwWV1IJwsGLMorSpUivU/zZYBwtgadH+UPfQvbdnBvBiY/w
         nya+SL8nqgkYI8Z5tKMI0O3fcuoPiU9Z1AjYwN6Z44iSGmqj9rWQctC5xBwHXC8HoLf1
         f5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677583423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS5MMzUrtYY5N2w5QCadh2L/6Lyuv9jfcaqNKoRqTRU=;
        b=dSeaPIbcXHXvLDNqLG8bam8/TYytSsSvkSoy85ewLqlqzpRc0SlzYmUR98QB+8gF8R
         AZVPH4pDtIci00VkxgDBtvhe/DnKKZEpuDUegu9xvI+Y+fwmzDp9MicJu/jJ1uFJytxP
         J7zDaVUq7PI2q/ghmkBQc48ku6I/hjDwEQV46E2McuUzdhh2epFftdZogaP6EnubRAlM
         D1AZaghZaxIyAYAbanYSjOTq6O5Nb4aCcvRXUtRDTgB2K5zwyysHHQIsYOGtqkfuUJZ7
         Cf+mZDlASFLPYpmLfSL9AAr6pwlBYSO3OmXz5RU9o1F66DZd7zKWY6XlUTHW3h9ofOiK
         Qqiw==
X-Gm-Message-State: AO0yUKVzyCoecLV2+eCvMMKTjPaYCjG20Moq9P+SvjLszmK4m5zhLPUF
        Nfgp0F1tLh4RVikqhZ425wxhj+6plND65MPtbzip2w==
X-Google-Smtp-Source: AK7set/dTEth29o+dr/zBLrbuIlnFlYoyHiG+j5LuNH6wDymmrDcmCwbBZcl8aJWcvTmBiAmDk7x+Q==
X-Received: by 2002:a5d:63c6:0:b0:2c9:e34e:7d0 with SMTP id c6-20020a5d63c6000000b002c9e34e07d0mr2243434wrw.3.1677583422966;
        Tue, 28 Feb 2023 03:23:42 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:6830:6390:2815:b6a5])
        by smtp.gmail.com with ESMTPSA id z5-20020a5d6545000000b002c5501a5803sm9598130wrv.65.2023.02.28.03.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 03:23:42 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org (open list:ACER ASPIRE ONE
        TEMPERATURE AND FAN DRIVER)
Subject: [PATCH v4 19/19] thermal/drivers/acerhdf: Remove pointless governor test
Date:   Tue, 28 Feb 2023 12:22:38 +0100
Message-Id: <20230228112238.2312273-20-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228112238.2312273-1-daniel.lezcano@linaro.org>
References: <20230228112238.2312273-1-daniel.lezcano@linaro.org>
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
Acked-by: Peter Kaestle <peter@piie.net>
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

