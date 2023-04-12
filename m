Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C38AC7619A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Apr 2023 09:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbjDLJh5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Apr 2023 05:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbjDLJh4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 05:37:56 -0400
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE25DE54;
        Wed, 12 Apr 2023 02:37:53 -0700 (PDT)
X-UUID: 8f618c07a3db4e7381a238e25a2f3b81-20230412
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:0cf88c68-3d6f-4ca1-a867-0f315b522e27,IP:5,U
        RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
        ON:release,TS:-15
X-CID-INFO: VERSION:1.1.22,REQID:0cf88c68-3d6f-4ca1-a867-0f315b522e27,IP:5,URL
        :0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
        :release,TS:-15
X-CID-META: VersionHash:120426c,CLOUDID:fa35b7ea-db6f-41fe-8b83-13fe7ed1ef52,B
        ulkID:230412173748TSPKR3OS,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|102,
        TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
        ,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 8f618c07a3db4e7381a238e25a2f3b81-20230412
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
        (envelope-from <jiangfeng@kylinos.cn>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1331154947; Wed, 12 Apr 2023 17:37:45 +0800
From:   Feng Jiang <jiangfeng@kylinos.cn>
To:     Shyam-sundar.S-k@amd.com, hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Feng Jiang <jiangfeng@kylinos.cn>
Subject: [PATCH] platform/x86/amd: pmc: Fix memory leak in amd_pmc_stb_debugfs_open_v2()
Date:   Wed, 12 Apr 2023 17:37:34 +0800
Message-Id: <20230412093734.1126410-1-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Function amd_pmc_stb_debugfs_open_v2() may be called when the STB
debug mechanism enabled.

When amd_pmc_send_cmd() fails, the 'buf' needs to be released.

Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 drivers/platform/x86/amd/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 2edaae04a691..91d04e710486 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -268,6 +268,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	dev->msg_port = 0;
 	if (ret) {
 		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
+		kfree(buf);
 		return ret;
 	}
 
-- 
2.39.2

