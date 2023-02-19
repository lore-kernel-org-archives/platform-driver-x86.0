Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBB1C6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Feb 2023 14:39:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbjBSOjJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 19 Feb 2023 09:39:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjBSOij (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Feb 2023 09:38:39 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1210F26A3
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Feb 2023 06:38:18 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id c17so334981wrx.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Feb 2023 06:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hT0OFrc5BzA/EvvKaTBdDeJt/aCTGhUdeg6ktzHv2us=;
        b=sfwr9FAw99JPs2jgsRVuLndpE8yao9Kl+E/z7U0mtt0pP2wD2IO88tvDM316wqGWhU
         bOtdbmo6FuZElTFCkVycRnwUmdf4ah20jq0eL1sf/3WBmvAFbi2/ShUdbPUPupKNwlH7
         DtQV0DPhDXMxxhggpMeDdWPhTaWIjd7+vtd/a5ko8mGoFoZ1GDgtQSozSm3RpQyPFhMD
         DuUmE3eZX4nzx1bu3urwLB8LPnbclLMZNDMlpdEJLtabwYjR2FNOfQGWKOlK4oF5mHWd
         U46QiQUoGN1d9JMBk+FmgjQY9n9uqv84+h9mvy6RR7cjaYif91wVlSrCddz1YUdlDHX8
         zVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hT0OFrc5BzA/EvvKaTBdDeJt/aCTGhUdeg6ktzHv2us=;
        b=ZxSYj6YkpU+y+d2MF9DrvqlpISbzxeTQBwq42+8X1MEjjfFpAu4KBqqM57bBfDf2zd
         tItfH4/tyBFbz3HHGMrcCDw7sDalYnfWHUI8F4me9yzPZW8j5b7YOH7XKf1xNDTky2N8
         QyfRqE56N8m6yqYGC5tlcyKAM3or+253LYXe1O4yLqh0CinW0TP14sMupDZk/SwoPuBz
         kzBh6Qmg11n6VfMaJTKhpc/LFeN7MpY94cSfGdHIoHcCTfh6JQ3ILjfzxljdjrSZqXMa
         qbzCrlfOqq7ev5jV0Z9MsrIxdd97zpBUT3gzWTHGUJhYhOhMd+EHXM0Smb4yHye5n75j
         gjuA==
X-Gm-Message-State: AO0yUKUhzT87JAlxgRPk6pZ7HXhviKr9WwXBD+l0jZCTLZG903zQ1gzf
        ogY8wKF2tx9bDX0SarO6MOQ7aQ==
X-Google-Smtp-Source: AK7set9g+Xv8475Uge2nzGCrlGdlaMCAyOgNN15o6NiNULAV3ygGhrWV1qTQ1r30QtA0D7O9N+C6iQ==
X-Received: by 2002:a05:6000:1789:b0:2c6:825d:ed13 with SMTP id e9-20020a056000178900b002c6825ded13mr368030wrg.25.1676817496530;
        Sun, 19 Feb 2023 06:38:16 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:6f43:b92:7670:463])
        by smtp.gmail.com with ESMTPSA id a18-20020adfe5d2000000b002be505ab59asm86176wrn.97.2023.02.19.06.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 06:38:16 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org (open list:ACER ASPIRE ONE
        TEMPERATURE AND FAN DRIVER)
Subject: [PATCH v1 15/17] thermal/drivers/acerhdf: Make interval setting only at module load time
Date:   Sun, 19 Feb 2023 15:36:55 +0100
Message-Id: <20230219143657.241542-16-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230219143657.241542-1-daniel.lezcano@linaro.org>
References: <20230219143657.241542-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The thermal zone device structure is in the process of being private
to the thermal framework core code. This driver is directly accessing
and changing the monitoring polling rate.

After discussing with the maintainers of this driver, having the
polling interval at module loading time is enough for their purpose.

Change the code to take into account the interval when the module is
loaded but restrict the permissions so the value can not be changed
afterwards.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/platform/x86/acerhdf.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 1956469c3457..61f1c3090867 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -79,7 +79,6 @@ static unsigned int list_supported;
 static unsigned int fanstate = ACERHDF_FAN_AUTO;
 static char force_bios[16];
 static char force_product[16];
-static unsigned int prev_interval;
 static struct thermal_zone_device *thz_dev;
 static struct thermal_cooling_device *cl_dev;
 static struct platform_device *acerhdf_dev;
@@ -346,20 +345,15 @@ static void acerhdf_check_param(struct thermal_zone_device *thermal)
 	trips[0].temperature = fanon;
 	trips[0].hysteresis  = fanon - fanoff;
 
-	if (kernelmode && prev_interval != interval) {
+	if (kernelmode) {
 		if (interval > ACERHDF_MAX_INTERVAL) {
 			pr_err("interval too high, set to %d\n",
 			       ACERHDF_MAX_INTERVAL);
 			interval = ACERHDF_MAX_INTERVAL;
 		}
+
 		if (verbose)
 			pr_notice("interval changed to: %d\n", interval);
-
-		if (thermal)
-			thermal->polling_delay_jiffies =
-				round_jiffies(msecs_to_jiffies(interval * 1000));
-
-		prev_interval = interval;
 	}
 }
 
@@ -807,5 +801,5 @@ static const struct kernel_param_ops interval_ops = {
 	.get = param_get_uint,
 };
 
-module_param_cb(interval, &interval_ops, &interval, 0600);
+module_param_cb(interval, &interval_ops, &interval, 0000);
 MODULE_PARM_DESC(interval, "Polling interval of temperature check");
-- 
2.34.1

