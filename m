Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFCAC6369E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 22:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 069AB20709
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 22:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgLBWXN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Dec 2020 17:23:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgLBWXN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Dec 2020 17:23:13 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7CB8C0613D6
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Dec 2020 14:22:32 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id g185so622477wmf.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Dec 2020 14:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EJeEoDEeYHBeUS2YirOFrUkbP35JeO1CRiL+bErAeW0=;
        b=kBRld3J+mAXsKTi9w0PE358ZN0q7W4Yn1eDlhOle2/1Jzh/SOfwi2otG17uAn4srf8
         bmqzlu6zF0GmKQLDBKfG3TSDwEBOkdok+B85dYrXw5PrkVOP2Z0u9LlctZIUXQOeeNr7
         Fgpwa78Rb9JrpDGcxyPjTlZhPoK8mappbkXAidtMt9TkjNJ/tTmWYwyT74FTMZpVHceI
         tuNgTfXvy5lRfnJuXMVhPaa9eO0OjLnn4JWhpKiu3J1axZ+KAo4mxjrjRqDB1J52qpTg
         XT8EF3Sv9cFA84f+M5PV20JSyGpbJNZIW2GXTiPtExEzoFTRtvD9FNNelcecEMu+cFOF
         U91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EJeEoDEeYHBeUS2YirOFrUkbP35JeO1CRiL+bErAeW0=;
        b=NJxCnzlJAxtqXl9AosnmhAB1L0qlFhTS/i+xk6LFLYVMNF3WbzGItf+hNeN9dipvWO
         PG5AzF5xyMLiTs7uo0TzBQ61ThW6XtMkvVU2BDaGrX3AoUSL0WWK4jPzK278DBAoh23V
         XjvF1I/EXaeXoy5zByTeDMg84mH1obE8xDaYJ2Eva7bKMjtY/QfzV0w5wvSrzXqzvj8T
         RLI9VBBJZOIvoy76VTXcEynQOY5NUq0EGITSqSuq+DVyNKd5KHUTlPJvssKXGzrwzKOD
         9Ieb+eJkMhzjZ4cMrUCaDhzF4rpgZrTPo2PLzKx2QnSIf3DTfCVrWTsh/RycS+coq1nd
         zTXw==
X-Gm-Message-State: AOAM531vHtU4OzYx9H3JL4yCOxmncnZHL9+W4/1ZLlhcT6jeELxEfZvq
        O0/HFKoxagGeDCq9pYbyqf8Wrg==
X-Google-Smtp-Source: ABdhPJz4oBsckuNfzWb15rwpYUgHajOpKpgYsJOw/+tLPj+kFW6SG1TV5YWN9x/BsXwp1pbo/FCp4Q==
X-Received: by 2002:a1c:3d86:: with SMTP id k128mr122654wma.66.1606947751390;
        Wed, 02 Dec 2020 14:22:31 -0800 (PST)
Received: from mai.imgcgcw.net ([2a01:e34:ed2f:f020:1c7d:2d7a:9709:b9a2])
        by smtp.gmail.com with ESMTPSA id s8sm63672wrn.33.2020.12.02.14.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 14:22:30 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org
Cc:     Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org (open list:ACER ASPIRE ONE
        TEMPERATURE AND FAN DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] platform/x86/drivers/acerhdf: Use module_param_cb to set/get polling interval
Date:   Wed,  2 Dec 2020 23:22:11 +0100
Message-Id: <20201202222212.2313242-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The module parameter can be set by using ops to get and set the
values. The change will allow to check the correctness of the interval
value everytime it is changed instead of checking in the get_temp
function.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/platform/x86/acerhdf.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 44b6bfbd32df..19fc8ff2225c 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -84,8 +84,6 @@ static struct platform_device *acerhdf_dev;
 
 module_param(kernelmode, uint, 0);
 MODULE_PARM_DESC(kernelmode, "Kernel mode fan control on / off");
-module_param(interval, uint, 0600);
-MODULE_PARM_DESC(interval, "Polling interval of temperature check");
 module_param(fanon, uint, 0600);
 MODULE_PARM_DESC(fanon, "Turn the fan on above this temperature");
 module_param(fanoff, uint, 0600);
@@ -824,3 +822,11 @@ MODULE_ALIAS("dmi:*:*Acer*:pnExtensa*5420*:");
 
 module_init(acerhdf_init);
 module_exit(acerhdf_exit);
+
+static const struct kernel_param_ops interval_ops = {
+	.set = param_set_uint,
+	.get = param_get_uint,
+};
+
+module_param_cb(interval, &interval_ops, &interval, 0600);
+MODULE_PARM_DESC(interval, "Polling interval of temperature check");
-- 
2.25.1

