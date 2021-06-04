Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F368C4743C
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 21:10:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 376BB613EA
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 21:10:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhFDVMb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Jun 2021 17:12:31 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:55893 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231538AbhFDVMa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Jun 2021 17:12:30 -0400
Received: by mail-wm1-f41.google.com with SMTP id g204so6092730wmf.5;
        Fri, 04 Jun 2021 14:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0AKFf5l+McLomgCfsF7Q+cMO3Lh52G1WFJZ0xMnObWE=;
        b=pMrEEt1Cgo8uEWXnwBWDqgTctBJloWFySXH6FDUy01eroy/lLHkhXv6vIjZAciJQwE
         V0nunEXJXY/ZgD7Jw+8Ty+5HH8LZnmxAQdqQvSMcNzn7BWAJKvq1VvBEeRSkF6Jzu24K
         CTEjv/fCCdCQRkSL15PsekxaMCWTo83QoqiSXCpf7LfaKIoPA4tGnqRHczb2FzH6DHM9
         mHqZVWnNWyVKqwrsY1spn9xxM/9byM7O446z6u5i+TJnKPIIlFwtvwtxxVwc6VAKeS2R
         obeyL8SF5D0wK+LbaSb2z70JloyI70ojrrxXLygfmKqbGFRPnMJAZOL5nV4fFEsFJnaR
         UqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0AKFf5l+McLomgCfsF7Q+cMO3Lh52G1WFJZ0xMnObWE=;
        b=fgRRssWUkoC2ox0/h1HAgYIxOUwPTx9jpfCb5EJPrywK19yJrJjQD6D+C0Aodcpu/3
         l30QIQuXi5ds1suHbj4sqBsvFSfb0OjfP2Kny82ilWowezGNCzqGd6QUcL4pOaHSFb8k
         hJun1hEHMCdFZdPMz92XaDvHwJbrmWPiaTVW7BUWkleVfVUvMgUQorlZ0mXvaWFXGoBg
         k0i83O8RKOQX1QkQ/u5GCNd7xvKTfMJO3O3GnMiR9wEK/gVy8q9kPZmNDmwMIFBGfD50
         wKOZlgNFMy3En+ZfH0l/2kb5RXOXOz+BremClfd8Mk2D1uUOWNT6kivsq0FMqndgelCB
         fTGg==
X-Gm-Message-State: AOAM533iAzLPvUwxQvWJWkszpyE9427ou+v6xTgtiIdScl5sTx3ym8qd
        ddnT6UpDMSMWG32mgg01m34=
X-Google-Smtp-Source: ABdhPJyjeFsYffroEl2X5KiHP+lUkEVV7B/nJR6CUk8BdvQ1TLAb1szh1YMueb0F7J26wkyjXD7sTA==
X-Received: by 2002:a1c:193:: with SMTP id 141mr5386613wmb.106.1622840969631;
        Fri, 04 Jun 2021 14:09:29 -0700 (PDT)
Received: from xws.localdomain (pd9e5aba0.dip0.t-ipconnect.de. [217.229.171.160])
        by smtp.gmail.com with ESMTPSA id l5sm9478853wmi.46.2021.06.04.14.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:09:29 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] platform/surface: aggregator: Do not return uninitialized value
Date:   Fri,  4 Jun 2021 23:09:06 +0200
Message-Id: <20210604210907.25738-2-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604210907.25738-1-luzmaximilian@gmail.com>
References: <20210604210907.25738-1-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The status variable in ssam_nf_refcount_disable_free() is only set when
the reference count equals zero. Otherwise, it is returned
uninitialized. Fix this by always initializing status to zero.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 640ee17199e4 ("platform/surface: aggregator: Allow enabling of events without notifiers")
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/platform/surface/aggregator/controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
index 6646f4d6e10d..634399387d76 100644
--- a/drivers/platform/surface/aggregator/controller.c
+++ b/drivers/platform/surface/aggregator/controller.c
@@ -2228,7 +2228,7 @@ static int ssam_nf_refcount_disable_free(struct ssam_controller *ctrl,
 	const struct ssam_event_registry reg = entry->key.reg;
 	const struct ssam_event_id id = entry->key.id;
 	struct ssam_nf *nf = &ctrl->cplt.event.notif;
-	int status;
+	int status = 0;
 
 	lockdep_assert_held(&nf->lock);
 
-- 
2.31.1

