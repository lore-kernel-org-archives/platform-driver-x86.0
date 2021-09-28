Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A9EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 10:19:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4959F61131
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 10:19:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240192AbhI1KVg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 06:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240195AbhI1KVf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 06:21:35 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E37C061575
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 03:19:56 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id l6so13831944plh.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 03:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=307zo98Pf9/K51+TuRR4FuJM+VSLAW6UcJ7YHyiqNoA=;
        b=RFbbOFTawsd9lgpA9ERboTArp1HQt2P2jVb4if0BsJKv8rX9kW94LbBeLEHMmR8Nyx
         CQvZ9hWzzBk3rV5b71H1TOy8NcyETyzg27iqDMwUD7+AVZfecavtk8vnRcZh083UJw8L
         fWFrADLlAvn4dk5dh3UxIJQJpVWcWLgo9kgnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=307zo98Pf9/K51+TuRR4FuJM+VSLAW6UcJ7YHyiqNoA=;
        b=gLPGqaJAkMDlh+qV8ksSmD6qDgatX1FFiYKNn0VZF0TATBeb5uMi0LtFFKcDM2y2qN
         3HxJ2f0tlQ38A810a5l2x3ZIEGl1mAgCDFlTBYEFRnjZEaFYDuU/AzJK20j3KCbYgCnP
         bnszV72o/ebQWqCBg/3QI2H4oTUdUGX9KzW5N1W09FUbjPcHzoX/9xdcLcv/KFcFyxgA
         WYaZ1QKz/bHR7XToaYftt7jqsUdwO//6xhAuxfrCJvjNPi77n6LbWYuctq9lSILpv/E3
         1/DlpN26aWfLhOE5UQYetojDZFh1IGUe94QLiwG+vMN8jISeCIlz3JNNuKlqKEeF1en4
         TQHg==
X-Gm-Message-State: AOAM533DAPjbDMEx5q2mUuPESgbzYlen7BMueEPkGr4Cxy20uKIN5LIy
        kz+Y52JT8OllaMc35lATgmNBlQ==
X-Google-Smtp-Source: ABdhPJyoxPlfbOYXh3NzbhLLJ498qVz0nfRmNl86nClaS8S5opBmfskVD8/FZDvTt+1XtRFiplaeVg==
X-Received: by 2002:a17:902:8494:b0:13b:9365:6f12 with SMTP id c20-20020a170902849400b0013b93656f12mr4409023plo.19.1632824396338;
        Tue, 28 Sep 2021 03:19:56 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:f6d8:1ad1:cc75:70fb])
        by smtp.gmail.com with ESMTPSA id z9sm19734576pfr.124.2021.09.28.03.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 03:19:56 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 1/3] platform/x86: intel_scu_ipc: Fix busy loop expiry time
Date:   Tue, 28 Sep 2021 03:19:30 -0700
Message-Id: <20210928101932.2543937-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210928101932.2543937-1-pmalani@chromium.org>
References: <20210928101932.2543937-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The macro IPC_TIMEOUT is already in jiffies (it is also used like that
elsewhere in the file when calling wait_for_completion_timeout()). Don’t
convert it using helper functions for the purposes of calculating the
busy loop expiry time.

Fixes: e7b7ab3847c9 (“platform/x86: intel_scu_ipc: Sleeping is fine when polling”)
Signed-off-by: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
---
 drivers/platform/x86/intel_scu_ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index bfa0cc20750d..cfb249da2a7b 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -232,7 +232,7 @@ static inline u32 ipc_data_readl(struct intel_scu_ipc_dev *scu, u32 offset)
 /* Wait till scu status is busy */
 static inline int busy_loop(struct intel_scu_ipc_dev *scu)
 {
-	unsigned long end = jiffies + msecs_to_jiffies(IPC_TIMEOUT);
+	unsigned long end = jiffies + IPC_TIMEOUT;
 
 	do {
 		u32 status;
-- 
2.33.0.685.g46640cef36-goog

