Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B4EECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Oct 2022 15:21:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236465AbiJ0PVK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Oct 2022 11:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236435AbiJ0PU3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2022 11:20:29 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D591C17E15
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 08:19:21 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id z17so1140025qkj.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ArN/ceylnEiTQ/ffcvkaRkBlDi2r/w3YlTdaaGRYyy0=;
        b=TBZFyhZ8VFkxJraM6oMydd20rFcNXgaDzV3Eahs4a5rNLpMc88DjEXedfr1aMtOEd1
         y3XKPeBHjK3bb8MVVwe6773bWMogMwYqzUTR0TCvNY9AXaq4QrxueuF/zsSoWFesHt87
         BZe2FQDx+9TlQd4jKXvs16YCM2v8qFWIYGTAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArN/ceylnEiTQ/ffcvkaRkBlDi2r/w3YlTdaaGRYyy0=;
        b=AolDMyOop+SyX+TIBI17UQtZEzfoyjNreB+3Otc8iObF+yr1ifJNowpJX1E3lkOyPe
         pj1P+mAYJ6u3gb0h3hMU1x5P0bE0mNqk+/uH+7cJgYkYM7/QGlFr6v/VocF9rXuTDge7
         c7MBLE6yRnEae5r+ncnOF+nF/mdN8hekt/UQm7+KAWPuHO670vZK1QZa6B2xdHp6bFdu
         3FcmxyHU6bh6JVh9zK4ByZWKB0vTVraDuS9r/nIPa2oLJg5wxDpR2WMB5hybKTZw8TN/
         kTRj0NMIzncLIF0Yswvtkv/lT70hxsR7uD0WyFrAYrfbZJpMZ7LBaAsLxg8YsKqeDdhm
         ueFg==
X-Gm-Message-State: ACrzQf2XaE9xGACzmt5itzC2rAEAl0aQbQODZ/SjtAFJ/+u1h628NY6G
        h4l3mHKsoc/7u8++oUuRvHX8ZkcCc3MoDg==
X-Google-Smtp-Source: AMsMyM64QjcZN1DaRl0v1/zORZGxJxiARNEEngkghQiRXIsLpBbXIynjbWXhY/LgeC2M6yNdor/jbw==
X-Received: by 2002:a05:620a:51ca:b0:6f5:71e1:5ccf with SMTP id cx10-20020a05620a51ca00b006f571e15ccfmr14767083qkb.217.1666883961039;
        Thu, 27 Oct 2022 08:19:21 -0700 (PDT)
Received: from trappist.c.googlers.com.com (128.174.85.34.bc.googleusercontent.com. [34.85.174.128])
        by smtp.gmail.com with ESMTPSA id w7-20020ac84d07000000b0039d02911555sm991304qtv.78.2022.10.27.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 08:19:20 -0700 (PDT)
From:   Sven van Ashbrook <svenva@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
        Rafael J Wysocki <rjw@rjwysocki.net>,
        Rajat Jain <rajatja@google.com>,
        Sven van Ashbrook <svenva@chromium.org>,
        David E Box <david.e.box@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Subject: [PATCH v1] platform/x86: intel_pmc_core: promote S0ix failure warn() to WARN()
Date:   Thu, 27 Oct 2022 15:19:14 +0000
Message-Id: <20221027151908.v1.1.I295e65357f06f162b46ea6fc6c03be37e3978bdc@changeid>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The "failure to enter S0ix" warning is critically important for monitoring
and debugging power regressions, both in the field and in the test lab.

Promote from lower-case warn() to upper-case WARN() so that it becomes
more prominent, and gets picked up as part of existing monitoring
infrastructure, which typically focuses on WARN() and ignores warn()
type log messages.

Signed-off-by: Sven van Ashbrook <svenva@chromium.org>
---
Against v6.1-rc2

 drivers/platform/x86/intel/pmc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index a1fe1e0dcf4a5..834f0352c0edf 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -2125,7 +2125,7 @@ static __maybe_unused int pmc_core_resume(struct device *dev)
 	}
 
 	/* The real interesting case - S0ix failed - lets ask PMC why. */
-	dev_warn(dev, "CPU did not enter SLP_S0!!! (S0ix cnt=%llu)\n",
+	dev_WARN(dev, "CPU did not enter SLP_S0!!! (S0ix cnt=%llu)\n",
 		 pmcdev->s0ix_counter);
 	if (pmcdev->map->slps0_dbg_maps)
 		pmc_core_slps0_display(pmcdev, dev, NULL);
-- 
2.38.0.135.g90850a2211-goog

