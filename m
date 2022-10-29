Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0FEC38A02
	for <platform-driver-x86@archiver.kernel.org>; Sat, 29 Oct 2022 06:29:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiJ2G3A (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 29 Oct 2022 02:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiJ2G27 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Oct 2022 02:28:59 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4020B1CCCD3
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Oct 2022 23:28:58 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MzqHY180LzHvGB;
        Sat, 29 Oct 2022 14:28:41 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 29 Oct 2022 14:28:56 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 29 Oct
 2022 14:28:56 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <platform-driver-x86@vger.kernel.org>,
        <acpi4asus-user@lists.sourceforge.net>
CC:     <hdegoede@redhat.com>, <corentin.chary@gmail.com>,
        <yangyingliang@huawei.com>
Subject: [PATCH] platform/x86: asus-tf103c-dock: fix possible memory leak in tf103c_dock_probe()
Date:   Sat, 29 Oct 2022 14:27:59 +0800
Message-ID: <20221029062759.2581143-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

If hid_add_device() returns error, it should call hid_destroy_device()
to free the hid which is allocated in hid_allocate_device().

Fixes: 0a6509b0926d ("platform/x86: Add Asus TF103C dock driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/platform/x86/asus-tf103c-dock.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/x86/asus-tf103c-dock.c
index 62310e06282b..f81d58dfd322 100644
--- a/drivers/platform/x86/asus-tf103c-dock.c
+++ b/drivers/platform/x86/asus-tf103c-dock.c
@@ -850,8 +850,10 @@ static int tf103c_dock_probe(struct i2c_client *client)
 	strscpy(dock->hid->phys, dev_name(dev), sizeof(dock->hid->phys));
 
 	ret = hid_add_device(dock->hid);
-	if (ret)
+	if (ret) {
+		hid_destroy_device(dock->hid);
 		return dev_err_probe(dev, ret, "adding hid dev\n");
+	}
 
 	/* 5. Setup irqchip for touchpad IRQ pass-through */
 	dock->tp_irqchip.name = KBUILD_MODNAME;
-- 
2.25.1

