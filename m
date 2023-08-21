Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F92EE4996
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 10:45:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbjHUKpj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 06:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232758AbjHUKpj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 06:45:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3575DB
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 03:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692614737; x=1724150737;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YgEiRbrMplcLCRrYJ7mwbMYmLF1w4emYCH6J8165Cik=;
  b=YUXKegkagxyAEr2H74lQQbTBDl5YhlehmzzHxFVqgXVvwTGVp5aLk0vx
   a8VdMfpP08SDu0xJdt8mS6paXcShes53jv4ZYzPvxvt3TlV4MKJRG/uPm
   wocdfjzrom33BeNtNDO//H3RX0h3bS0eCEkv0pwGNSYnQkeaYFXtrF3ce
   dJUGam9pv/wiiy35CRGbZeRIi1778aukNQC+0FkCvqubXVqiNkG7nieKb
   K3rDwFuV+QkS9zsd8lnsne1z/Sgjz+FqsBSl6EzIDsHhDHIVK+bm1Ar0I
   nL3rtjgtDAaRSwAm7laiN+JZ777EMDjERScCJ7bB33Ekoq8uRPVkyHZ+D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="404559351"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="404559351"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 03:45:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="712743036"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="712743036"
Received: from nsnaveen-mobl.gar.corp.intel.com ([10.252.54.252])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 03:45:35 -0700
Date:   Mon, 21 Aug 2023 13:45:33 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Suma Hegde <Suma.Hegde@amd.com>
cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH 3/4] platform/x86/amd/hsmp: change the print message
In-Reply-To: <20230818125119.1323499-4-Suma.Hegde@amd.com>
Message-ID: <58185d5f-e9ff-a8dd-f4e6-4a40393ebb4e@linux.intel.com>
References: <20230818125119.1323499-1-Suma.Hegde@amd.com> <20230818125119.1323499-4-Suma.Hegde@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The coverletter has 0/3 but the patches came with /4?!?

On Fri, 18 Aug 2023, Suma Hegde wrote:

> From: Suma Hegde <suma.hegde@amd.com>
> 
> The print message during platform init is little ambiguous
> so change it to a more meaningful clear message.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index cab59750cde2..1f03a22a9d8a 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -537,10 +537,10 @@ static int __init hsmp_plt_init(void)
>  	for (i = 0; i < num_sockets; i++) {
>  		ret = hsmp_test(i, 0xDEADBEEF);
>  		if (ret) {
> -			pr_err("HSMP is not supported on Fam:%x model:%x\n",
> +			pr_err("HSMP test message failed on Fam:%x model:%x\n",
>  			       boot_cpu_data.x86, boot_cpu_data.x86_model);
> -			pr_err("Or Is HSMP disabled in BIOS ?\n");
> -			return -EOPNOTSUPP;
> +			pr_err("Is HSMP disabled in BIOS ?\n");
> +			return ret;

Your changelog only talks about changing print, and yet you also change 
return statement. Please explain things properly in the changelog (or 
perhaps even make a separate patch out of the return change if it's 
independent change you planned to make).

-- 
 i.

