Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258B8EB64DA
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 10:51:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbjGNKvv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 06:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234735AbjGNKvu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 06:51:50 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA411720
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 03:51:49 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3159d5e409dso1924913f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689331907; x=1691923907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kohT6Hd6nZdYcJ4DfvQ1FTBZVDjmixlQ0k+6GpMkxck=;
        b=RswgI+aif5Si4qUjmbXLiJGUfYdBEK0JIADuTCvDP3sS1N6JcfaGyimCDbQILguFT1
         CyahLpyqjM06Ez0/pkgtoL1/UrnPjdFwlufiVxnP808iC9inoDrdO7V1rCGJH0N6+vYD
         z09svMtM875lNp2YXeFpu6cOnTTFRAPYt5QxSvELUpv+OUdgt51ifbDNj7yOGfHeZmG3
         aC4mHYiz7ASu/1fpfK/414EeI8lSAEdw3wcR8wU3moSn0LQQbd6xPU82fIaoPgh5+eDB
         9K9hQ9UsraOrSZS1RrX/jtZMRyJWV3D+niUxolTE76tCR9v1KJqT8FaJoc1Kbl6QcSVf
         UXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689331907; x=1691923907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kohT6Hd6nZdYcJ4DfvQ1FTBZVDjmixlQ0k+6GpMkxck=;
        b=e9TFn/D+ap4TPm2GW26Mytgzd0cQdr15hmAFTGW7xXjeizO77nJ1o395JmjB5C7FWF
         3Bx1gLAF/rskK2JVyIK4D8qtqprQ5BK85+8m0nCq+o/bKJk9xf5GTruYs6hPiOiZLSPZ
         w/EljV7/Mi1QWuZWiIhr2y7kQiwZQzBvuLmDdNag1W7K70dB9nu1uFzSBqPe2nqwwr2K
         OQNJXhKpascySIqUYpS0gLwUaTMsbTh8tv6H1c5fwW1tCoOHJuYTS70n4oDMpwJDtGbL
         QCdRoJv2gGX4htFo5tdCIYq9h3fRtzVAUtTZtgQy25tjisJq/wZDPVmmaWf7oXKGz3Yo
         I+1g==
X-Gm-Message-State: ABy/qLYFYwPMZn5C/9zgAHKhEFdrsE+hOXgD6JuI/4KdaPvYYwhAWOpp
        vHrRgQBx2BPrz7rmyq/ozCKShvlhpxp9hA==
X-Google-Smtp-Source: APBJJlH2PQdts3pFOFXVuYf9qKHBixOb/RGafKU820YsJwlgauKSNrNkNRPVQQBw7i5rR89SpS7djA==
X-Received: by 2002:a05:6000:181:b0:314:2c77:681b with SMTP id p1-20020a056000018100b003142c77681bmr1884184wrx.30.1689331907289;
        Fri, 14 Jul 2023 03:51:47 -0700 (PDT)
Received: from fedora.. ([2a01:e0a:a9f:60f0:5d0b:d730:cb58:674c])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b003062b2c5255sm10524054wrx.40.2023.07.14.03.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 03:51:46 -0700 (PDT)
From:   Thomas GENTY <tomlohave@gmail.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Cc:     tomlohave@gmail.com
Subject: [PATCH] touchscreen_dmi.c : small changes for Archos 101 Cesium Educ tablet
Date:   Fri, 14 Jul 2023 12:51:17 +0200
Message-ID: <20230714105117.192938-1-tomlohave@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It fixes axes and adds home button support as suggested by Hans de Goede

Signed-off-by: Thomas GENTY <tomlohave@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index a5b687eed8f3..f9301a9382e7 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -27,11 +27,12 @@ struct ts_dmi_data {
 /* NOTE: Please keep all entries sorted alphabetically */
 
 static const struct property_entry archos_101_cesium_educ_props[] = {
-	PROPERTY_ENTRY_U32("touchscreen-size-x", 1280),
-	PROPERTY_ENTRY_U32("touchscreen-size-y", 1850),
-	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1850),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-archos-101-cesium-educ.fw"),
 	{ }
 };
-- 
2.41.0

