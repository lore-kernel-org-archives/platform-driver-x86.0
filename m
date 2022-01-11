Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FCBC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 15:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343634AbiAKPlt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 10:41:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240342AbiAKPls (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 10:41:48 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD8EC06173F
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 07:41:48 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id n30-20020a17090a5aa100b001b2b6509685so6540964pji.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 07:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a1rcTVMhr+5X0OWDgh5EQnlakL72leepXFH5ExqfQJg=;
        b=oDCuvDgyXkFKge6KeSC6QtHDPq7Ii3v7zLrazsIESG3AVZrt30TMPSUMVl8jgyige0
         OWSjHBu0kRny9FA36J5TYvFiTbt2EbTKhn+skhMbMPqMinjggdOEsGlUwSbIcympq5/5
         tkawaUR51fMZHCOuWBI4aQauoOrSMu+lJsnHaiQSW2CiBHcjtLM5PjqJWmGdzX9rtQ4P
         sDpD5kpHUeAhJKjEr5MfR6ApvjstOPw9CH81/JE5dvtP/EJD9+NPawI/X9GVIjcfNav9
         86zdaJ669ro8okQCkvCirimS5gbvpXCoLi7YOZBzgpRYgAna+zmK1c9+CZyTZzh1O7q1
         9eKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a1rcTVMhr+5X0OWDgh5EQnlakL72leepXFH5ExqfQJg=;
        b=fKLz9JaW5S/q9nk23pYT/6TgOjocdGf00EUJ0Svlqb3sFg4g0/CcOfjsod5HlaP46l
         ejeuXw9WRm+iUC0eK+1xlLx3hXULPFq3b8bNAWYYv8YyMOozolt3oA38tAj9omKusVcU
         mzQZS9miNkHowGHp5RyDJhp8nshznIWG7ooQMgmkR5uXEAJD2ZlZQG1XlojYUv6pp2qH
         yd4cUtgx6UjsFCF6HiA6se1xURiK91sr1TTLFsHZHl2ItkFFoFzaUgWtoBwGHhTvJ+u/
         1Kp0nAk6kBD3CKTY8x8iKBNHtHBOYHRsMjjx/Ycvuh/qCUnHE98GQHjObj1J/xZrt0fh
         jeUQ==
X-Gm-Message-State: AOAM533UVHcX2x0yjSFv8NfyG8kUplm9KudLAHTfLTO70zBN4AfhA0cT
        Ghe0+0GlR/J+arMvTwpvN/0=
X-Google-Smtp-Source: ABdhPJwKKw+Nnz/FXBxjde4ZDb6ld4pL1YEWPq60LHFOlxBiPv5d9nFnNSPOaGjm8k4rXlb8J3mVww==
X-Received: by 2002:a63:3e02:: with SMTP id l2mr4460939pga.412.1641915707111;
        Tue, 11 Jan 2022 07:41:47 -0800 (PST)
Received: from localhost.localdomain (111.210.49.163.rev.vmobile.jp. [163.49.210.111])
        by smtp.gmail.com with ESMTPSA id y64sm8600078pgy.12.2022.01.11.07.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 07:41:46 -0800 (PST)
From:   yuk7 <yukx00@gmail.com>
To:     hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org, yuk7 <yukx00@gmail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the RWC NANOTE P8 AY07J 2-in-1
Date:   Wed, 12 Jan 2022 00:40:21 +0900
Message-Id: <20220111154019.4599-1-yukx00@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104081920.1794275-1-yukx00@gmail.com>
References: <20220104081920.1794275-1-yukx00@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add touchscreen info for RWC NANOTE P8 (AY07J) 2-in-1.

Signed-off-by: Yuka Kawajiri <yukx00@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 17dd54d4b..e318b4094 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -773,6 +773,21 @@ static const struct ts_dmi_data predia_basic_data = {
 	.properties	= predia_basic_props,
 };
 
+static const struct property_entry rwc_nanote_p8_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 46),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1728),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-rwc-nanote-p8.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	{ }
+};
+
+static const struct ts_dmi_data rwc_nanote_p8_data = {
+	.acpi_name = "MSSL1680:00",
+	.properties = rwc_nanote_p8_props,
+};
+
 static const struct property_entry schneider_sct101ctm_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
@@ -1406,6 +1421,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "0E57"),
 		},
 	},
+	{
+		/* RWC NANOTE P8 */
+		.driver_data = (void *)&rwc_nanote_p8_data,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Default string"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "AY07J"),
+			DMI_MATCH(DMI_PRODUCT_SKU, "0001")
+		},
+	},
 	{
 		/* Schneider SCT101CTM */
 		.driver_data = (void *)&schneider_sct101ctm_data,
-- 
2.34.1

