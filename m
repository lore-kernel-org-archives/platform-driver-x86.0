Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CC0E95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 15:21:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376538AbjJIPVP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 11:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376366AbjJIPVO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 11:21:14 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67127A3
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696864871; x=1728400871;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Kd9rf4ewuD3UkJ3o+bAvktJENp8NsuGLa0CJSW7P5io=;
  b=TQxrxgK4xUqEMXQCGGjXmM/A6RrsGkmylXwu9vJHCWUDQQ5r37mhCEvM
   +vhX5kSs2UZBNvlqNbPix6UGal02GH56pxfGlp9Hx3v1rYWVd29aVl/Lc
   cDzshDqtjsWeoiqbWNPHgYJPDeDewoPdCsdNAMMWHp0ZF4HMRdgqLjra0
   LhBT4KBDbQXJBF/wz/NsBREWZT8MorG6DoDoWReB6gwOGl3We15H81+Wg
   kVlqxTPnC4EGtKYxjxv1TUEp/ujJPRZ3umYbsitc8MXPNWCbip7hmyUmn
   J+xIuiVsDMKNnbf1X+mfFBEwnpn7xTc2udC22l44CQHtT7eeDMfNIS1ZX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="388031910"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="388031910"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="843752375"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="843752375"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:21:10 -0700
Date:   Mon, 9 Oct 2023 18:21:08 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v7 2/3] platform/x86/amd/pmc: Handle overflow cases where
 the num_samples range is higher
In-Reply-To: <20231009141254.22114-2-Shyam-sundar.S-k@amd.com>
Message-ID: <b8d72a27-dc85-f36d-9e85-ca86d81ba83b@linux.intel.com>
References: <20231009141254.22114-1-Shyam-sundar.S-k@amd.com> <20231009141254.22114-2-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 9 Oct 2023, Shyam Sundar S K wrote:

> In amd_pmc_stb_debugfs_open_v2(), the stb buffer is created based on the
> num_samples and the read/write pointer offset. This holds good when the
> num_samples reported by PMFW is less than S2D_TELEMETRY_BYTES_MAX; where
> the stb buffer gets filled from 0th position until
> S2D_TELEMETRY_BYTES_MAX - 1 based on the read/write pointer offset.
> 
> But when the num_samples exceeds the S2D_TELEMETRY_BYTES_MAX, the current
> code does not handle it well as it does not account for the cases where
> the stb buffer has to filled up as a circular buffer.
> 
> Handle this scenario into two cases, where first memcpy will have the
> samples from location:
> (num_samples % S2D_TELEMETRY_BYTES_MAX) - (S2D_TELEMETRY_BYTES_MAX - 1)
> and next memcpy will have the newest ones i.e.
> 0 - (num_samples % S2D_TELEMETRY_BYTES_MAX - 1)
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v6->v7:
> - No change
> 
> v5->v6:
>  - Make changes as per Hans on v5
>  - based on review-ilpo branch
> 
> v4->v5:
>  - Fix exisiting code problems when reading stb buffer as a circular data
>  - based on review-ilpo branch
> 
> v3->v4:
>  - Update code branches and commit-msg as per Ilpo's remark.
> 
> v2->v3:
>  - no change
> 
> v1->v2:
>  - rebase to 'review-hans' branch
>  - drop 2/4 of v1
>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index fdc1e104c437..e0b5d9de473a 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -276,16 +276,23 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  
>  	flex_arr->size = fsize;
>  
> -	/* Start capturing data from the last push location */
> +	/*
> +	 * Start capturing data from the last push location.
> +	 * This is for general cases, where the stb limits
> +	 * are meant for standard usage.
> +	 */
>  	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> -		fsize  = S2D_TELEMETRY_BYTES_MAX;
> -		stb_rdptr_offset = num_samples - fsize;
> +		/* First read oldest data starting 1 behind last write till end of ringbuffer */
> +		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
> +		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
> +
> +		memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> +		/* Second copy the newer samples from offset 0 - last write */
> +		memcpy_fromio(flex_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
>  	} else {
> -		fsize = num_samples;
> -		stb_rdptr_offset = 0;
> +		memcpy_fromio(flex_arr->data, dev->stb_virt_addr, fsize);

Is this actually correct if less than S2D_TELEMETRY_BYTES_MAX are read 
first time, and then the second call will use zero offset if num_samples 
is still less than S2D_TELEMETRY_BYTES_MAX? It seems to return duplicated 
entries and not the latest entries at all until num_samples wraps?

-- 
 i.

