Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB05FC54FB9
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Nov 2023 10:33:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234970AbjKPKdr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Nov 2023 05:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235408AbjKPKdn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2023 05:33:43 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37AAD56
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Nov 2023 02:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700130819; x=1731666819;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+F99CeUl9asowk04nqV9QvO4S3kd0sjyxQuOe4lsJ0Q=;
  b=FhpfAgwbbHqYyCApZnC00QFDjQ3YhwHAtfJZBpn3FSHQUg/CTMDaq3Bb
   r2THLdwrnM970AkGzPEZoLl4/PLIlBhUWOXZhGxisQOSWxYUvmvoshr5B
   3HLjtvr/B4PzOnS/Vc3/rANO4kFVS7aTbWbedW9XrR+7A1w485UP03dSU
   jRQ/7jNelN4wxwGdP8XR6r7QNrSo3W/6h0AtaxZ3dInBtsh7+p5wDOV59
   ZksEe/m/Q8emjjhFpt8ZOnwFot0KrS4YessxWcdTSsgtsMlaCHXMR+/vz
   kWMfCKjAZjOgCD9NK4AaqPALzQ01SaMLWjVgcA/O+6JBVM58z9aU32MWk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="388228239"
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="388228239"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 02:33:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="6689040"
Received: from jhsteyn-mobl1.ger.corp.intel.com ([10.252.40.9])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 02:33:38 -0800
Date:   Thu, 16 Nov 2023 12:33:32 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>
Subject: Re: [PATCH v3] platform/x86/amd/pmc: adjust getting DRAM size
 behavior
In-Reply-To: <20231116072124.3370008-1-Shyam-sundar.S-k@amd.com>
Message-ID: <b7fb9851-4f4c-b7b8-9e61-8d3a116c079@linux.intel.com>
References: <20231116072124.3370008-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 16 Nov 2023, Shyam Sundar S K wrote:

> After talking to the PMFW team, its understood that the "get dram size"
> mbox command would only be supported on specific platforms (like Mendocino)
> and not all. So, adjust getting DRAM size behavior such that,
> 
> - if that's Rembrandt or Mendocino and the underlying PMFW knows how
> to execute the "get dram size" command it shall give the custom dram size.
> 
> - if the underlying FW does not report the dram size, we just proceed
> further and assign the default dram size.

Hi,

This still talks only about the solution but I gave you a specific 
instruction to include the description of the problem that warrants
Fixes tag. :-(

So please include something along the lines you had in v1 to describe how 
the current code fails because the version numbers are not initialized.

> Cc: Mark Hasemeyer <markhas@chromium.org>

Promote Mark to Reported-by.

Codewise, this is seems fine and is IMO nice simplification.

-- 
 i.

> Link: https://lore.kernel.org/platform-driver-x86/3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com/
> Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v3:
> - Based on review-ilpo branch
> - Remove amd_pmc_get_dram_size() function
> - Remove prints that are noisy
> 
> v2:
> - Based on review-ilpo branch
> - Drop calling get smu version from probe.
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 31 ++----------------------------
>  1 file changed, 2 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index cd6ac04c1468..c3104714b480 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -964,33 +964,6 @@ static const struct pci_device_id pmc_pci_ids[] = {
>  	{ }
>  };
>  
> -static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
> -{
> -	int ret;
> -
> -	switch (dev->cpu_id) {
> -	case AMD_CPU_ID_YC:
> -		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {
> -			ret = -EINVAL;
> -			goto err_dram_size;
> -		}
> -		break;
> -	default:
> -		ret = -EINVAL;
> -		goto err_dram_size;
> -	}
> -
> -	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
> -	if (ret || !dev->dram_size)
> -		goto err_dram_size;
> -
> -	return 0;
> -
> -err_dram_size:
> -	dev_err(dev->dev, "DRAM size command not supported for this platform\n");
> -	return ret;
> -}
> -
>  static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  {
>  	u32 phys_addr_low, phys_addr_hi;
> @@ -1009,8 +982,8 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  		return -EIO;
>  
>  	/* Get DRAM size */
> -	ret = amd_pmc_get_dram_size(dev);
> -	if (ret)
> +	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
> +	if (ret || !dev->dram_size)
>  		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
>  
>  	/* Get STB DRAM address */
> 
