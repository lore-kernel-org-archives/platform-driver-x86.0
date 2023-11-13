Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E74C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Nov 2023 13:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjKMNKS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Nov 2023 08:10:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjKMNKR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Nov 2023 08:10:17 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7242E171A
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Nov 2023 05:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699881014; x=1731417014;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+kaEHsj2942PZxmD99kvH6WsqsLlZu+NIPdHmo7YKoQ=;
  b=ineGyFHqAvSOUrhu0EiRRk1jzISlDlZzAq0zQGthaMGL5qeolzD8S9a/
   +A7xEm34r01CNMrJJ2Gd0uPmGb32jmI8nUEv/6Vnz5SoOTvt1OdC/B5+W
   uiiBFoWDpOOefZAssmKAK8UisFHqth5WCsA7u5Z7KTAmWXkhY6+OX0enq
   VyK5a8VnBTvomSDuadjY9Ab77EPALTAQnp3b8D/+Ud8mCGSSuVBVjP5z8
   rNu7dLZUp6WdXnLHO6C/CNQuIDN3d9Qx25TKOGT2KVe0XPxhx2EORwwBS
   2dCjzQeKwfqnLZJAlpS2ah5xWl0hzHkLHFTei8Wl+8jsOr1eQIIyLbo4S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="380819785"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="380819785"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:10:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1095752399"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="1095752399"
Received: from alexdsou-mobl3.gar.corp.intel.com ([10.249.44.83])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:10:11 -0800
Date:   Mon, 13 Nov 2023 15:10:06 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>
Subject: Re: [PATCH v2] platform/x86/amd/pmc: adjust amd_pmc_get_dram_size()
 behavior
In-Reply-To: <20231109061709.2964246-1-Shyam-sundar.S-k@amd.com>
Message-ID: <a7435bf5-4465-5835-9595-ab453c8f125c@linux.intel.com>
References: <20231109061709.2964246-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 9 Nov 2023, Shyam Sundar S K wrote:

> After talking to the PMFW team, its understood that the "get dram size"
> mbox command would only be supported on specific platforms (like Mendocino)
> and not all. So adjust the behavior of amd_pmc_get_dram_size() function
> such that,
> 
> - if that's Rembrandt or Mendocino and the underlying PMFW knows how
> to execute the "get dram size" command it shall give the custom dram size.
> 
> - if the underlying FW does not report the dram size, we just proceed
> further and assign the default dram size.

This commit message lacks the description of the problem we have the Fixes 
tag for. Please explain also that problem as it's very much related.

> Cc: Mark Hasemeyer <markhas@chromium.org>

Mark, does this patch solve the issue for you?

> Link: https://lore.kernel.org/platform-driver-x86/3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com/
> Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> 
> v2:
> - Based on review-ilpo branch
> - Drop calling get smu version from probe.
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index cd6ac04c1468..501c72c7d34c 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -968,17 +968,8 @@ static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
>  {
>  	int ret;
>  
> -	switch (dev->cpu_id) {
> -	case AMD_CPU_ID_YC:
> -		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {
> -			ret = -EINVAL;
> -			goto err_dram_size;
> -		}
> -		break;
> -	default:
> -		ret = -EINVAL;
> +	if (dev->cpu_id != AMD_CPU_ID_YC)
>  		goto err_dram_size;

This now ends up returning uninitialized ret variable. I'd have expected 
compiler to warn you about it...??

It also still prints the dev_err() after jumping to the label. If we know 
dram size not supported, dev_err is not really correct level (I'd say 
dev_dbg at most but better would be to not print anything, IMO).

Thinking it more though, it would make more sense to initialize the 
default dram_size within this function to make it easier to track the code 
+ call this function amd_pmc_init_dram_size() and make it void since its 
return value is not really used for anything else than setting the default
dram_size.

> -	}
>  
>  	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
>  	if (ret || !dev->dram_size)
> 


-- 
 i.


