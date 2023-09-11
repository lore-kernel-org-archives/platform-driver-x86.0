Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C27CA0EC9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:06:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355655AbjIKWBj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244220AbjIKTjs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 15:39:48 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0232812A
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 12:39:44 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-26f9521de4cso3379788a91.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694461183; x=1695065983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZYrHnobXTh0OSmcxOutmTVdFw75ZwDUd6CgfQDQ3MU=;
        b=jkpQtQkf9CmjnLo2qkfbo+ma1IvYZZrIkQVDU8FeE0rGYwCLnaZ2QYzS8PTcjwpEkk
         1pVi5tfGDk1WtalnGLnTbYe/2N+3rHKrQd4u/ghEXLcE1/AyKTwPwD/R3JOjTOc77lcQ
         YWZPU8SZpMWz3iF+GZsj9IikXLe19fEeZYRiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694461183; x=1695065983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZYrHnobXTh0OSmcxOutmTVdFw75ZwDUd6CgfQDQ3MU=;
        b=RzCFpK5iVJ2+/8pZKTutjH49ulhS0heAXjr5gwlcR2ZUraQ27ZEpQvs0CRS+92pnLw
         aGVj7/kIBPgowUu0T/+5b6kGPjKWqsi6aN9suFEd1V03ox/Ogbh7NI/4atcHvg+gLk85
         +C+C9v4ytrxEx7pbZiHh9AuTZNwvkL2Oy9K/LCaPlCag+Be7ms2AFV0qfHTogF8PbTkP
         F3Cjwm09ByuwkQK9FNZbjrz+T5Du6TNcJnDWgF0boZE8RJgTOYYaoNTjQ+QjDv3fzekc
         GOTZT7fV/ZiZlGrmLnKKU/lHXhXHJ50tGHEyHfgDQfdaJEFta+3RZvmLlSmePQktCm0W
         jO7A==
X-Gm-Message-State: AOJu0YwZUb57SsUL6+mDsEr2iXHdRnuW3IMMYWmeM0FwMDojrdkh67bI
        zsQKEnnE5mrTbMTr0s/uF/PRmw==
X-Google-Smtp-Source: AGHT+IGOfdGvbw1wwt4Gf9ldbs/gHOpAtrlGyNreNjdfdz8lCBCPYU+3AOX6Bw9QrL5rSH9U2KMdvA==
X-Received: by 2002:a17:90a:3481:b0:268:557e:1848 with SMTP id p1-20020a17090a348100b00268557e1848mr8154453pjb.2.1694461183460;
        Mon, 11 Sep 2023 12:39:43 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:d487:5e33:6656:3711])
        by smtp.gmail.com with ESMTPSA id fu8-20020a17090ad18800b00262e485156esm7736543pjb.57.2023.09.11.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 12:39:42 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Prashant Malani <pmalani@chromium.org>
Subject: [PATCH v3 2/4] platform/x86: intel_scu_ipc: Check status upon timeout in ipc_wait_for_interrupt()
Date:   Mon, 11 Sep 2023 12:39:34 -0700
Message-ID: <20230911193937.302552-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230911193937.302552-1-swboyd@chromium.org>
References: <20230911193937.302552-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It's possible for the completion in ipc_wait_for_interrupt() to timeout,
simply because the interrupt was delayed in being processed. A timeout
in itself is not an error. This driver should check the status register
upon a timeout to ensure that scheduling or interrupt processing delays
don't affect the outcome of the IPC return value.

 CPU0                                                   SCU
 ----                                                   ---
 ipc_wait_for_interrupt()
  wait_for_completion_timeout(&scu->cmd_complete)
  [TIMEOUT]                                             status[IPC_STATUS_BUSY]=0

Fix this problem by reading the status bit in all cases, regardless of
the timeout. If the completion times out, we'll assume the problem was
that the IPC_STATUS_BUSY bit was still set, but if the status bit is
cleared in the meantime we know that we hit some scheduling delay and we
should just check the error bit.

Cc: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Fixes: ed12f295bfd5 ("ipc: Added support for IPC interrupt mode")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/x86/intel_scu_ipc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 5a37becc65aa..8be1686e22e9 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -248,10 +248,12 @@ static inline int ipc_wait_for_interrupt(struct intel_scu_ipc_dev *scu)
 {
 	int status;
 
-	if (!wait_for_completion_timeout(&scu->cmd_complete, IPC_TIMEOUT))
-		return -ETIMEDOUT;
+	wait_for_completion_timeout(&scu->cmd_complete, IPC_TIMEOUT);
 
 	status = ipc_read_status(scu);
+	if (status & IPC_STATUS_BUSY)
+		return -ETIMEDOUT;
+
 	if (status & IPC_STATUS_ERR)
 		return -EIO;
 
-- 
https://chromeos.dev

