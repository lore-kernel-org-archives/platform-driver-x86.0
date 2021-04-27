Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B397AC433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Apr 2021 11:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72DEC613D8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Apr 2021 11:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235705AbhD0Lcq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Apr 2021 07:32:46 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:42230 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230270AbhD0Lcq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Apr 2021 07:32:46 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R291e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UX-4E.k_1619523121;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UX-4E.k_1619523121)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 27 Apr 2021 19:32:02 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     stuart.w.hayes@gmail.com
Cc:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] platform/x86: drop unneeded assignment in host_control_smi()
Date:   Tue, 27 Apr 2021 19:31:59 +0800
Message-Id: <1619523119-112342-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Making '==' operation with ESM_STATUS_CMD_UNSUCCESSFUL directly
after calling the function inb() is more efficient, so assignment
to 'cmd_status' is redundant.

Eliminate the following clang_analyzer warning:
drivers/platform/x86/dell/dcdbas.c:397:11: warning: Although the value
stored to 'cmd_status' is used in the enclosing expression, the value is
never actually read from 'cmd_status'

No functional change.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/platform/x86/dell/dcdbas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index d513a59..a9e8a88 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -394,7 +394,7 @@ static int host_control_smi(void)
 
 		/* wait a few to see if it executed */
 		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
-		while ((cmd_status = inb(PCAT_APM_STATUS_PORT))
+		while (inb(PCAT_APM_STATUS_PORT)
 		       == ESM_STATUS_CMD_UNSUCCESSFUL) {
 			num_ticks--;
 			if (num_ticks == EXPIRED_TIMER)
-- 
1.8.3.1

