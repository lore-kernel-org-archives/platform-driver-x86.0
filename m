Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B59C64E7B
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 14:45:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F87D221EB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 14:45:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbgLBOpG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Dec 2020 09:45:06 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:55382 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgLBOpG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Dec 2020 09:45:06 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B2EcxT3070405;
        Wed, 2 Dec 2020 14:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=XL/oCNCFV+IXYXsYVyNB7YNAmO1Fc9HeM+CX17d7vHk=;
 b=Ft/hT4z+OQGJKiXc8WF/FkgSCz2QMposwc5ArplrB7CnI39prspFMbO21PNmdTh5OP4v
 7QomkupGYE63lNTSrcsxbvC5iEOpfB8Po+QBlTpM7/VeCYICEqBgjDB+q7AGwSUalPqO
 xxaxgb/hGqjQd+4yNGY6BkDFOVFXnmiYejeBwkshCiFig6ayhukwj+7Bsook/xk/VuoL
 DLElWB3KOKk3qkwrGeuUu9+TYiMuEES1M/DAHEp0Vs8cc2Q+8g2StxRXniMvA4UYmluM
 9F/k0uCphg/5JkfYDkg/mLIDGZEgBRctI5yMZ7Ut8W+2R+sJhz9qCfDVlwaseSc8JB4I WA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 353c2b0s82-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 02 Dec 2020 14:44:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B2EfMh4191215;
        Wed, 2 Dec 2020 14:44:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 3540fyuayw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Dec 2020 14:44:16 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B2EiFc9023913;
        Wed, 2 Dec 2020 14:44:15 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 02 Dec 2020 06:44:14 -0800
Date:   Wed, 2 Dec 2020 17:44:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Justin Ernst <justin.ernst@hpe.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Borislav Petkov <bp@suse.de>, Steve Wahl <steve.wahl@hpe.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] x86/platform/uv: Fix an error code in uv_hubs_init()
Message-ID: <X8eoN/jMAJb3H3iv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012020090
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Return -ENOMEM on allocation failure instead of returning success.

Fixes: 4fc2cf1f2daf ("x86/platform/uv: Add new uv_sysfs platform driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/uv_sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/uv_sysfs.c b/drivers/platform/x86/uv_sysfs.c
index 54c342579f1c..e17ce8c4cdad 100644
--- a/drivers/platform/x86/uv_sysfs.c
+++ b/drivers/platform/x86/uv_sysfs.c
@@ -248,6 +248,7 @@ static int uv_hubs_init(void)
 		uv_hubs[i] = kzalloc(sizeof(*uv_hubs[i]), GFP_KERNEL);
 		if (!uv_hubs[i]) {
 			i--;
+			ret = -ENOMEM;
 			goto err_hubs;
 		}
 
-- 
2.29.2

