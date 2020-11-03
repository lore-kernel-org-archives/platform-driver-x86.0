Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A5BC2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 10:20:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD1AA206B5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 10:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZINjizHb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgKCKU3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 05:20:29 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:49094 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727323AbgKCKU3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 05:20:29 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A3AFVjj018617;
        Tue, 3 Nov 2020 10:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ceMmpBp85uSK7UYq+xNwkBHgIRsYKKjXTjjfLl94sDE=;
 b=ZINjizHbP1pJlOo6dkq3MP9mQ2uaYR+txdDapegjeDec/eh754pJh41+tvBzUwcB0bQo
 mHoZOFtzEDINhIoGxUSHHeinqB3ak89ml/56XYciepvYWmxe7K2F+Z00L/Rs/RN7q/iQ
 vO9W7VoPBfSPt9FZmgvNQmlgLSXhGvMigcIz5mrRZXCcharTiNzkZ7VeIOsDhXzG/XgC
 2H6kKL14pqwaD/aNUDgYBGQodQhzox2ipNWiPrMekIbqmU5RQRZiz+PN6n/IW91Rbxa6
 3h0y+b+NTZpCtJdKIRNo1vPFN9eEkyDOLU4STeVUq2hSiiFyOr1P6cWt0xAsOYeBgUsm ZQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 34hhb20gvv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 03 Nov 2020 10:19:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A3AEm1q008894;
        Tue, 3 Nov 2020 10:17:43 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 34jf48779d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Nov 2020 10:17:43 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A3AHgp3029238;
        Tue, 3 Nov 2020 10:17:42 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 03 Nov 2020 02:17:42 -0800
Date:   Tue, 3 Nov 2020 13:17:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Divya Bharathi <divya.bharathi@dell.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: dell-wmi-sysman: fix init_bios_attributes()
 error handling
Message-ID: <20201103101735.GB1127762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9793 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011030068
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9793 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011030068
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Calling release_attributes_data() while holding the "wmi_priv.mutex"
will lead to a dead lock.  The other problem is that if kzalloc() fails
then this should return -ENOMEM but currently it returns success.

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The "platform/x86: Introduce support ... " commit doesn't use the patch
prefix which the driver will use going forward.  That means that whoever
fixes the first bug has to pick the patch prefix and sometimes people
are not happy with that.

 drivers/platform/x86/dell-wmi-sysman/sysman.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell-wmi-sysman/sysman.c
index 3842575a6c18..055556d5c70d 100644
--- a/drivers/platform/x86/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell-wmi-sysman/sysman.c
@@ -443,8 +443,10 @@ static int init_bios_attributes(int attr_type, const char *guid)
 
 		/* build attribute */
 		attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
-		if (!attr_name_kobj)
+		if (!attr_name_kobj) {
+			retval = -ENOMEM;
 			goto err_attr_init;
+		}
 
 		attr_name_kobj->kset = tmp_set;
 
@@ -486,13 +488,13 @@ static int init_bios_attributes(int attr_type, const char *guid)
 		elements = obj ? obj->package.elements : NULL;
 	}
 
-	goto out;
+	mutex_unlock(&wmi_priv.mutex);
+	return 0;
 
 err_attr_init:
+	mutex_unlock(&wmi_priv.mutex);
 	release_attributes_data();
 	kfree(obj);
-out:
-	mutex_unlock(&wmi_priv.mutex);
 	return retval;
 }
 
-- 
2.28.0

