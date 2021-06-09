Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239B2C48BCD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 10:18:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0527A61178
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 10:18:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234217AbhFIKU3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 06:20:29 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:48700 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233736AbhFIKU3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 06:20:29 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 159AGQDx080637;
        Wed, 9 Jun 2021 10:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=W9oWCK/plopldSGPtp5hI+W8ATQx18MQkPlRiZnm0kk=;
 b=nv5hKGS0g6w+fqufqgj7rKnsRq5LXQ4sLprbIzXWlCRsozJ+ZggW8NMf/u914gkJw4vl
 Cb+2X4aquH5cUpMpVPcqBzdYjOoAZzHXvy0Z8g4MfL/OFJNIjnOg4d1EJXOJKaHxOWGo
 HhUZp1mdTE01E++y58eyeDd02VAsg6FcQDgEbxKYdoVec04jozP/Nk8uRB3VYkTbmnUM
 jYvzWEIZYVCgcPP1obWNDkuGbz0PUSpTUwfI4fTNfidnDhgDDdTI7T0c7rVAEP9Lfo4P
 APTQj7hODhAdVr6JJkjbKi+LQCfsHW5hE61zlC7fCL+0ryLNz+KMwpk8aTVjofPeNmFh Kw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 38yxscgrp6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Jun 2021 10:18:33 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 159AF56u035390;
        Wed, 9 Jun 2021 10:18:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 390k1rt3w0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Jun 2021 10:18:32 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 159AIWou040342;
        Wed, 9 Jun 2021 10:18:32 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 390k1rt3vv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Jun 2021 10:18:32 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 159AIVIE031481;
        Wed, 9 Jun 2021 10:18:31 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 09 Jun 2021 03:18:31 -0700
Date:   Wed, 9 Jun 2021 13:18:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     markpearson@lenovo.com
Cc:     platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86: think-lmi: Add WMI interface support on
 Lenovo platforms
Message-ID: <YMCVb9IcJ5zNZCpj@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: jGoS4FCRRFT-l-usp71fT6tqhkD0TbHT
X-Proofpoint-GUID: jGoS4FCRRFT-l-usp71fT6tqhkD0TbHT
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10009 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 mlxlogscore=881 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106090049
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Mark Pearson,

The patch a7314b3b1d8a: "platform/x86: think-lmi: Add WMI interface
support on Lenovo platforms" from May 30, 2021, leads to the
following static checker warning:

drivers/platform/x86/think-lmi.c:540 current_value_store() warn: this array is probably non-NULL. 'tlmi_priv.pwd_admin->password'
drivers/platform/x86/think-lmi.c:566 current_value_store() warn: this array is probably non-NULL. 'tlmi_priv.pwd_admin->password'

drivers/platform/x86/think-lmi.c
   533          if (!new_setting)
   534                  return -ENOMEM;
   535  
   536          /* Strip out CR if one is present */
   537          p = strchrnul(new_setting, '\n');
   538          *p = '\0';
   539  
   540          if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password) {
                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This can't be NULL

   541                  auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
   542                                  tlmi_priv.pwd_admin->password,
   543                                  encoding_options[tlmi_priv.pwd_admin->encoding],
   544                                  tlmi_priv.pwd_admin->kbdlang);
   545                  if (!auth_str) {
   546                          ret = -ENOMEM;
   547                          goto out;
   548                  }
   549          }
   550  
   551          if (auth_str)
   552                  set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_name,
   553                                  new_setting, auth_str);
   554          else
   555                  set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
   556                                  new_setting);
   557          if (!set_str) {
   558                  ret = -ENOMEM;
   559                  goto out;
   560          }
   561  
   562          ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
   563          if (ret)
   564                  goto out;
   565  
   566          if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)
                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Same

   567                  ret = tlmi_save_bios_settings(auth_str);
   568          else
   569                  ret = tlmi_save_bios_settings("");
   570  
   571  out:
   572          kfree(auth_str);
   573          kfree(set_str);

regards,
dan carpenter
