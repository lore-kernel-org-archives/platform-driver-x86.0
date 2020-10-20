Return-Path: <SRS0=42+Y=D3=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DB9C4363A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Oct 2020 21:09:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAB1E222C8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Oct 2020 21:09:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eepUgAzS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438651AbgJTVJE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Oct 2020 17:09:04 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:56324 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438622AbgJTVJD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Oct 2020 17:09:03 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09KKwrjU013545;
        Tue, 20 Oct 2020 21:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=nh681FgzSi6oU3Xbp75yVtQG/3W2/FQH6CYlF5jtYf0=;
 b=eepUgAzSpkW9EzoJcrzPut6HNrhPDiYKERrZi3WC1dGOZgTdqQEMIZnflgQHRKkF7Tj8
 6iwYdVZPVcJqr7ga33iyf8VpJXjdNB7Njuq2FnswMMOsZpo8crM29Ns52e1HrD8bIy36
 CVAEY9gps/GmOTKYx+9b+2cP9raVx9FE9beksAWwCTznBT21+5BJcXPhAf+UJ/VSnU0o
 tcgb5Zwm/IDu0XZ3D+I+KmoNVPaLaJUIfyw/Blr+q7lokPO/bIonV7Oe6l3j1rEv6P+M
 ZGEd8I79k0KbrmfYZnifxdGAu6QtVUzEcvszUbyEFSszwAhVGq0Mo5oVHkeRSRsIguQT 4Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 347p4awhyn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Oct 2020 21:08:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09KL06tG120550;
        Tue, 20 Oct 2020 21:06:28 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 348a6nn1wn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 20 Oct 2020 21:06:28 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09KL6RoO028303;
        Tue, 20 Oct 2020 21:06:27 GMT
Received: from char.us.oracle.com (/10.152.32.25)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 20 Oct 2020 14:06:26 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
        id 97D8C6A00D6; Tue, 20 Oct 2020 17:08:08 -0400 (EDT)
Date:   Tue, 20 Oct 2020 17:08:08 -0400
From:   Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To:     eric.snowberg@oracle.com, john.haxby@oracle.com,
        todd.vierling@oracle.com
Cc:     David Howells <dhowells@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        Thomas Gleixner <tglx@linutronix.de>, Greg KH <greg@kroah.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Matthew Garrett <matthewgarrett@google.com>,
        James Morris <jmorris@namei.org>
Subject: Re: [PATCH RFC UEK5 5/7] debugfs: Restrict debugfs when the kernel
 is locked down
Message-ID: <20201020210808.GB21080@char.us.oracle.com>
References: <20201020210004.18977-1-konrad.wilk@oracle.com>
 <20201020210004.18977-6-konrad.wilk@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020210004.18977-6-konrad.wilk@oracle.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=927
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010200143
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=947 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010200143
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Oct 20, 2020 at 05:00:02PM -0400, Konrad Rzeszutek Wilk wrote:
> Disallow opening of debugfs files that might be used to muck around when

..snip..

> [Backport:
>  Since UEK5 by default is confidentiality we have to outright
>  disallow debugfs if the default mode is selected. Hence the
>  call to __kernel_is_confidentiality_mode to help us.
> 
>  If we are in integrity lockdown mode, we can enable debugfs
>  IF they match with the above 1-3 criteria]

<sigh>

And that is what I get for _not_ doing --suppress-cc=all

My apologies for spamming you all!

<goes to hide in the corner of shame>

