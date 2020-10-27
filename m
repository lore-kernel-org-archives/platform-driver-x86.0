Return-Path: <SRS0=wg3L=EC=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C11C388F9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Oct 2020 13:42:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04A3E20732
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Oct 2020 13:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752452AbgJ0Nm0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Oct 2020 09:42:26 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5636 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752451AbgJ0NmZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Oct 2020 09:42:25 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CLCYp1gJyzLn0s;
        Tue, 27 Oct 2020 21:42:22 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 27 Oct 2020
 21:42:16 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>
Subject: [PATCH -next] platform/x86: wmi: discard unnecessary breaks
Date:   Tue, 27 Oct 2020 21:53:02 +0800
Message-ID: <20201027135302.72354-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The 'break' is unnecessary because of previous 'return',
and we could discard it.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/platform/x86/wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index d88f388a3450..cbf38abd40be 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1260,13 +1260,13 @@ acpi_wmi_ec_space_handler(u32 function, acpi_physical_address address,
 	switch (result) {
 	case -EINVAL:
 		return AE_BAD_PARAMETER;
-		break;
+
 	case -ENODEV:
 		return AE_NOT_FOUND;
-		break;
+
 	case -ETIME:
 		return AE_TIME;
-		break;
+
 	default:
 		return AE_OK;
 	}
-- 
2.17.1

