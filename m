Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33289C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 08:59:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3DF66124B
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 08:59:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349778AbhDGI7i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 04:59:38 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:16007 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244174AbhDGI7h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 04:59:37 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFdYN3mgTzPnrx;
        Wed,  7 Apr 2021 16:56:40 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 16:59:18 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <vadimp@nvidia.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH] platform/mellanox: mlxreg-hotplug: move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Wed, 7 Apr 2021 16:59:43 +0800
Message-ID: <1617785983-28878-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable because of requesting.

this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
is being merged: https://lore.kernel.org/patchwork/patch/1388765/

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index b013445..a9db2f3 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -683,13 +683,13 @@ static int mlxreg_hotplug_probe(struct platform_device *pdev)
 
 	err = devm_request_irq(&pdev->dev, priv->irq,
 			       mlxreg_hotplug_irq_handler, IRQF_TRIGGER_FALLING
-			       | IRQF_SHARED, "mlxreg-hotplug", priv);
+			       | IRQF_SHARED | IRQF_NO_AUTOEN,
+			       "mlxreg-hotplug", priv);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", err);
 		return err;
 	}
 
-	disable_irq(priv->irq);
 	spin_lock_init(&priv->lock);
 	INIT_DELAYED_WORK(&priv->dwork_irq, mlxreg_hotplug_work_handler);
 	dev_set_drvdata(&pdev->dev, priv);
-- 
2.7.4

