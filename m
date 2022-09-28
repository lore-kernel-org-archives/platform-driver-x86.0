Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FEEC6FA90
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Sep 2022 21:07:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234815AbiI1VH0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Sep 2022 17:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234648AbiI1VGN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2022 17:06:13 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B49E2345
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 14:02:32 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 130-20020a1c0288000000b003b494ffc00bso1522740wmc.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 14:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=v9HOYNemLB65v2s3X2Chh/1DsPPvYHZYg0+K/15aDgQ=;
        b=BUFAUjUJwKjdj3BdWvtUrp7i6aupg1QDMOuYMiG88xLog9Re9fT2zPdEN0KeQnspwA
         /8heYH+hjIJvcHgA9EyYiYRghT268lR3+LqCRnumfJbYJ8dXMvV93GFIoJqmA+bfYdON
         OMp2gMLt/adqa5KdxOq5BsYFFlKTyBUn1l5h3I1WOXl6F4agHlDPumig1div0qBNrNY2
         dxomCK+LxqUMxG7O1eCDWSWGCw82zjytzUqAktnyXqGQ7vJADK/duaJWVkQH+StKGS2G
         cqZWLF41IyWt5uMKdU8tqC5tGP42ZPHT4BQTw1/T6gadGf1ojWiv86OG9dMDYB2D9CSp
         l5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=v9HOYNemLB65v2s3X2Chh/1DsPPvYHZYg0+K/15aDgQ=;
        b=OzJr3f4qfpvc5HQL0mJw8CtVBxY5Jpf6FSMZm3nq4S4NL3MMmNWqMFy6O+VX5Q+s7l
         0wDpHYki4sel0T2zVu747vX7QwDjrJ8fjbywDla/0z6I2Kam84nrkKMq4gYKq+Iv53xF
         OGizmamzr5yBjcWqBIvLa072smc+M7jP6KoW5vLv038G0WhqEWOCFyYDFTFmv6zpWFxA
         rUdkSYmJnyqFPLz9uqL5lUT9BH+2ZhTPEwnih5dbnCbz50YUaZzRSvB8oDq8naMgilRF
         PbxBFHBYzIkW0RyA0wr/NBWn3GbQBfr7/FPri4bXhY72Pze64mcRBLV2O1v53vtzFTTc
         qBPA==
X-Gm-Message-State: ACrzQf13fMCV/y3AseeiLRYJnq3TdVu4WAYd0dKBeD1CYJwXjFXHAcI4
        IGAij+RRl4oSCEXYKex8uEoS6g==
X-Google-Smtp-Source: AMsMyM5GilkjF0jfyblG5lvwtkmWY6YZ/gExeprtxY84ll/ebaXFNJ6Bk2S4OXMnOwMc3qN3bhUMmw==
X-Received: by 2002:a05:600c:348c:b0:3b4:85b6:e7c5 with SMTP id a12-20020a05600c348c00b003b485b6e7c5mr8465933wmq.45.1664398951619;
        Wed, 28 Sep 2022 14:02:31 -0700 (PDT)
Received: from mai.. ([2a05:6e02:1041:c10:48a2:39eb:9d1b:8b8d])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4ed400b003b4931eb435sm2874300wmq.26.2022.09.28.14.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 14:02:31 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com, Raju Rangoju <rajur@chelsio.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Amit Kucheria <amitk@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Antoine Tenart <atenart@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v7 25/29] thermal/drivers/ti: Remove unused macros ti_thermal_get_trip_value() / ti_thermal_trip_is_valid()
Date:   Wed, 28 Sep 2022 23:00:55 +0200
Message-Id: <20220928210059.891387-26-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928210059.891387-1-daniel.lezcano@linaro.org>
References: <20220928210059.891387-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The macros:

ti_thermal_get_trip_value()
 ti_thermal_trip_is_valid()

are unused. Remove them.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/ti-soc-thermal/ti-thermal.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal.h b/drivers/thermal/ti-soc-thermal/ti-thermal.h
index c388ecf31834..4fd2c20182d7 100644
--- a/drivers/thermal/ti-soc-thermal/ti-thermal.h
+++ b/drivers/thermal/ti-soc-thermal/ti-thermal.h
@@ -38,21 +38,6 @@
 /* Update rates */
 #define FAST_TEMP_MONITORING_RATE				250
 
-/* helper macros */
-/**
- * ti_thermal_get_trip_value - returns trip temperature based on index
- * @i:	trip index
- */
-#define ti_thermal_get_trip_value(i)					\
-	(OMAP_TRIP_HOT + ((i) * OMAP_TRIP_STEP))
-
-/**
- * ti_thermal_is_valid_trip - check for trip index
- * @i:	trip index
- */
-#define ti_thermal_is_valid_trip(trip)				\
-	((trip) >= 0 && (trip) < OMAP_TRIP_NUMBER)
-
 #ifdef CONFIG_TI_THERMAL
 int ti_thermal_expose_sensor(struct ti_bandgap *bgp, int id, char *domain);
 int ti_thermal_remove_sensor(struct ti_bandgap *bgp, int id);
-- 
2.34.1

