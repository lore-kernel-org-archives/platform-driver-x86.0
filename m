Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF85C5519F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Nov 2020 18:30:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D90342467A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Nov 2020 18:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730927AbgKQS34 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Nov 2020 13:29:56 -0500
Received: from mga02.intel.com ([134.134.136.20]:38826 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727552AbgKQS34 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Nov 2020 13:29:56 -0500
IronPort-SDR: clbDYXNjeA//uF0zpld3OH2bgnuWR1IquFYlhA2/8udJ3BdbVh/lhcFLyiU+Sec1edR/TWv/+V
 RYxmeXC73nWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158013858"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="158013858"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 10:29:52 -0800
IronPort-SDR: cEInBk2OrWdvd1dUPcjaL7srNnC/CGuisYnaZJjoAGdvqMaAuPAX+K78AOJbfxoLoAPNby5txb
 ESW0SvKoDkgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="532317905"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga006.fm.intel.com with ESMTP; 17 Nov 2020 10:29:51 -0800
Received: from debox1-desk1.jf.intel.com (debox1-desk1.jf.intel.com [10.7.201.137])
        by linux.intel.com (Postfix) with ESMTP id 59CD15801CF;
        Tue, 17 Nov 2020 10:29:51 -0800 (PST)
Message-ID: <ed41e77dd19971faf01b3062c5e25e7ed8ed69db.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: pmt: Fix a potential Oops on error in
 probe
From:   "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Tue, 17 Nov 2020 10:29:51 -0800
In-Reply-To: <20201117072251.GC1111239@mwanda>
References: <20201117072251.GC1111239@mwanda>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Dan.

Reviewed-by: David E. Box <david.e.box@linux.intel.com>

On Tue, 2020-11-17 at 10:22 +0300, Dan Carpenter wrote:
> The "ns->attr_grp" pointer can be NULL so this error handling code
> needs
> to check for that to avoid an Oops.
> 
> Fixes: e2729113ce66 ("platform/x86: Intel PMT class driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/platform/x86/intel_pmt_class.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmt_class.c
> b/drivers/platform/x86/intel_pmt_class.c
> index aa88dc23bbde..c8939fba4509 100644
> --- a/drivers/platform/x86/intel_pmt_class.c
> +++ b/drivers/platform/x86/intel_pmt_class.c
> @@ -225,7 +225,8 @@ static int intel_pmt_dev_register(struct
> intel_pmt_entry *entry,
>  		return 0;
>  
>  fail_ioremap:
> -	sysfs_remove_group(entry->kobj, ns->attr_grp);
> +	if (ns->attr_grp)
> +		sysfs_remove_group(entry->kobj, ns->attr_grp);
>  fail_sysfs:
>  	device_unregister(dev);
>  fail_dev_create:

