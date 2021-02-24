Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82176C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Feb 2021 08:18:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38CA764EEA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Feb 2021 08:18:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbhBXIRn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Feb 2021 03:17:43 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:59732 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234135AbhBXIRI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Feb 2021 03:17:08 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0UPR1-gV_1614154583;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UPR1-gV_1614154583)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 24 Feb 2021 16:16:23 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     tglx@linutronix.de
Cc:     mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dvhart@infradead.org, andy@infradead.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] x86: platform: iosf_mbi: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Date:   Wed, 24 Feb 2021 16:16:21 +0800
Message-Id: <1614154581-33967-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix the following coccicheck warning:
./arch/x86/platform/intel/iosf_mbi.c:482:0-23: WARNING: iosf_mcr_fops
should be defined with DEFINE_DEBUGFS_ATTRIBUTE

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/x86/platform/intel/iosf_mbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/intel/iosf_mbi.c b/arch/x86/platform/intel/iosf_mbi.c
index 526f70f..ba70597 100644
--- a/arch/x86/platform/intel/iosf_mbi.c
+++ b/arch/x86/platform/intel/iosf_mbi.c
@@ -479,7 +479,7 @@ static int mcr_set(void *data, u64 val)
 
 	return err;
 }
-DEFINE_SIMPLE_ATTRIBUTE(iosf_mcr_fops, mcr_get, mcr_set , "%llx\n");
+DEFINE_DEBUGFS_ATTRIBUTE(iosf_mcr_fops, mcr_get, mcr_set, "%llx\n");
 
 static struct dentry *iosf_dbg;
 
-- 
1.8.3.1

