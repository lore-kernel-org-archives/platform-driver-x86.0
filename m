Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCE1C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 08:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BD9323120
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 08:17:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbhAMIRR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 03:17:17 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:50342 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbhAMIRR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 03:17:17 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10D8DgeT035026;
        Wed, 13 Jan 2021 08:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=5ICXWdirQJTcNW4Au8BGFVkxs6mzGXevur0jM5R8ea4=;
 b=rQJfzSH24YqzxaGW/+7ICkeflm8LzSNu9cm47A88k0siTsGExgLLfk0EJmcGpYdLegtd
 ZMJ4ndUUhUwlxkeUzKB+plBrf8zD/TBvpegdL1L61mASRPSfuKxVpJ1blAZIVT6fOXsI
 moebEN7j1iTsXKbynT5ikGDDNEHV+r5AbXuIbCruZBqCu1SAEadaqJ0YjUi8QtqrqDzO
 DsTvrMZSyMKDy9GwBHkhTIOC7FZsLQjyu44eIEluvj5QXH+sf5MVYdaGeQaHbQD7F5zI
 U9RTMBbtB6zv0i28ue+fxrRnkwMwZ8MhzmhiF0AGPS/O9O2BGbdhkkHU53qJqRepjBrN Gg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 360kg1t4n4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Jan 2021 08:16:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10D8EW73064465;
        Wed, 13 Jan 2021 08:16:30 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 360kf73p9a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Jan 2021 08:16:30 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10D8GT3u005639;
        Wed, 13 Jan 2021 08:16:29 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 13 Jan 2021 00:16:28 -0800
Date:   Wed, 13 Jan 2021 11:16:21 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/surface: aggregator: prevent information leak in
 ssam_cdev_request()
Message-ID: <X/6sVaewHLPzv00U@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9862 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130048
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9862 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130048
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

If copy_struct_from_user() fails at the start of the function then this
function calls put_user(rsp.length, &r->response.length) before
"rsp.length" is set to zero.  That is a potential security issue because
it discloses kernel stack data to user space.

Fixes: 178f6ab77e61 ("platform/surface: Add Surface Aggregator user-space interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/surface/surface_aggregator_cdev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/surface/surface_aggregator_cdev.c b/drivers/platform/surface/surface_aggregator_cdev.c
index 340d15b148b9..05e9eb118d76 100644
--- a/drivers/platform/surface/surface_aggregator_cdev.c
+++ b/drivers/platform/surface/surface_aggregator_cdev.c
@@ -67,7 +67,7 @@ static long ssam_cdev_request(struct ssam_cdev *cdev, unsigned long arg)
 	struct ssam_cdev_request __user *r;
 	struct ssam_cdev_request rqst;
 	struct ssam_request spec;
-	struct ssam_response rsp;
+	struct ssam_response rsp = {};
 	const void __user *plddata;
 	void __user *rspdata;
 	int status = 0, ret = 0, tmp;
@@ -96,8 +96,6 @@ static long ssam_cdev_request(struct ssam_cdev *cdev, unsigned long arg)
 		spec.flags |= SSAM_REQUEST_UNSEQUENCED;
 
 	rsp.capacity = rqst.response.length;
-	rsp.length = 0;
-	rsp.pointer = NULL;
 
 	/* Get request payload from user-space. */
 	if (spec.length) {
-- 
2.29.2

