Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FB7C48BCD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 10:43:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E46760FF4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 10:43:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234836AbhFIKpM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 06:45:12 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:46796 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232165AbhFIKpM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 06:45:12 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 159AeMuY183877;
        Wed, 9 Jun 2021 10:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=UVqx0PLKAH8UOBrGFGE9XeRIQRmJXZKLWyeYqeHC3Ek=;
 b=oeK5U5HXCLPgp1h40f0Xh204KQE+eqmxH+ESUgyTj6YdPoyDDtElfMFP8hqlvv0WYAmA
 T6aPJEHUT7RXFX4DR6a3FcIbKw/j34XDJOYqdc9D1Ccwp6Cx4jiVobmMr6IBJNiHNLDq
 MKQFJ0rSYVz9cK3Uk1yRVJfHZGqYzafvyt6wuz1l6tB6Yi5KRvzotnbI6VP0dy6VMM1w
 APN9/faQtNY5mzTRNlH+dmnXo3iYExBEp1yE6ZkTDzRAe75RJgtiDQ8P7HIfUDp14KNj
 TXBKHalco1uwwC2rHt/Zxs0BzBnDXiY5aCPlTRevvV6nyWuaEaJRgjTLLw+PzUblKvHU Cg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 3914quq8da-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Jun 2021 10:43:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 159Af5Q9084997;
        Wed, 9 Jun 2021 10:43:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 390k1rth6h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Jun 2021 10:43:16 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 159AhFFG094586;
        Wed, 9 Jun 2021 10:43:15 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 390k1rth6f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Jun 2021 10:43:15 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 159AhESv016626;
        Wed, 9 Jun 2021 10:43:14 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 09 Jun 2021 03:43:14 -0700
Date:   Wed, 9 Jun 2021 13:43:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     markpearson@lenovo.com
Cc:     platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86: think-lmi: Add WMI interface support on
 Lenovo platforms
Message-ID: <YMCbPNqiuso+k2rk@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: G3XMeTPrd6zpLTcuxQZW_prCx4xWFy9I
X-Proofpoint-GUID: G3XMeTPrd6zpLTcuxQZW_prCx4xWFy9I
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10009 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106090051
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Mark Pearson,

The patch a7314b3b1d8a: "platform/x86: think-lmi: Add WMI interface
support on Lenovo platforms" from May 30, 2021, leads to the
following static checker warning:

	drivers/platform/x86/think-lmi.c:453 kbdlang_store()
	error: iterator underflow 'setting->kbdlang' (-1),1-3

drivers/platform/x86/think-lmi.c
   438  static ssize_t kbdlang_store(struct kobject *kobj,
   439                                    struct kobj_attribute *attr,
   440                                    const char *buf, size_t count)
   441  {
   442          struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
   443          int length;
   444  
   445          length = strlen(buf);

"count" can never be zero, but strlen(buf) can be zero.

   446          if (buf[length-1] == '\n')
                        ^^^^^^^^
So this code can read before the start of the buffer, potentially
leading to an Oops.

   447                  length--;
   448  
   449          if (!length || (length >= TLMI_LANG_MAXLEN))
   450                  return -EINVAL;
   451  
   452          memcpy(setting->kbdlang, buf, length);
   453          setting->kbdlang[length] = '\0';
   454          return count;
   455  }

regards,
dan carpenter
