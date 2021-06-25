Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178D2C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Jun 2021 13:02:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F31D261926
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Jun 2021 13:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhFYNEx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 25 Jun 2021 09:04:53 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33904 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229712AbhFYNEx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Jun 2021 09:04:53 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15PCpjbb023528;
        Fri, 25 Jun 2021 13:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=JoMgCM2mWh+cflax6bMzpHUaLShUgL4dkzapj7/udcw=;
 b=TFRs++GZ0x2+HGAPd+EnyTGMTqmw+M9QHNh/zAheumVmKK2P0gVzlk3xRQvoGUTjT/1m
 Od35OpkZCfpNaisURp8MsZNevO7L+bJaD4OKdADxJCAJdx8h2w8ex16qomzJVHNiZG74
 1pbTX1QJ5cfMO5qPkxMQOjOZ7HaRm2JypSb0RZhLP0s/V1BEnODcHt+smgimdIhyDQtQ
 nPiP26kbjgSJJ9rvl+dC8wl2Dh5lAbDIivNWfm0m5zj8GJkE3jfhIQNgoyqnxtVZLDnh
 9DLMTk45SEdSuTLCfkajlSY+cmsijbTshV+CA0ZjYfoQmZTRmEE2s8FkFh/uCgf1QZgU 9Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 39d24m1ah9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 25 Jun 2021 13:01:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15PD1OOx051676;
        Fri, 25 Jun 2021 13:01:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 39d23y255w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 25 Jun 2021 13:01:27 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15PD1Qod051911;
        Fri, 25 Jun 2021 13:01:26 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 39d23y24y3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 25 Jun 2021 13:01:26 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0121.oracle.com (8.14.4/8.14.4) with ESMTP id 15PD1Bc8021145;
        Fri, 25 Jun 2021 13:01:11 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 25 Jun 2021 13:01:11 +0000
Date:   Fri, 25 Jun 2021 16:01:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: intel_skl_int3472: Uninitialized variable in
 skl_int3472_handle_gpio_resources()
Message-ID: <YNXTkLNtiTDlFlZa@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: YsRKOxb4MovEtjy-xEC6smUC8ZMKVRMB
X-Proofpoint-GUID: YsRKOxb4MovEtjy-xEC6smUC8ZMKVRMB
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This function returns negative error codes, zero (to indicate that
everything has been completed successfully) and one (to indicate that
more resources need to be handled still).

This code prints an uninitialized error message when the function
returns one which potentially leads to an Oops.

Fixes: 5de691bffe57 ("platform/x86: Add intel_skl_int3472 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 .../platform/x86/intel/int3472/intel_skl_int3472_discrete.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
index 17c6fe830765..9fe0a2527e1c 100644
--- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
+++ b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
@@ -286,10 +286,10 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	int3472->ngpios++;
 	ACPI_FREE(obj);
 
-	if (ret)
+	if (ret < 0)
 		return dev_err_probe(int3472->dev, ret, err_msg);
 
-	return 0;
+	return ret;
 }
 
 static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
-- 
2.30.2

