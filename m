Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D36EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Aug 2023 08:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjHIIPZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Aug 2023 04:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbjHIIPY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Aug 2023 04:15:24 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B8A10F6
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Aug 2023 01:15:23 -0700 (PDT)
Received: from dggpemm500011.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RLNB94VFKzmXYG;
        Wed,  9 Aug 2023 16:14:09 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500011.china.huawei.com (7.185.36.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 16:15:21 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 16:15:20 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <henning.schild@siemens.com>, <yangyingliang@huawei.com>
Subject: [PATCH -next] platform/x86/siemens: simatic-ipc-batt: fix wrong pointer pass to PTR_ERR()
Date:   Wed, 9 Aug 2023 16:12:27 +0800
Message-ID: <20230809081227.1221267-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix wrong pointer pass to PTR_ERR() if devm_gpiod_get_index() fails.

Fixes: 917f54340794 ("platform/x86: simatic-ipc: add CMOS battery monitoring")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/platform/x86/siemens/simatic-ipc-batt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt.c b/drivers/platform/x86/siemens/simatic-ipc-batt.c
index d66b9969234b..15c08c4900b8 100644
--- a/drivers/platform/x86/siemens/simatic-ipc-batt.c
+++ b/drivers/platform/x86/siemens/simatic-ipc-batt.c
@@ -198,7 +198,7 @@ int simatic_ipc_batt_probe(struct platform_device *pdev, struct gpiod_lookup_tab
 			flags = GPIOD_OUT_LOW;
 		priv.gpios[2] = devm_gpiod_get_index(dev, "CMOSBattery meter", 2, flags);
 		if (IS_ERR(priv.gpios[2])) {
-			err = PTR_ERR(priv.gpios[1]);
+			err = PTR_ERR(priv.gpios[2]);
 			priv.gpios[2] = NULL;
 			goto out;
 		}
-- 
2.25.1

