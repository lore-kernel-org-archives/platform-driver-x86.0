Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DC1C07E94
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 08:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04C10601FE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 08:05:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhFDIGr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Jun 2021 04:06:47 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:4471 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhFDIGr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Jun 2021 04:06:47 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FxFbn6byQzZcD1;
        Fri,  4 Jun 2021 16:02:13 +0800 (CST)
Received: from dggema766-chm.china.huawei.com (10.1.198.208) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 16:04:59 +0800
Received: from localhost.localdomain (10.175.127.227) by
 dggema766-chm.china.huawei.com (10.1.198.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 4 Jun 2021 16:04:59 +0800
From:   yangerkun <yangerkun@huawei.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>, <yangerkun@huawei.com>,
        <yukuai3@huawei.com>
Subject: [PATCH] platform/x86: intel_ips: remove unused val in read_mgtv
Date:   Fri, 4 Jun 2021 16:14:14 +0800
Message-ID: <20210604081414.3701730-1-yangerkun@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema766-chm.china.huawei.com (10.1.198.208)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

drivers/platform/x86/intel_ips.c:832:6: warning: variable ‘ret’ set but
not used [-Wunused-but-set-variable]
  832 |  u16 ret;
      |      ^~~

Fix it by remove the define.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: yangerkun <yangerkun@huawei.com>
---
 drivers/platform/x86/intel_ips.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index bffe548187ee..d40a00ba859a 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -829,19 +829,8 @@ static u16 calc_avg_temp(struct ips_driver *ips, u16 *array)
 
 static u16 read_mgtv(struct ips_driver *ips)
 {
-	u16 ret;
-	u64 slope, offset;
-	u64 val;
-
-	val = thm_readq(THM_MGTV);
-	val = (val & TV_MASK) >> TV_SHIFT;
-
-	slope = offset = thm_readw(THM_MGTA);
-	slope = (slope & MGTA_SLOPE_MASK) >> MGTA_SLOPE_SHIFT;
-	offset = offset & MGTA_OFFSET_MASK;
-
-	ret = ((val * slope + 0x40) >> 7) + offset;
-
+	thm_readq(THM_MGTV);
+	thm_readw(THM_MGTA);
 	return 0; /* MCH temp reporting buggy */
 }
 
-- 
2.31.1

