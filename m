Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997F0C001DF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Aug 2023 03:21:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbjHCDVG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Aug 2023 23:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232940AbjHCDVE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Aug 2023 23:21:04 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12352D69
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Aug 2023 20:21:00 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RGYwb3G3czVjtR;
        Thu,  3 Aug 2023 11:19:11 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 11:20:56 +0800
From:   Li Zetao <lizetao1@huawei.com>
To:     <jorge.lopez2@hp.com>, <hdegoede@redhat.com>,
        <markgross@kernel.org>
CC:     <lizetao1@huawei.com>, <platform-driver-x86@vger.kernel.org>
Subject: [PATCH -next] platform/x86: hp-bioscfg: Use kmemdup() to replace kmalloc + memcpy
Date:   Thu, 3 Aug 2023 11:20:27 +0800
Message-ID: <20230803032027.3044851-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There are some warnings reported by coccinelle:

./drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:317:35-42:
		WARNING opportunity for kmemdup
./drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:270:40-47:
		WARNING opportunity for kmemdup
./drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:233:36-43:
		WARNING opportunity for kmemdup

Use kmemdup rather than duplicating its implementation.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 .../platform/x86/hp/hp-bioscfg/spmobj-attributes.c    | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 02291e32684f..86f90238750c 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -230,12 +230,10 @@ static ssize_t sk_store(struct kobject *kobj,
 		length--;
 
 	/* allocate space and copy current signing key */
-	bioscfg_drv.spm_data.signing_key = kmalloc(length, GFP_KERNEL);
+	bioscfg_drv.spm_data.signing_key = kmemdup(buf, length, GFP_KERNEL);
 	if (!bioscfg_drv.spm_data.signing_key)
 		return -ENOMEM;
 
-	memcpy(bioscfg_drv.spm_data.signing_key, buf, length);
-
 	/* submit signing key payload */
 	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_SK,
 				   HPWMI_SECUREPLATFORM,
@@ -267,14 +265,12 @@ static ssize_t kek_store(struct kobject *kobj,
 		length--;
 
 	/* allocate space and copy current signing key */
-	bioscfg_drv.spm_data.endorsement_key = kmalloc(length, GFP_KERNEL);
+	bioscfg_drv.spm_data.endorsement_key = kmemdup(buf, length, GFP_KERNEL);
 	if (!bioscfg_drv.spm_data.endorsement_key) {
 		ret = -ENOMEM;
 		goto exit_kek;
 	}
 
-	memcpy(bioscfg_drv.spm_data.endorsement_key, buf, length);
-
 	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_KEK,
 				   HPWMI_SECUREPLATFORM,
 				   (void *)bioscfg_drv.spm_data.endorsement_key,
@@ -314,13 +310,12 @@ static ssize_t auth_token_store(struct kobject *kobj,
 		length--;
 
 	/* allocate space and copy current auth token */
-	bioscfg_drv.spm_data.auth_token = kmalloc(length, GFP_KERNEL);
+	bioscfg_drv.spm_data.auth_token = kmemdup(buf, length, GFP_KERNEL);
 	if (!bioscfg_drv.spm_data.auth_token) {
 		ret = -ENOMEM;
 		goto exit_token;
 	}
 
-	memcpy(bioscfg_drv.spm_data.auth_token, buf, length);
 	return count;
 
 exit_token:
-- 
2.34.1

