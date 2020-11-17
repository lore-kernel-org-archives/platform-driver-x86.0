Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8ABC2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Nov 2020 07:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C758E246A5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Nov 2020 07:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ekqzm/b3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgKQHXI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Nov 2020 02:23:08 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:60746 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgKQHXI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Nov 2020 02:23:08 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH7MUeR104182;
        Tue, 17 Nov 2020 07:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ICtkAUndtO9tMuU9h8xBJ9WuRr5qDRAnJq+mpH6K7ZQ=;
 b=ekqzm/b3bRFuy2L0esV7H6Xr3mY3XvrpAq6MKJOwe0fPmBcMcKY/O1agionjgqnOmm9z
 odZiuYkvGc2efaEuJDipfcnwiDvFVtJTz0fpEYtAjxDhKV8lhky9P39j2j2LWvtAsigX
 tpJBbC19gddI9Ysy330QsIGbI8I65soGJnev8yO8aYMdKqqvwx37cfF75KRldHQvFEc1
 t/VhvsFLy3U3ujvY+oyWlF041s9W9UXu3KKOioODxhJqKLAZPhJgmBmOXT6s/8wRcO8O
 Fd5Lv08OJmGD1oK/4SMtKgvu0YhiHU02piCb6EkTEaXWzKJC6IbSFW9GbKRi+eAZN3WL Cw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 34t76kryg7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Nov 2020 07:23:02 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH7EXaA073890;
        Tue, 17 Nov 2020 07:23:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 34ts5vq0m8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 Nov 2020 07:23:02 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AH7N0eA024951;
        Tue, 17 Nov 2020 07:23:01 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 16 Nov 2020 23:23:00 -0800
Date:   Tue, 17 Nov 2020 10:22:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "David E. Box" <david.e.box@linux.intel.com>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: pmt: Fix a potential Oops on error in probe
Message-ID: <20201117072251.GC1111239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170051
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170052
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The "ns->attr_grp" pointer can be NULL so this error handling code needs
to check for that to avoid an Oops.

Fixes: e2729113ce66 ("platform/x86: Intel PMT class driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/intel_pmt_class.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmt_class.c b/drivers/platform/x86/intel_pmt_class.c
index aa88dc23bbde..c8939fba4509 100644
--- a/drivers/platform/x86/intel_pmt_class.c
+++ b/drivers/platform/x86/intel_pmt_class.c
@@ -225,7 +225,8 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 		return 0;
 
 fail_ioremap:
-	sysfs_remove_group(entry->kobj, ns->attr_grp);
+	if (ns->attr_grp)
+		sysfs_remove_group(entry->kobj, ns->attr_grp);
 fail_sysfs:
 	device_unregister(dev);
 fail_dev_create:
-- 
2.28.0

