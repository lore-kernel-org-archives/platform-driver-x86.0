Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A515C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 10:00:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F085061446
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 10:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236591AbhDUKBH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Apr 2021 06:01:07 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:34420 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235387AbhDUKBF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Apr 2021 06:01:05 -0400
X-Greylist: delayed 1576 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Apr 2021 06:01:04 EDT
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13L9SvcZ022552;
        Wed, 21 Apr 2021 09:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=8gNfUIaKyR1ckO6hGOqqpfoiLL7Zd/cCYnF0H0aUYzs=;
 b=GEglrgSe8BzcLb28XQ399XpShJF8+bwK/BIce9inxxSxJHY/pOgnfcRC6u+M4Dn4o3rD
 GTR+xHfFT9BEr4J6DAZcoJ6xTCG0jqjArcB0edsqUEWJV9+BjwdH69TzNQ7Bl+YEHmEf
 rTLugt8SQhYBSvl3A4oLocywpOXbi0CyKz6NIYDpmFsf4anM09fEyHUGN8rOhJFElm6g
 zmPCgErBbCaa52/3Wd5042jTQun1aaXrE5zavNRuMdGLKHO+E8G9nsr/HjoNuPmc96NJ
 dHagy3mEPI8rnwtujWR/GxyI6A+qoptM3gqLSgBrXYt/e0ZQv1f6MyXU3Rl48FKivKHC 7A== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3818whgn2s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 21 Apr 2021 09:34:12 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13L9YBH5123619;
        Wed, 21 Apr 2021 09:34:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38098rg2st-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 21 Apr 2021 09:34:11 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13L9YAGb123586;
        Wed, 21 Apr 2021 09:34:10 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 38098rg2sb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 21 Apr 2021 09:34:10 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13L9Y8Ow004066;
        Wed, 21 Apr 2021 09:34:08 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 21 Apr 2021 02:34:07 -0700
Date:   Wed, 21 Apr 2021 12:34:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc:     David E Box <david.e.box@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "David E. Box" <david.e.box@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: intel_pmc_core: re-write copy in
 pmc_core_lpm_latch_mode_write()
Message-ID: <YH/xicL9RXjH2pvD@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: 7bXkb2nbQYGuKUD1iMJTcne8JMqMVFVd
X-Proofpoint-GUID: 7bXkb2nbQYGuKUD1iMJTcne8JMqMVFVd
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There are two bugs in this code:
1) "ret" is unsigned so the error handling is broken.
2) simple_write_to_buffer() is innappropriate.  It will succeed even if
   we are only able to copy a single byte of data from user space.  This
   could lead to an information leak if the buf[] array is not fully
   initialized.

I've fixed it to use strncpy_from_user() and to return -EINVAL if the
user supplied string is not NUL terminated.

Fixes: 8074a79fad2e ("platform/x86: intel_pmc_core: Add option to set/clear LPM mode")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/intel_pmc_core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 3ae00ac85c75..c989796a5d52 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -1360,18 +1360,19 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	struct pmc_dev *pmcdev = s->private;
 	bool clear = false, c10 = false;
 	unsigned char buf[8];
-	size_t ret;
-	int idx, m, mode;
+	int idx, m, mode, ret;
+	size_t len;
 	u32 reg;
 
-	if (count > sizeof(buf) - 1)
+	if (count > sizeof(buf))
 		return -EINVAL;
 
-	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf, count);
+	len = min(count, sizeof(buf));
+	ret = strncpy_from_user(buf, userbuf, len);
 	if (ret < 0)
 		return ret;
-
-	buf[count] = '\0';
+	if (ret == len)
+		return -EINVAL;
 
 	/*
 	 * Allowed strings are:
-- 
2.30.2

