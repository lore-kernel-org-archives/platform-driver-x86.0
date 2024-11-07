Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B50F1EE017
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976042; cv=none; b=YnFie7JRyrh++bEor5mIjJwQf7cAT7mFS3EkPFN3pAOB9N9HlL8OFP5ULQS8xHXLrKbVopebSkEF7+g94wo/XRQdDZMdXrxz7xToY9ck3nkMrV8Idvi39UiDIHD4LNQYZCLACGjIHjKkmlE79zvE0SEBVcMOV6eEaI+WNcPPKVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976042; c=relaxed/simple;
	bh=FLEbpz0t4D6wxgKAhZACnB3g3cX6NxnzO52Vu8pl4vA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=H/qcXKRuib1PZwLFu5ujAhaQLz5/o1IE8McO90IopxhuL0jWZFXWL7EgzCtAu7/upMPoZVREvT8Vp+GNo8sxI5tsrIe5zD5L6KgWnERztYvArgVO8DFTQZMZSGPVJADdPAl6FziUuFluphfKMHKagPJyKG6JunEzhkXLQViwlck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wx3uE7vq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wx3uE7vq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730976041; x=1762512041;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FLEbpz0t4D6wxgKAhZACnB3g3cX6NxnzO52Vu8pl4vA=;
  b=Wx3uE7vq9DFv42kyk710+4pcH2pdPpQ/Pl/r4lI5EjhqImQ3Pbtpm75Y
   HY8FVwnalHYUYKZy7qbZ2JKrShb9xcXGdZS6xWWdXzeHROqVa8cmnXHc8
   iFza5KWJj3DoygQwKDQx0AB0GUZmcp28oKwEmQ1RfLPX81kTEyKJWiIj7
   FVibWseP+mxlxTQq26FPhxItrEfzGL4TTuZLdfAKcZqd774+R+i7wX/Ki
   fJcF8dz16vnkIng6T047HrYCKmsPRbe3mVLsLVxt3YQB9zf+qGwW5Uje+
   FkKOZWzmU6/GyZHOQ2UQjsg6lbgwwyCtEr1U3YLegnpx9czm1GhHlYCo3
   Q==;
X-CSE-ConnectionGUID: syw0iY3FRcOTEDD9+qdinw==
X-CSE-MsgGUID: brr0ru0XS+qzsuka+HrmGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="33654260"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="33654260"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:40:40 -0800
X-CSE-ConnectionGUID: IlMyjS60QzSouSaLkr5/mA==
X-CSE-MsgGUID: nz+mr0zESjinKo+mSHv0IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85211981"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:40:38 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 7 Nov 2024 12:40:34 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v4 01/11] platform/x86/amd/pmc: Move STB block into
 amd_pmc_s2d_init()
In-Reply-To: <20241107072714.943423-2-Shyam-sundar.S-k@amd.com>
Message-ID: <abb0a98b-9563-2259-efff-63c3bc555748@linux.intel.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com> <20241107072714.943423-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Nov 2024, Shyam Sundar S K wrote:

> Transfer the support for STB-related file operations to the
> amd_pmc_s2d_init() function, thereby consolidating the STB and S2D
> (Spill to DRAM) functionality in one location.
> 
> For older platforms that supported S2D, exit immediately after creating
> debugfs. These platforms may not support the PMFW messages available on
> newer platforms. This adjustment is necessary due to the relocation of
> debugfs creation into amd_pmc_s2d_init().
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index bbb8edb62e00..54ceb2f9bf56 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -648,15 +648,6 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  			    &s0ix_stats_fops);
>  	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>  			    &amd_pmc_idlemask_fops);
> -	/* Enable STB only when the module_param is set */
> -	if (enable_stb) {
> -		if (amd_pmc_is_stb_supported(dev))
> -			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> -					    &amd_pmc_stb_debugfs_fops_v2);
> -		else
> -			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> -					    &amd_pmc_stb_debugfs_fops);
> -	}
>  }
>  
>  static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
> @@ -982,6 +973,15 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	u32 size = 0;
>  	int ret;
>  
> +	if (amd_pmc_is_stb_supported(dev)) {
> +		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +				    &amd_pmc_stb_debugfs_fops_v2);
> +	} else {
> +		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +				    &amd_pmc_stb_debugfs_fops);
> +		return 0;
> +	}
> +
>  	/* Spill to DRAM feature uses separate SMU message port */
>  	dev->msg_port = 1;

This now runs afoul the other issue you even mentioned yourself (IIRC), 
that is, dev->dbgfs_dir is initialized inside amd_pmc_dbgfs_register() 
which is only called after amd_pmc_s2d_init() until it is moved in patch 
2.

Thus, you need to combine patches 1 & 2 so you don't get a broken kernel
after this patch.

Please also move the enable_stb check inside amd_pmc_s2d_init() in this 
patch since that's another thing you've now broken in between patches 1 & 
3.

So to reiterate, in the first patch combine: Patch 1 + 2 + the if () logic 
move from amd_pmc_probe() into amd_pmc_s2d_init().

-- 
 i.

