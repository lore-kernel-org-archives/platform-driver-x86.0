Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FC1C433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 09:14:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50C3D61073
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 09:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhDOJPF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Apr 2021 05:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbhDOJPF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Apr 2021 05:15:05 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FB7C061574;
        Thu, 15 Apr 2021 02:14:42 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t22so11385605ply.1;
        Thu, 15 Apr 2021 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8QQanvqIsbT15bWZACbVjA2SrlomBIPcG7B7C48451s=;
        b=tFWaMlFRTNZDXyYkLqSWHWLlcViX2L7a4h+ZaB6JYG4WXIa2XA1BEJ9dAKOCqZeVTZ
         w0ql8mpjbQZNI7RQyfyIhZT3N48vLJ3BYtTl6FZQjabwmJ5vVnU/6zz8CjoxqcOSFInF
         48tWqx3TOjIfh9omZGbIeICMV8SOFaW2GRyVAW0yHjFStRYAXb6Npp+w+vEyjQexTw8u
         yNeAOOoXPpoZF3tV4qF9mU7UjIk9y6ktbQSTQv/AkZbhunEMU1DTeYE3VBxJmpwfUHYQ
         0xlWsTR1dB65wbfwz0oTMeAKYvcQds7jgxTTzghs6JHvhPyOPUtuVkIH/aQryMs4+u7Z
         RgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8QQanvqIsbT15bWZACbVjA2SrlomBIPcG7B7C48451s=;
        b=JePLpuESPLbowwL9NHHoUxqiZgSJ45XDBQfvTupfxg44KEvDqXz7yxQP0I7dWKo+oi
         6YLZcoAK16TdEgclWM+GDGI8OnXEvaGXvWPi0kJdDT46X9KH+nmRX3DqqUjLQs3n/Kk4
         h1xtmcgooIL6F64LVFn7bolTFE5YwFSWp2zC8xKHrHtZ7/IBaDpWN6qk/DMNAr9f3Rrm
         XDkVIQG2P837lJEdAjdiMt6EhIMGhdIbJE2x8hJKKsecydxBu8gGmp5bOJRrHJrFFzoj
         SDdfuxsQixnDTXriX0wbhqBc8f7gPfCRamB/HRbgvA2QEy8TCdX2pZx1cEqDGonDr1XS
         9mdA==
X-Gm-Message-State: AOAM530/rfAmtSAbVCthWfaOA6dVJi2eE/2FUQ4UYOBBYw/D65hqvCEr
        p1cdp1HhoHTehJnBpjHS3xNVpAUD5NPv+Ciu
X-Google-Smtp-Source: ABdhPJxnaseCIkuSx/rHHhtIaAlwpSFCAwxMCggKZi36BRt2BlcfkjXMbBd9Uxh0ah8ZJ2B+yuEuUQ==
X-Received: by 2002:a17:90a:b891:: with SMTP id o17mr2862355pjr.180.1618478081956;
        Thu, 15 Apr 2021 02:14:41 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([209.9.72.212])
        by smtp.gmail.com with ESMTPSA id y68sm2051153pgy.5.2021.04.15.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:14:41 -0700 (PDT)
From:   zhuguangqing83@gmail.com
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guangqing Zhu <zhuguangqing83@gmail.com>
Subject: [PATCH] platform/x86: intel_chtdc_ti_pwrbtn: Fix missing IRQF_ONESHOT as only threaded handler
Date:   Thu, 15 Apr 2021 17:14:35 +0800
Message-Id: <20210415091435.10486-1-zhuguangqing83@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Guangqing Zhu <zhuguangqing83@gmail.com>

Coccinelle noticed:
  drivers/platform/x86/intel_chtdc_ti_pwrbtn.c:59:7-32: ERROR: Threaded IRQ
with no primary handler requested without IRQF_ONESHOT

Signed-off-by: Guangqing Zhu <zhuguangqing83@gmail.com>
---
 drivers/platform/x86/intel_chtdc_ti_pwrbtn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_chtdc_ti_pwrbtn.c b/drivers/platform/x86/intel_chtdc_ti_pwrbtn.c
index 0df2e82dd249..9606a994af22 100644
--- a/drivers/platform/x86/intel_chtdc_ti_pwrbtn.c
+++ b/drivers/platform/x86/intel_chtdc_ti_pwrbtn.c
@@ -58,7 +58,7 @@ static int chtdc_ti_pwrbtn_probe(struct platform_device *pdev)
 
 	err = devm_request_threaded_irq(dev, irq, NULL,
 					chtdc_ti_pwrbtn_interrupt,
-					0, KBUILD_MODNAME, input);
+					IRQF_ONESHOT, KBUILD_MODNAME, input);
 	if (err)
 		return err;
 
-- 
2.17.1

