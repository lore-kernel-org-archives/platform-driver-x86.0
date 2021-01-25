Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,BIGNUM_EMAILS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501F3C43381
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 05:53:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27D3D229C4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 05:53:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbhAZFxP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:53:15 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:47646 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728070AbhAYM2k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 07:28:40 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10PBZ4pO152725;
        Mon, 25 Jan 2021 11:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=6fU1umzS/vvSEvzM2dxZvsr0h6JNdfql0G/IzjU/qSE=;
 b=Jq1gYJ7Ve3OqWMENr0UHipfouvUItqZ4jGQ4wU3I6xKJEVk7OOYjjkn9Gc2X0JAdmyHW
 +p44pQt7mB9+Cz0X4E/t1o0NMnnzXc0qRfXjfUVBpihuMl0nkgW5ZiYNS90O6Oc9g0dd
 vWy+JvDfPZKYrnTFXouUNqBK0rzyewmAuqaga5KciQ9iMxWMYTUY7Z52IQu8Vtg+Y6mH
 TLUXcCZIpnTA/T233TcyiNAFx+4vVmrU6yRqgyyWSU1VjzLdzePTe9/tmvEmGuA4iQDd
 JJhoxIj/jlIzGL2wkhNA8eGoCewxzJIRXeSne/M8ITIRMeXUcxf0sBl2yYBjiyRWaBnz gQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 3689aad2jm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 11:42:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10PBfTbA155957;
        Mon, 25 Jan 2021 11:42:38 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 368wjpkm41-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 11:42:38 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10PBgbwn013288;
        Mon, 25 Jan 2021 11:42:37 GMT
Received: from mwanda (/10.175.173.24)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 25 Jan 2021 03:42:36 -0800
Date:   Mon, 25 Jan 2021 14:42:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     luzmaximilian@gmail.com
Cc:     platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/surface: Add Surface Aggregator subsystem
Message-ID: <YA6up/PbuEZ82kNd@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250069
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250068
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Maximilian Luz,

The patch c167b9c7e3d6: "platform/surface: Add Surface Aggregator
subsystem" from Dec 21, 2020, leads to the following static checker
warning:

	drivers/platform/surface/aggregator/ssh_packet_layer.c:1697 ssh_ptl_rx_eval()
	warn: check likely/unlikely parens

drivers/platform/surface/aggregator/ssh_packet_layer.c
  1683  static size_t ssh_ptl_rx_eval(struct ssh_ptl *ptl, struct ssam_span *source)
  1684  {
  1685          struct ssh_frame *frame;
  1686          struct ssam_span payload;
  1687          struct ssam_span aligned;
  1688          bool syn_found;
  1689          int status;
  1690  
  1691          /* Error injection: Modify data to simulate corrupt SYN bytes. */
  1692          ssh_ptl_rx_inject_invalid_syn(ptl, source);
  1693  
  1694          /* Find SYN. */
  1695          syn_found = sshp_find_syn(source, &aligned);
  1696  
  1697          if (unlikely(aligned.ptr - source->ptr) > 0) {

The unlikely() macro returns 0/1.  Smatch is suggesting that this should
just be "if (unlikely((aligned.ptr - source->ptr) > 0)) {" but I'm not
at all sure that that's correct.  Isn't aligned being higher than source
the normal case?

  1698                  ptl_warn(ptl, "rx: parser: invalid start of frame, skipping\n");
  1699  
  1700                  /*
  1701                   * Notes:
  1702                   * - This might send multiple NAKs in case the communication

regards,
dan carpenter
