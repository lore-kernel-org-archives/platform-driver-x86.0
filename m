Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4537EC83F16
	for <platform-driver-x86@archiver.kernel.org>; Thu, 31 Aug 2023 01:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345506AbjHaBOS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Aug 2023 21:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345503AbjHaBOR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Aug 2023 21:14:17 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABB1CE9
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Aug 2023 18:14:10 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bf3a2f4528so1988635ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Aug 2023 18:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693444450; x=1694049250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Evb7/BN7ItVli8O1MCLcSe5YscQaq6FblNFUqza6B98=;
        b=XRUgTPyN2NE22JnmgQAaVgbzPgd0oJ2+K5S26+wWwAlMgA9PNGZFbGFy1ucyV36ENm
         1dVCwOgf7TutnTKhf2XFcADN3lCVWcLA4DC3ZovtJqFq+DENxAq+q5aHoFCz+UQpECw9
         rlUVgS3/9X2p04C8YAZKp3+lMZzatbRyxx7aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693444450; x=1694049250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Evb7/BN7ItVli8O1MCLcSe5YscQaq6FblNFUqza6B98=;
        b=TQtjvBreY8K2u0ci8xS+gjwso53RDQQfpKxS0kOUd8traPctt3dSuEVNqNQss/ZBgE
         l0nJs2waQhG8O6wJ5xbtiYnexMDP4AoVQ20Cg74mwh7xNIe8BziQxZyoXrpHWLTIAFVT
         KY3bPQpoWxtDcTeiwxqWGGZJm1DNIT2Fo9kG2H03JFaFGoKs4X1lsdytq0xUjxjEN8Ax
         J45RRM7QCcZ0VeBpGo9wBtZBqXVhN08upIXh2+puHSfXdJztQoy2zsDvsl5wAAtb7BPu
         KhaUqv9lAvLkMt6AmoEvE9M8nDiI43LYduPnBaNxme4fL5Uj44VX/tco1S7gTtLPqd+K
         vmbQ==
X-Gm-Message-State: AOJu0YxoKxVZ14jy5mxIs/kSAwcz/zmwedOuZu8xHVGUUXoiTepKks3i
        trbXlcSYH0CC6JB314cLHVXVxw==
X-Google-Smtp-Source: AGHT+IFYusCNVLK7C29ZkzYj1eGJCKZt8+lyPCyvbxdXZnw6xYC4O8RV0ZX9Jg5wTDXLG27eEM/K/Q==
X-Received: by 2002:a17:902:db0c:b0:1b9:e81f:fb08 with SMTP id m12-20020a170902db0c00b001b9e81ffb08mr4163642plx.55.1693444449861;
        Wed, 30 Aug 2023 18:14:09 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:248f:d364:b451:2bc0])
        by smtp.gmail.com with ESMTPSA id im23-20020a170902bb1700b001bbb7af4963sm132604plb.68.2023.08.30.18.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 18:14:09 -0700 (PDT)
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
Subject: [PATCH 2/3] platform/x86: intel_scu_ipc: Check status upon timeout in ipc_wait_for_interrupt()
Date:   Wed, 30 Aug 2023 18:14:02 -0700
Message-ID: <20230831011405.3246849-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
In-Reply-To: <20230831011405.3246849-1-swboyd@chromium.org>
References: <20230831011405.3246849-1-swboyd@chromium.org>
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
  [TIMEOUT]                                             status[IPC_BUSY]=0

Fix this problem by reading the status bit in all cases, regardless of
the timeout. If the completion times out, we'll assume the problem was
that the IPC_BUSY bit was still set, but if the status bit is cleared in
the meantime we know that we hit some scheduling delay and we should
just check the error bit.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Fixes: ed12f295bfd5 ("ipc: Added support for IPC interrupt mode")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/x86/intel_scu_ipc.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 5a37becc65aa..2a21153e3bf3 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -246,16 +246,19 @@ static inline int busy_loop(struct intel_scu_ipc_dev *scu)
 /* Wait till ipc ioc interrupt is received or timeout in 10 HZ */
 static inline int ipc_wait_for_interrupt(struct intel_scu_ipc_dev *scu)
 {
-	int status;
+	unsigned long time_left;
+	u8 status;
+	int err = 0;
 
-	if (!wait_for_completion_timeout(&scu->cmd_complete, IPC_TIMEOUT))
-		return -ETIMEDOUT;
+	time_left = wait_for_completion_timeout(&scu->cmd_complete, IPC_TIMEOUT);
+	if (!time_left)
+		err = -ETIMEDOUT;
 
 	status = ipc_read_status(scu);
-	if (status & IPC_STATUS_ERR)
-		return -EIO;
+	if (!(status & IPC_STATUS_BUSY))
+		err = (status & IPC_STATUS_ERR) ? -EIO : 0;
 
-	return 0;
+	return err;
 }
 
 static int intel_scu_ipc_check_status(struct intel_scu_ipc_dev *scu)
-- 
https://chromeos.dev

