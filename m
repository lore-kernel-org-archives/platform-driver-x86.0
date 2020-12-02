Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67A8C71155
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 22:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FB3B221FD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 22:23:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbgLBWXP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Dec 2020 17:23:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgLBWXO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Dec 2020 17:23:14 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50431C0617A7
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Dec 2020 14:22:34 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id g185so622633wmf.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Dec 2020 14:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LRXtGtQx0V38uULFsTPi/qjTFIKnBLoKo8MU7obqjyU=;
        b=E06twwEMJ8K66tEsIJl1OyT2WbCBwVJRU0XbGlu1c/FOLMDuP3vUOkSGVgbowqMHOz
         N/4X85VeDi4KiWUjgpqymbeiDaMUoRzV48Eq9g6JsAEv+32InsBV2CRj2jV/MoiKqSQ2
         J1k9Dl5ovU1lCA1ZFl+VcjBnSq6njDdIMb5a3t3k73L1v9Dt0xnPktb/3UaBxVIQiN2x
         iJpCeEnGOrC2rH0JJj4JE8/PRR6tH6bf9c3CWqBJLgYWi+w7saeego0T/SEHOyP9uFyw
         MDD9uWQYGrfCSc0VYP4Qh7tw2WDIeKsVigxQLadb+LtQp+nuwqzhrtooTwahCxvqUTRU
         ahMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LRXtGtQx0V38uULFsTPi/qjTFIKnBLoKo8MU7obqjyU=;
        b=UQjz2YqRmcmluDHZhIoUT59MDv7aOEapXE7ih6hOtU0JQ5Ce6OjcB09/OYHFOaIstq
         Tlc3mpTl00epicwxPQvAdnhZ/vTp0ftQUL6fHWOy9SokVvnRgdfsu7J9ZXpsoxzdn7LP
         idfHCw97KsfrUgdSniJFqWu7XiWHj1LtYmbuZv709t84OGC9CXUqmvuXidQziLIGLvst
         WsNRBUND//GUKRCBOCU1JzgxbyNWwID5p7vya79+JneUtvzqut0wV9SG9FDSXGrOdos4
         QEF+bPHuouwPgv1/nM3itiuGiLyErLNhXOs/XPT3W5YS+y8NmXAVnG5ykiH1nuZthj/C
         uiMw==
X-Gm-Message-State: AOAM531nC+VvwnCuH36AB2RQJZXOzZukXbv/48Z4Mnz7ttruv/Jmbz1y
        jZkikZ5UGCLtCUyn9liO0G8XgA==
X-Google-Smtp-Source: ABdhPJxEXBGOGhTXe1z3x/CCv0w83dkticJSyr3zsDqEThZZ1//azfGM8xR1Q0czXAwVi3/x/sHB+A==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr104009wml.33.1606947752953;
        Wed, 02 Dec 2020 14:22:32 -0800 (PST)
Received: from mai.imgcgcw.net ([2a01:e34:ed2f:f020:1c7d:2d7a:9709:b9a2])
        by smtp.gmail.com with ESMTPSA id s8sm63672wrn.33.2020.12.02.14.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 14:22:32 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org
Cc:     Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org (open list:ACER ASPIRE ONE
        TEMPERATURE AND FAN DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] platform/x86/drivers/acerhdf: Check the interval value when it is set
Date:   Wed,  2 Dec 2020 23:22:12 +0100
Message-Id: <20201202222212.2313242-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202222212.2313242-1-daniel.lezcano@linaro.org>
References: <20201202222212.2313242-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently the code checks the interval value when the temperature is
read which is bad for two reasons:

 - checking and setting the interval in the get_temp callback is
   inaccurate and awful, that can be done when changing the value.

 - Changing the thermal zone structure internals is an abuse of the
   exported structure, moreover no lock is taken here.

The goal of this patch is to solve the first item by using the 'set'
function called when changing the interval. The check is done there
and removed from the get_temp function. If the thermal zone was not
initialized yet, the interval is not updated in this case as that will
happen in the init function when registering the thermal zone device.

I don't have any hardware to test the changes.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/platform/x86/acerhdf.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 19fc8ff2225c..084005841d56 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -334,7 +334,10 @@ static void acerhdf_check_param(struct thermal_zone_device *thermal)
 		}
 		if (verbose)
 			pr_notice("interval changed to: %d\n", interval);
-		thermal->polling_delay = interval*1000;
+
+		if (thermal)
+			thermal->polling_delay = interval*1000;
+
 		prev_interval = interval;
 	}
 }
@@ -349,8 +352,6 @@ static int acerhdf_get_ec_temp(struct thermal_zone_device *thermal, int *t)
 {
 	int temp, err = 0;
 
-	acerhdf_check_param(thermal);
-
 	err = acerhdf_get_temp(&temp);
 	if (err)
 		return err;
@@ -823,8 +824,19 @@ MODULE_ALIAS("dmi:*:*Acer*:pnExtensa*5420*:");
 module_init(acerhdf_init);
 module_exit(acerhdf_exit);
 
+int interval_set_uint(const char *val, const struct kernel_param *kp)
+{
+	ret = param_set_uint(val, kp);
+	if (ret)
+		return ret;
+
+	acerhdf_check_param(thz_dev);
+
+	return 0;
+}
+
 static const struct kernel_param_ops interval_ops = {
-	.set = param_set_uint,
+	.set = interval_set_uint,
 	.get = param_get_uint,
 };
 
-- 
2.25.1

