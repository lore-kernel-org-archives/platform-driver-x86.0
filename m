Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4317FC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Feb 2021 07:01:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E272464EC3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Feb 2021 07:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhBVHBY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Feb 2021 02:01:24 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:34265 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229780AbhBVHBX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Feb 2021 02:01:23 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R881e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UP9s3Nh_1613977240;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UP9s3Nh_1613977240)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 22 Feb 2021 15:00:40 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     ike.pan@canonical.com
Cc:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] platform/x86: Switch to using the new API kobj_to_dev()
Date:   Mon, 22 Feb 2021 15:00:38 +0800
Message-Id: <1613977238-104556-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

fixed the following coccicheck:
./drivers/platform/x86/ideapad-laptop.c:523:60-61: WARNING opportunity
for kobj_to_dev()

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/platform/x86/ideapad-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 5b81baf..d6ca4f0 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -520,7 +520,7 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
 				 struct attribute *attr,
 				 int idx)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct ideapad_private *priv = dev_get_drvdata(dev);
 	bool supported;
 
-- 
1.8.3.1

