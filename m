Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E049C61DA3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Feb 2023 18:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbjBUSJf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Feb 2023 13:09:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbjBUSI5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Feb 2023 13:08:57 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AE92FCE8
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Feb 2023 10:08:13 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id p16so1705057wmq.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Feb 2023 10:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXGnK42A4qCYJjA+dChUP0zhSGjDFyIg4/mKo/il8PQ=;
        b=gEBCgz35raawJSWhdXquGkwLq5Bl3DsbUBpnORQBazkiDOm7zRliO40D/jqg5aoqs5
         gfJPhuCLcF5dL1lL0pkX0w11BKkBacogGz41n1n8hCNbFGenntvfmeNsmQgqCyCZnYAp
         9O7H8nAWEfBQODQ9ObSCx55Pqc0KwpJzlOGmA3Ez9GHEr+e6t1si0x+WOpWVReLVA18P
         /W1/K891V36uQ1IWocOQo3oH2vl+bYDhNWTPEaCwVKfMmVgHJYnpA2sZUGMYyz0L+Z2D
         xNnKYU56b3GVjFNmWsQ7qyvYnMbjX+3GoLn9n8ZgddNX++ygyqQxB3P2PhcmY86SL9cn
         hm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXGnK42A4qCYJjA+dChUP0zhSGjDFyIg4/mKo/il8PQ=;
        b=iUg2OuzFSHGVOGcf9dzjagaohEi7sH/+9++MGHDwPoIcVVWZFuGIfiegHJrsNL4kSC
         xNvJU+RaxkFTdaVsMeR17CI6Z2MKemvrjY8J8Z3PdcJ14ajrS01wBi9atEKdaT/HTKUk
         +muo5zymt6ECcBlrLiFx6Zl/gnBOUBaChc8WA01SRt7IKstLguHIu7HdwQKCUfkiYxK9
         Bi5WIs3Ya7QJYW5KAao8PCOUY6hYwoaYG6FYaPWy1CbpY1OgI8+7VnrOjusGpe1H1Q6e
         7iAknG0uXo3fzfsPLUHD+SMwk/ai8ZWZF/pBoUUy/9IRaEW74x15OuJCkj4gn6NtVhE9
         Ixsw==
X-Gm-Message-State: AO0yUKWGRaO0bh5kP1sbaSVmlxDrTpguemuU/iBulyQg3jPz8WBSK2rI
        yR9myYIyaeeoWyG70y/8kRlbog==
X-Google-Smtp-Source: AK7set/AxKhdQLOX6PHD4ZrMdx67CH7MjQM/RjdI4qGJgjq1hrB5t+oWjz6Ic99/CuyVTvj3XAjUQQ==
X-Received: by 2002:a05:600c:2ac8:b0:3e0:114:62ee with SMTP id t8-20020a05600c2ac800b003e0011462eemr3974936wme.8.1677002890426;
        Tue, 21 Feb 2023 10:08:10 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:1e9:315c:bb40:e382])
        by smtp.gmail.com with ESMTPSA id c128-20020a1c3586000000b003e21558ee9dsm5107815wma.2.2023.02.21.10.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:08:10 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org (open list:ACER ASPIRE ONE
        TEMPERATURE AND FAN DRIVER)
Subject: [PATCH v2 14/16] thermal/drivers/acerhdf: Make interval setting only at module load time
Date:   Tue, 21 Feb 2023 19:07:08 +0100
Message-Id: <20230221180710.2781027-15-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
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
Acked-by: Peter Kaestle <peter@piie.net>
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

