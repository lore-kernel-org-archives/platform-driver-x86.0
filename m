Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20AAC77B75
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 May 2023 08:30:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235364AbjEWIaJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 May 2023 04:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235930AbjEWI3c (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2023 04:29:32 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C332B10C3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684830375; x=1716366375;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IQCSeNREk/maBDueMN/7dEVqRGn3/Pe6XljHJJjG1Hg=;
  b=lEDD4H62dJr4Fo3eqzw3DiiC7ctz2RvhyeMLEIgc/7KvgsI64DE9enHC
   Dii2rLArWA3mFxEqpDmrgb5/nSspUdvk8p0S1umGsj4tkAuG5UR7FhU6Z
   gAPvzy8eHiCVCIt3uvZHTYnGaYpl4vvFgwMJ/TOyKntcnybR63wqct2p4
   +4rUt18ER9ASbYO7+QaTFGHsYsmZlzIxETVipKYfEBtOrOf0eTU2L2lEX
   JOAhRhB50pjVGVqk0sMMAn7NzlvAt0vvoIhNietO8E36vdhQy+FY+S+lK
   rY/WdGNwT2MDIEdbEnPACQK6dhWah/oSuFJ+k/uVyPDx7uwC/LzC+/78V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="418881385"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="418881385"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 01:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="681303138"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="681303138"
Received: from oodnolex-mobl1.ccr.corp.intel.com ([10.252.55.104])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 01:26:12 -0700
Date:   Tue, 23 May 2023 11:26:10 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 3/4] platform/x86/amd: pmc: Add helper function to
 check the cpu id
In-Reply-To: <20230516091308.3905113-4-Shyam-sundar.S-k@amd.com>
Message-ID: <d4e98445-d2f2-10f7-7f62-9bcb16deef79@linux.intel.com>
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com> <20230516091308.3905113-4-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 16 May 2023, Shyam Sundar S K wrote:

> Add a helper routine to check the underlying cpu id, that can be used
> across the PMC driver to remove the duplicate code.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index e2439fda5c02..7e5e6afb3410 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
>  	debugfs_remove_recursive(dev->dbgfs_dir);
>  }
>  
> +static bool amd_pmc_check_sup_cpuid(struct amd_pmc_dev *dev)

Does sup refer to "supported" or some other acronym? If the latter, 
you should mention/open it in the changelog and/or in a comment. If the 
former, the function naming seems too generic (an observation entirely 
based on how/where the function is used, you're not exactly verbose on 
what this actually checks for other than what looks like a set of CPU 
IDs but clearly there's more behind it).

-- 
 i.


> +{
> +	switch (dev->cpu_id) {
> +	case AMD_CPU_ID_YC:
> +	case AMD_CPU_ID_CB:
> +	case AMD_CPU_ID_PS:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  {
>  	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
> @@ -575,8 +587,7 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  			    &amd_pmc_idlemask_fops);
>  	/* Enable STB only when the module_param is set */
>  	if (enable_stb) {
> -		if (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB ||
> -		    dev->cpu_id == AMD_CPU_ID_PS)
> +		if (amd_pmc_check_sup_cpuid(dev))
>  			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>  					    &amd_pmc_stb_debugfs_fops_v2);
>  		else
> @@ -1036,7 +1047,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  
>  	mutex_init(&dev->lock);
>  
> -	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)) {
> +	if (enable_stb && amd_pmc_check_sup_cpuid(dev)) {
>  		err = amd_pmc_s2d_init(dev);
>  		if (err)
>  			goto err_pci_dev_put;
> 
