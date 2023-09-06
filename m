Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179AEEE14B9
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Sep 2023 18:09:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243723AbjIFSJ5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Sep 2023 14:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243725AbjIFSJx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2023 14:09:53 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94909CF3
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Sep 2023 11:09:49 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c1ff5b741cso742765ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Sep 2023 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694023789; x=1694628589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I+Tnbz1nPfP3u0q6UcUVaPekp7QP+Ha1f/com8FTBk=;
        b=KU6slOIMNYgrSH9j0tddSytckjy/8kTargkaEaPHL5/sh/+ZDGgarv/M5UMGuMBIBm
         NQHzjHUg/q+VezaF/PaGPB6rl+lW5tPVvDeb7yNWWbtL0aAiiLJmbdv9YhyDQSd5hJsA
         TsqKlNbYZ9LbsS5OkYS9kFp+lfVC5uMAUqk/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694023789; x=1694628589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6I+Tnbz1nPfP3u0q6UcUVaPekp7QP+Ha1f/com8FTBk=;
        b=WkmjIdEkyt8HUz7P3fWBfZfpYXhN565pJ1EAo/sI6Gb5Q7XKTuQmggqVtUJAHxtakl
         +vM266b4OESvGyL4Sb7xmjJ55Dt6gjlqFPtEv9Ky9nNecqfZTGLtw3vmCEJyJOHrgyS+
         6G9WxdxhrBNqVR+m8uSNFFUgA4SW7pyPVjM+zTWZz+r+WkKtcU4+W6QnpPkKtr/pfVSm
         kVV+HwIZlbdbIktbNEjfyq8osk1/e7VQvGjnmd0lr66JtjXrdkwV3GWoX1cYZiDqH1Wt
         Qji4q48SagbuYVU8kks5DARk3ZNlkDklMtnF9gU+XdQ//ummvZQZpFcDwK7UMq2v0TbK
         qE5g==
X-Gm-Message-State: AOJu0YyJ8+3+ABWY7If06BiHRJNIHlv+NKPiFcD+9tOq4J80DZuAhmbz
        0Wse1dR8I3UVgpRj7G2nP2tsVw==
X-Google-Smtp-Source: AGHT+IF5QfGMo/sdxsUVNrZNDBPSiLKBWoNHf8pn6Nyc2pLXvbO3iCoWpR8ZwyEMaWKmKkYHkX0yew==
X-Received: by 2002:a17:902:d504:b0:1c0:ec66:f2b5 with SMTP id b4-20020a170902d50400b001c0ec66f2b5mr20873803plg.57.1694023789107;
        Wed, 06 Sep 2023 11:09:49 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:a404:ed4a:5a1e:3b4a])
        by smtp.gmail.com with ESMTPSA id ix5-20020a170902f80500b001bc675068e2sm11363996plb.111.2023.09.06.11.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 11:09:48 -0700 (PDT)
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
Subject: [PATCH v2 2/3] platform/x86: intel_scu_ipc: Check status upon timeout in ipc_wait_for_interrupt()
Date:   Wed,  6 Sep 2023 11:09:42 -0700
Message-ID: <20230906180944.2197111-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230906180944.2197111-1-swboyd@chromium.org>
References: <20230906180944.2197111-1-swboyd@chromium.org>
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
Fixes: ed12f295bfd5 ("ipc: Added support for IPC interrupt mode")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/x86/intel_scu_ipc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index b2a2de22b8ff..3cea701d2bbd 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -254,10 +254,12 @@ static inline int ipc_wait_for_interrupt(struct intel_scu_ipc_dev *scu)
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

