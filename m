Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384B7C0015E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Aug 2023 06:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjHKGaR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Aug 2023 02:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjHKGaR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Aug 2023 02:30:17 -0400
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F232A10D;
        Thu, 10 Aug 2023 23:30:15 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R531e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VpWG8Xa_1691735398;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VpWG8Xa_1691735398)
          by smtp.aliyun-inc.com;
          Fri, 11 Aug 2023 14:30:12 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     jorge.lopez2@hp.com
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] platform/x86: hp-bioscfg: Remove useless else
Date:   Fri, 11 Aug 2023 14:29:57 +0800
Message-Id: <20230811062957.82728-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The assignment of the else and if branches is the same, so the else
here is redundant, so we remove it.

./drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:545:3-5: WARNING: possible condition with no effect (if == else).

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../platform/x86/hp/hp-bioscfg/passwdobj-attributes.c  | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 03d0188804ba..771e554182dc 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -541,14 +541,8 @@ void hp_exit_password_attributes(void)
 		struct kobject *attr_name_kobj =
 			bioscfg_drv.password_data[instance_id].attr_name_kobj;
 
-		if (attr_name_kobj) {
-			if (!strcmp(attr_name_kobj->name, SETUP_PASSWD))
-				sysfs_remove_group(attr_name_kobj,
-						   &password_attr_group);
-			else
-				sysfs_remove_group(attr_name_kobj,
-						   &password_attr_group);
-		}
+		if (attr_name_kobj)
+			sysfs_remove_group(attr_name_kobj, &password_attr_group);
 	}
 	bioscfg_drv.password_instances_count = 0;
 	kfree(bioscfg_drv.password_data);
-- 
2.20.1.7.g153144c

