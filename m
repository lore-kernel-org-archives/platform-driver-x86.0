Return-Path: <SRS0=ZA8Y=EN=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB2BC388F7
	for <platform-driver-x86@archiver.kernel.org>; Sat,  7 Nov 2020 12:53:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4CB020888
	for <platform-driver-x86@archiver.kernel.org>; Sat,  7 Nov 2020 12:53:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AisJfiIi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbgKGMxv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 7 Nov 2020 07:53:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbgKGMxu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Nov 2020 07:53:50 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C0AC0613CF
        for <platform-driver-x86@vger.kernel.org>; Sat,  7 Nov 2020 04:53:49 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id t22so2255367plr.9
        for <platform-driver-x86@vger.kernel.org>; Sat, 07 Nov 2020 04:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UtQPgPw1ucRq1o3HopG8jlE0EpEg3MK+UCBeDr/w/1A=;
        b=AisJfiIio2+r6p3hEAYymEEbzZogkmip7u/hlQ0PtxcDJ7jFyWS0/3TITPI4D/YWcN
         JJ4RU5LBj76x1/MDDnkjuUkC2BzprY6jPWwoArY29qrs1UYO9TQVX3uQlgmlwfB9MzGq
         0OziCE4fLb43l2wpY3KrpN0r2Csc3h2u7N5yZobas8iPyT71D8QDRIdD9sout90bqzXo
         NX77VOEDerLeXxpDXD8hZm8YljQE9vKZ6KXJONYZPV1eCLafWShGU/61UCmbNt6Endj7
         aM2EXOzZJl9twvGKAfFKUWmbBlXqbXAScMeAFOfW/heTmc2em+3f7P7WzZoiNw4dfwmF
         dJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UtQPgPw1ucRq1o3HopG8jlE0EpEg3MK+UCBeDr/w/1A=;
        b=IoyRRa6F+1b9UUZbTGW/qHRW6siEiPAg4GWnRjXDD0lbAJuNp5WBwJ8dGN74+SUOFn
         Pa2PE/8ymUF/nlwLNkxgTj/lgInIrzlimLpx+BiPNfIubGPrpo0grx00NQ1156k8H8gP
         zrqXNBt8/XnAiE0E7yqt3wkB3q/J+aYLP3jrwhNnsfPKYgl4MdMDf9/9/NzldA8sKnjN
         EeXM7+UwfFWy7L66iKubz9ppk+wDuGB4eEeHm+3gr0d1HFn4FE2rDrrBVIAsqa/5AREn
         vmv/Qt4RgzPqkJ6e4PC4kf6UNzCi7yFqsnSIa8JGu5dZzKfegy2ojR1D6tNHiaauSM5a
         rTlw==
X-Gm-Message-State: AOAM533Wssrj+clsOv3e+nRcDVrQ8STJL93BRoPXDRIQEAkV4tdyFQIt
        +2VjY7GdLZwc8jZKOm+Jgg==
X-Google-Smtp-Source: ABdhPJyywW6Pq5+Ia2RxerJfH9Uj57CBqsTvxGWwNzXVylTRgbCpI1yJLucvx42GJNr3qi+cvKFNgg==
X-Received: by 2002:a17:90a:cf8d:: with SMTP id i13mr352149pju.64.1604753628590;
        Sat, 07 Nov 2020 04:53:48 -0800 (PST)
Received: from he-cluster.localdomain (67.216.221.250.16clouds.com. [67.216.221.250])
        by smtp.gmail.com with ESMTPSA id r6sm1856319pjo.0.2020.11.07.04.53.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Nov 2020 04:53:47 -0800 (PST)
From:   xiakaixu1987@gmail.com
X-Google-Original-From: kaixuxia@tencent.com
To:     irenic.rajneesh@gmail.com, david.e.box@intel.com
Cc:     platform-driver-x86@vger.kernel.org,
        Kaixu Xia <kaixuxia@tencent.com>
Subject: [PATCH] platform/x86: intel_pmc_core: Assign boolean values to a bool variable
Date:   Sat,  7 Nov 2020 20:53:41 +0800
Message-Id: <1604753621-7387-1-git-send-email-kaixuxia@tencent.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Kaixu Xia <kaixuxia@tencent.com>

Fix the following coccinelle warnings:

./drivers/platform/x86/intel_pmc_core.c:932:1-16: WARNING: Assignment of 0/1 to bool variable

Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>
---
 drivers/platform/x86/intel_pmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 3e5fe66333f1..ee2f757515b0 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -929,7 +929,7 @@ static void pmc_core_slps0_dbg_latch(struct pmc_dev *pmcdev, bool reset)
 		fd |= CNP_PMC_LATCH_SLPS0_EVENTS;
 	pmc_core_reg_write(pmcdev, map->slps0_dbg_offset, fd);
 
-	slps0_dbg_latch = 0;
+	slps0_dbg_latch = false;
 
 out_unlock:
 	mutex_unlock(&pmcdev->lock);
-- 
2.20.0

