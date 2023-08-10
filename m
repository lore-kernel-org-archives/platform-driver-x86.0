Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF3FC001B0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Aug 2023 12:21:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234008AbjHJMVA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Aug 2023 08:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233757AbjHJMU5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Aug 2023 08:20:57 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29E72715
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Aug 2023 05:20:46 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RM5Yx27nbzTmg7;
        Thu, 10 Aug 2023 20:18:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 20:20:41 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <ibm-acpi-devel@lists.sourceforge.net>,
        <platform-driver-x86@vger.kernel.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] platform/x86: thinkpad_acpi: Switch to memdup_user_nul() helper
Date:   Thu, 10 Aug 2023 20:20:12 +0800
Message-ID: <20230810122012.2110410-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use memdup_user_nul() helper instead of open-coding to simplify the code.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 85772bad753e..d70c89d32534 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -908,16 +908,9 @@ static ssize_t dispatch_proc_write(struct file *file,
 	if (count > PAGE_SIZE - 1)
 		return -EINVAL;
 
-	kernbuf = kmalloc(count + 1, GFP_KERNEL);
-	if (!kernbuf)
-		return -ENOMEM;
-
-	if (copy_from_user(kernbuf, userbuf, count)) {
-		kfree(kernbuf);
-		return -EFAULT;
-	}
-
-	kernbuf[count] = 0;
+	kernbuf = memdup_user_nul(userbuf, count);
+	if (IS_ERR(kernbuf))
+		return PTR_ERR(kernbuf);
 	ret = ibm->write(kernbuf);
 	if (ret == 0)
 		ret = count;
-- 
2.34.1

