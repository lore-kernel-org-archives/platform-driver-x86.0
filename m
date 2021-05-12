Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B58C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 May 2021 08:57:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA3D2613EE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 May 2021 08:57:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhELI6R (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 May 2021 04:58:17 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:36007 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230114AbhELI6R (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 May 2021 04:58:17 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UYdpUu2_1620809826;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UYdpUu2_1620809826)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 12 May 2021 16:57:08 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     hdegoede@redhat.com
Cc:     stuart.w.hayes@gmail.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH v2] platform/x86: drop unneeded assignment in host_control_smi()
Date:   Wed, 12 May 2021 16:57:05 +0800
Message-Id: <1620809825-84105-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Making '==' operation with ESM_STATUS_CMD_UNSUCCESSFUL directly
after calling the function inb() is more efficient, so assignment
to 'cmd_status' is redundant.

Eliminate the following clang_analyzer warning:
drivers/platform/x86/dell/dcdbas.c:397:11: warning: Although the value
stored to 'cmd_status' is used in the enclosing expression, the value
is never actually read from 'cmd_status'

No functional change.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---

Change in v2
--According to Hans's suggestion, store the inb() value into the s8.
https://lore.kernel.org/patchwork/patch/1419026/

 drivers/platform/x86/dell/dcdbas.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index d513a59..28447c1 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -394,8 +394,7 @@ static int host_control_smi(void)
 
 		/* wait a few to see if it executed */
 		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
-		while ((cmd_status = inb(PCAT_APM_STATUS_PORT))
-		       == ESM_STATUS_CMD_UNSUCCESSFUL) {
+		while ((s8)inb(PCAT_APM_STATUS_PORT) == ESM_STATUS_CMD_UNSUCCESSFUL) {
 			num_ticks--;
 			if (num_ticks == EXPIRED_TIMER)
 				return -ETIME;
-- 
1.8.3.1

