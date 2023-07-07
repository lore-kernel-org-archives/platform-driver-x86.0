Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DACEB64DA
	for <platform-driver-x86@archiver.kernel.org>; Fri,  7 Jul 2023 14:15:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbjGGOPR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 7 Jul 2023 10:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232874AbjGGOPQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Jul 2023 10:15:16 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183752126
        for <platform-driver-x86@vger.kernel.org>; Fri,  7 Jul 2023 07:15:06 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-314172bb818so1994270f8f.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Jul 2023 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688739304; x=1691331304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=la3bQRWi9gF9xOi3gaBQkAEuofgliDxU23nd6CtNmNk=;
        b=Mxk2F4EjhplwWeoO2p8qKJ3cn+IquoNXOUXkwXLb7+BZnS5NAjrqfLtNfP/6Wi4VeO
         87po02Oh/fhL14GoEwiHsJHed5I81AdfGgTLMfLzs1B5UFpqbTh+hHnPUNL4nYdl/sM9
         Co6jicNSKTPK2mmRNKhCYZ376iIG10OQ4zLQVf/9huhsm7JxnWUIy4PKeam1FKKHVYER
         v5/jgZfdU0nOW93r2XEpoKUxVPHtAaU1BFuN4ZDddx/gnif+cbY/plVVXRVJ58vV20eh
         BwNBBaAeCYA7mIpYF/wae6ZQ6Pcd29kr6HVnQmmxublAyOMo7BB9EF2b/a/6y6St8pM7
         ZKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688739304; x=1691331304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=la3bQRWi9gF9xOi3gaBQkAEuofgliDxU23nd6CtNmNk=;
        b=GxZync7xvoM/ZV67iBMKaIaAYqxaXKeimjx5RhH1FJfhMHp4sYFi3rSgeQyl9wSS37
         v1iOhdq1179xac/2AfwSfhSdf+ljd2YFPebt94G4Kax9CZbaIooajM0JglNpivhzRGnd
         0Xdbp6zWVdnFJ4LwfGE5v9G9K3naFq6L4VURN3aNhENdv/P6pJAq6x/Bd5M9PMvXpFSd
         1IOe7kIghN3ZKsELMe9qgW+gIo7RSqtREzJ7hdmt/G7vcuqvJwQ3N6Y0oBQRBN4MIWcf
         vZJ/RJxfujv23+UqM1gPQgX4Xj3Gjwdn6/IC0lkJH7vD1RrJjtg9GsYE2jc/OQMQQGIx
         No2Q==
X-Gm-Message-State: ABy/qLZh+ztkweBhdOUS57bImj7/oc4YDzeqhkBqc47BgAa0IaIygaj3
        ORpal9+ZQXsKOd8m8KF1mwU=
X-Google-Smtp-Source: APBJJlGY4H0z4d9UVssVE+SZvpG9oLcRwHBPXIUOwRev1iIllBvn37ynx5V1/T8OplZIX4rDejR8xg==
X-Received: by 2002:a5d:40c1:0:b0:314:399f:cfa8 with SMTP id b1-20020a5d40c1000000b00314399fcfa8mr4238800wrq.43.1688739304484;
        Fri, 07 Jul 2023 07:15:04 -0700 (PDT)
Received: from fedora.. ([2a01:e0a:a9f:60f0:5d0b:d730:cb58:674c])
        by smtp.gmail.com with ESMTPSA id z12-20020a056000110c00b0031423a8f4f7sm4582388wrw.56.2023.07.07.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 07:15:04 -0700 (PDT)
From:   Thomas GENTY <tomlohave@gmail.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Cc:     tomlohave@gmail.com
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the Archos 101 Cesium Educ tablet
Date:   Fri,  7 Jul 2023 16:14:25 +0200
Message-ID: <20230707141425.21473-1-tomlohave@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add info for the Archos 101 Cesium Educ tablet
It was tested using gslx680_ts_acpi module
PR at https://github.com/onitake/gsl-firmware/pull/210 for the firmware

Signed-off-by: Thomas GENTY <tomlohave@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 68e66b60445c..a5b687eed8f3 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -26,6 +26,21 @@ struct ts_dmi_data {
 
 /* NOTE: Please keep all entries sorted alphabetically */
 
+static const struct property_entry archos_101_cesium_educ_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1280),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1850),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-archos-101-cesium-educ.fw"),
+	{ }
+};
+
+static const struct ts_dmi_data archos_101_cesium_educ_data = {
+	.acpi_name      = "MSSL1680:00",
+	.properties     = archos_101_cesium_educ_props,
+};
+
 static const struct property_entry chuwi_hi8_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1665),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
@@ -1047,6 +1062,13 @@ static const struct ts_dmi_data vinga_twizzle_j116_data = {
 
 /* NOTE: Please keep this table sorted alphabetically */
 const struct dmi_system_id touchscreen_dmi_table[] = {
+	{
+		/* Archos 101 Cesium Educ */
+		.driver_data = (void *)&archos_101_cesium_educ_data,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "ARCHOS 101 Cesium Educ"),
+		},
+	},
 	{
 		/* Chuwi Hi8 */
 		.driver_data = (void *)&chuwi_hi8_data,
-- 
2.41.0

