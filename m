Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0066DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 Jan 2022 08:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbiADITo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 Jan 2022 03:19:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234180AbiADITo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Jan 2022 03:19:44 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3842C061761
        for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jan 2022 00:19:43 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id r5so32103164pgi.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Jan 2022 00:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kLTkiMyNnQCtB7TRGqBS1d7XJq61IG4uEvm4IPsV6YA=;
        b=Jo8SjkBs0/vdlXtBqXzWVz+u9I//wI7czOwsz3lKHn+P2YIqyPE+pnGcZKiIT7cPDN
         1lQx8abB8J9CJhxhUlpvKIylm0Wc5aLt2YBE7pTLVVCBGkHU4r1+xO0VTqlYNsaUpabU
         eXQXarFt2cSXUbkQwx8qbOUsiBKIkOlpR883VRu8fBYoplVJHBDl+02f1tbIgdsD9UZw
         yjSFfHy6cLZwk1b5eDksb//+Y60ZQZ6xdo8/TILrotD1dlbR99I+S+XPIhF+3WCUGU00
         owoTw/+2nb5Jq0x0n/bEeduUh26mGrtmXWw89xRgxH6Shs9oBePGI77hiHst2Cwu9Nql
         AhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kLTkiMyNnQCtB7TRGqBS1d7XJq61IG4uEvm4IPsV6YA=;
        b=CuQh0heClMuJyG94Nh0yZCLaJeb3Qbz1KGoWsQmGeSxBbPJdmwTyEvSbW6CmWvz/Gq
         KvSYS2GPX/sWIAPbCL+5fzpplSX2HhVBP2E6mX9DDbEQOMFv8ZXpIE84BzCEeN+NdkRw
         lmCiQSdzxvIQZ94h5oygzuMj+LZ2qG4M6ClmIdLntH3TfH2hYbKcmTDlHU+scztDgljg
         oPELW+Gv29bqbX6lJR+J8XESVhHnFP0pkQpXsp61myHLrQ+Ypm0omc3TWv/kuzD1xQVB
         FWwbRiliUis+1+pcSHpDBUiBbvM/hk3N4Ej9dabRED68zVS3LRilFsXyGdx/806X1q3A
         9sIQ==
X-Gm-Message-State: AOAM533WNaefjNx1pjjmDLm8FY3hzmoJEYBzBExSwGjlBxVRJBlZHr5b
        +pb/N0QHSvlEtUzx88T1u4o=
X-Google-Smtp-Source: ABdhPJydi5LxyEzWa1E3Wd1H6s0YMJXdvgKP62Hhh9uZPC3/4aiM5ZyW+kBacbXFi+GKg2XFbMHwQA==
X-Received: by 2002:a05:6a00:244b:b0:4ad:5852:f41d with SMTP id d11-20020a056a00244b00b004ad5852f41dmr50277291pfj.29.1641284383487;
        Tue, 04 Jan 2022 00:19:43 -0800 (PST)
Received: from localhost.localdomain ([133.159.152.132])
        by smtp.gmail.com with ESMTPSA id w5sm38849298pfu.214.2022.01.04.00.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 00:19:43 -0800 (PST)
From:   yuk7 <yukx00@gmail.com>
To:     hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org, yuk7 <yukx00@gmail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the RWC NANOTE P8 AY07J 2-in-1
Date:   Tue,  4 Jan 2022 17:19:20 +0900
Message-Id: <20220104081920.1794275-1-yukx00@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add touchscreen info for RWC NANOTE P8 (AY07J) 2-in-1.

Signed-off-by: yuk7 <yukx00@gmail.com>
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

