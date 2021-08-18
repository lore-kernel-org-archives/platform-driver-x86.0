Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC940C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 13:41:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BF4B60EBC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 13:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239200AbhHRNlp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 09:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238483AbhHRNla (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 09:41:30 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FDBC06179A
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 06:40:29 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id d11so5092588eja.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:from:date:subject:to:cc;
        bh=6ZlC95CqOPxf9kzJAdpZaHzgu6ssgdW87W6REEYrNPQ=;
        b=1hJxAZ1K+22xChbK4sx3+okbHXA8F/qfeqZAlEhx1bXqDp5Pov6PHuXWF5hOlkP4FQ
         zLzvn3pseoeEUCAUy0uHDJRIN/p2+qszbG1jvUHAbSc8y1WrS+2b/pvukt28p9x2F923
         spsJvMiNM8XJMYmPhxu7cjC5c8V3VEz+SGDRMueyDZZT26JtSB9Ncy2VkqFYFTHFNX76
         y7KRz75Q/9OpkbWzoBZr0LvLLp1j76nnoJ/ZlFksdmkbJN94R8sq4MXFH2RjMLdfnD3W
         xhsk6Asv51WyLqnsreVxhTNeVGrr8hwqvAAG13oys6JfwhDo2K6UKGGD+Gcu2lySNp88
         ZwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:to:cc;
        bh=6ZlC95CqOPxf9kzJAdpZaHzgu6ssgdW87W6REEYrNPQ=;
        b=FPcs0Zg3EVM1Bkmflz5ufy1WlWxLq5UBNJEvqevtUoBe5rEiIxrBasVbJ3UwXTbT9d
         5EdtQlyLL6k+sgVfWpkai5VwClkKC0tzq9yXs7OatQizVFPYDx35cA0Qm/8Ps3WgialJ
         atJoCjj+Bf3HmB83zF+BXwvKbCb82Ex0jVl/eMRQ+DrV08pAPnTlz3eAeSK1BAkKSVAu
         73tw6d7el9ALXZbf4Eq7og8DlOOcTmO429esgxbfr1uedX/ZAMHNbTjp47B6gC+U9prq
         1zE7V2AEjffmVzdOr9PC1Aqi4Dk++mWo2algsMmGk1hs7eRDFUFXv0xVnaNbmzqBBq2j
         q+xg==
X-Gm-Message-State: AOAM532qJ/7w+Ggb6E2w1Ze1cZGoUxNRnyiXOY1RqtQzm8dl+T3mDgQS
        SYIw2qWtZ5MFOUexUzRlF6xWLRChAHl7Dj0=
X-Google-Smtp-Source: ABdhPJxBR0khKPZyYxJByeJqvpt4x63XnyN0wV4q0v0b3QqSDkeUY0FRBouU62dbzDGkXCJHhVdcRQ==
X-Received: by 2002:a17:906:1f82:: with SMTP id t2mr9760755ejr.499.1629294027309;
        Wed, 18 Aug 2021 06:40:27 -0700 (PDT)
Received: from localhost ([2a00:a040:195:275f:ad44:6808:2596:8580])
        by smtp.gmail.com with ESMTPSA id b3sm2059205ejb.7.2021.08.18.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 06:40:26 -0700 (PDT)
Message-Id: <b847895c1f170e2e59df5757a4d603d28149f648.1629291912.git.matan@svgalib.org>
In-Reply-To: <cover.1629291912.git.matan@svgalib.org>
References: <cover.1629291912.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Wed, 18 Aug 2021 12:34:50 +0300
Subject: [PATCH V2 2/3] platform/x86: lg-laptop: Use correct event for
 touchpad toggle FN-key
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Send F21 which is the standard for this key, instead of F13.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 Documentation/admin-guide/laptops/lg-laptop.rst | 2 +-
 drivers/platform/x86/lg-laptop.c                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/laptops/lg-laptop.rst b/Documentation/admin-guide/laptops/lg-laptop.rst
index ce9b14671cb9..13d7ec427e76 100644
--- a/Documentation/admin-guide/laptops/lg-laptop.rst
+++ b/Documentation/admin-guide/laptops/lg-laptop.rst
@@ -13,7 +13,7 @@ Hotkeys
 The following FN keys are ignored by the kernel without this driver:
 
 - FN-F1 (LG control panel)   - Generates F15
-- FN-F5 (Touchpad toggle)    - Generates F13
+- FN-F5 (Touchpad toggle)    - Generates F21
 - FN-F6 (Airplane mode)      - Generates RFKILL
 - FN-F8 (Keyboard backlight) - Generates F16.
   This key also changes keyboard backlight mode.
diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index c78efeee1c19..12b497a11c6f 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -74,7 +74,7 @@ static int battery_limit_use_wmbb;
 
 static const struct key_entry wmi_keymap[] = {
 	{KE_KEY, 0x70, {KEY_F15} },	 /* LG control panel (F1) */
-	{KE_KEY, 0x74, {KEY_F13} },	 /* Touchpad toggle (F5) */
+	{KE_KEY, 0x74, {KEY_F21} },	 /* Touchpad toggle (F5) */
 	{KE_KEY, 0xf020000, {KEY_F14} }, /* Read mode (F9) */
 	{KE_KEY, 0x10000000, {KEY_F16} },/* Keyboard backlight (F8) - pressing
 					  * this key both sends an event and
-- 
Matan.

