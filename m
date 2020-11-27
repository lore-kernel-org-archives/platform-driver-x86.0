Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E14C64E7D
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Nov 2020 01:21:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC923221FD
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Nov 2020 01:21:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392119AbgK0BVR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Nov 2020 20:21:17 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8042 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388130AbgK0BVR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Nov 2020 20:21:17 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Chxdw02v6zhYNC;
        Fri, 27 Nov 2020 09:20:52 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Nov 2020 09:21:08 +0800
From:   Luo Meng <luomeng12@huawei.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <dvhart@infradead.org>, <mario.limonciello@dell.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: dell-smbios-base: fix error return code in dell_smbios_init()
Date:   Fri, 27 Nov 2020 09:24:30 +0800
Message-ID: <20201127012430.2539121-1-luomeng12@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix to return a negative error code from the error handling case
instead of 0 in function dell_smbios_init(), as done elsewhere in this
function.

Fixes: 25d47027e100 ("platform/x86: dell-smbios: Link all dell-smbios-* modules together")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Luo Meng <luomeng12@huawei.com>
---
 drivers/platform/x86/dell-smbios-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell-smbios-base.c b/drivers/platform/x86/dell-smbios-base.c
index 2e2cd565926a..3a1dbf199441 100644
--- a/drivers/platform/x86/dell-smbios-base.c
+++ b/drivers/platform/x86/dell-smbios-base.c
@@ -594,6 +594,7 @@ static int __init dell_smbios_init(void)
 	if (wmi && smm) {
 		pr_err("No SMBIOS backends available (wmi: %d, smm: %d)\n",
 			wmi, smm);
+		ret = -ENODEV;
 		goto fail_create_group;
 	}
 
-- 
2.25.4

