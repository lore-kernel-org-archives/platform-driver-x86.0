Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A341AE95A95
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 14:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234568AbjJIO7K (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 10:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjJIO7J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 10:59:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F226B4
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 07:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696863548; x=1728399548;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Qn/u0uLzP23ZPZhUFkSkm+Y2KF0cXnC6Z2VaaOesH48=;
  b=GYc9PSXG42t+TvnmuWYjBTPywR2bWSX/swRNOBmuM5Y2HaYRioe7y+oz
   lCjCsAaXDlSjB9YH7cLwO/S3oRaWCzz5heMBho6JFEXSSqOEjRa6sq+LB
   eN4+sTMb8TnCQtRh2vccTHcNJV8F8U65gjOomYyuZYdoPGFm07sDGLDJc
   YPSo5XJLtYvFHOvblSl/47OJC/KZIWkxYp/QTdyWurrs3LQl4PItcho42
   btth1I9EAlKq7vBvL+1vtzau/Hq+atikFi7f+EYPKyNhG4Yp/YNFcaeTA
   k5+fxGUBXGJphUMYd9AddF3yXJcjKwKsmxp9Wbys5NFPRETyRA2D5p+KB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="448349534"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="448349534"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 07:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="896794484"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="896794484"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 07:57:25 -0700
Date:   Mon, 9 Oct 2023 17:59:03 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Fix fetching DRAM size
 mechanism
In-Reply-To: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com>
Message-ID: <10d574b6-a197-6a57-92e9-5b548dc3df67@linux.intel.com>
References: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 9 Oct 2023, Shyam Sundar S K wrote:

> amd_pmc_get_dram_size() is used to get the DRAM size information. But in
> the current code, mailbox command to get the DRAM size info is sent based
> on the values of dev->major and dev->minor.
> 
> But dev->major and dev->minor will have either junk or zero assigned to
> them until at least once a call to amd_pmc_get_smu_version() is made which
> ideally populates dev->major and dev->minor.
> 
> Add a missing amd_pmc_get_smu_version() call to amd_pmc_get_dram_size().
> 
> Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> based on review-ilpo, can be added on top of recent stb changes
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 1424c03c1f03..92adf4523736 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -981,6 +981,10 @@ static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
>  {
>  	int ret;
>  
> +	ret = amd_pmc_get_smu_version(dev);
> +	if (ret)
> +		return ret;
> +
>  	switch (dev->cpu_id) {
>  	case AMD_CPU_ID_YC:
>  		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {

Does this really belong here? Correct me if I recall wrong but the reason 
why amd_pmc_get_smu_version() was not always done during init was that it 
added noticeable delay to boot? Based on that, I kind of assumed it's 
generic thing (and a such, unrelated to amd_pmc_get_dram_size()) so why is 
this call this deep in the call chain? Perhaps amd_pmc_s2d_init() would 
be more appropriate place for it since you now make the call 
unconditional anyway for that code path?

-- 
 i.

