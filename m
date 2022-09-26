Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B0FC07E9D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Sep 2022 03:34:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233413AbiIZDeO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 25 Sep 2022 23:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233290AbiIZDeN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 25 Sep 2022 23:34:13 -0400
Received: from out30-54.freemail.mail.aliyun.com (out30-54.freemail.mail.aliyun.com [115.124.30.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D703264A7;
        Sun, 25 Sep 2022 20:34:05 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R391e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VQek2VS_1664163236;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VQek2VS_1664163236)
          by smtp.aliyun-inc.com;
          Mon, 26 Sep 2022 11:34:02 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     peter@piie.net
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] acerhdf: remove unneeded semicolon
Date:   Mon, 26 Sep 2022 11:33:11 +0800
Message-Id: <20220926033311.84765-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

./drivers/platform/x86/acerhdf.c:344:2-3: Unneeded semicolon.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2271
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/platform/x86/acerhdf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index a7407aa032ba..b48c6c5da147 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -341,7 +341,7 @@ static void acerhdf_check_param(struct thermal_zone_device *thermal)
 		pr_err("fanoff temperature (%d) is above fanon temperature (%d), clamping to %d\n",
 		       fanoff, fanon, fanon);
 		fanoff = fanon;
-	};
+	}
 
 	trips[0].temperature = fanon;
 	trips[0].hysteresis  = fanon - fanoff;
-- 
2.20.1.7.g153144c

