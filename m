Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9E3165F0C
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 Nov 2024 10:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456540; cv=none; b=Dx/9hO1f6HV5Airi7nfg5VO2eBQrMrk8iRokF5EsxeERpP0cV4X4eVz6ulqCaUOnZysiHcxNYa+OONzfWyY+a+Y+fjhP9uYKx2ELAHQ0dra/+xZvsOletpzh4HpWsOGs77z6F1AjSMEo/z8Zslf1DKeVQEGJTKrOvf77lQkzdtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456540; c=relaxed/simple;
	bh=wuHDJD3UcH+0xt7REfxmSuq1zwr3RF8jJRmYYDB/e64=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sNl7VHBICfo9MupxdHLUG7izF7/pX+zwxfpgSOCt2KmKKhRIQKDErE8Je9Gj5UVSGYUrgH0xhRq4cgofmFwhI24667+X21eujm5RPisFTCEeXQ8JAIlElS2XCwXF9FI2ojCVSp3PyKttGt0/Ol2KP9DDGwqTMNIrMzUtfkCDy50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgeHIorF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgeHIorF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730456538; x=1761992538;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wuHDJD3UcH+0xt7REfxmSuq1zwr3RF8jJRmYYDB/e64=;
  b=DgeHIorFaULVxJNysasi1U87XT75IWi8CQ3Wgpbx8C3l4WP3Fqkx322e
   BzLp/BxiQaIAQO0yY3oDPCborggU4UMMvVYOzdmS/lIi9yRzzLHDNWM/V
   dDGdLVKHgvNaWpneqsSgplmYRlMfhgVH+D/cjQW1O58Soxl9DiWU2nOwz
   dG0PoLnxoOmd1cBu3Ae7wNOIxqJhqc+kLOGWkO7y5X9txbwDZnMoICPYc
   nzUbTSj2lyWu4T50tybRS7+H3QroOxxSX1noDUGH9uQ7jelLCJndAuYZ9
   i7Q9jpdVMhFvcJC303ZzP/prjBRVPkGuoq4MyTESihYRLog+8Ord58/jF
   w==;
X-CSE-ConnectionGUID: OZFTDgLoTWOttHzX2N8R0A==
X-CSE-MsgGUID: UA4TRSMuRSWmEFAtaPBBqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41319790"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41319790"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:22:17 -0700
X-CSE-ConnectionGUID: 9BkrV9CzQa6zU0hFY2h1aw==
X-CSE-MsgGUID: 2v4CKgKjRq2BELKYwQ14DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83265688"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:22:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 1 Nov 2024 12:22:12 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 2/8] platform/x86/amd/pmc: Update function names to
 align with new STB file
In-Reply-To: <20241029155440.3499273-3-Shyam-sundar.S-k@amd.com>
Message-ID: <19e5a734-47ff-aaf7-ff96-6f671acd95f3@linux.intel.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com> <20241029155440.3499273-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Oct 2024, Shyam Sundar S K wrote:

> With STB now in a separate file, update the function names to match the
> correct naming schema by removing the _pmc_ prefix where needed.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/mp1_stb.c | 61 +++++++++++++-------------
>  drivers/platform/x86/amd/pmc/pmc.c     |  8 ++--
>  drivers/platform/x86/amd/pmc/pmc.h     |  4 +-
>  3 files changed, 36 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
> index 9a34dd94982c..5efec020ecac 100644
> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> @@ -47,12 +47,12 @@ enum s2d_arg {
>  	S2D_DRAM_SIZE,
>  };
>  
> -struct amd_pmc_stb_v2_data {
> +struct amd_stb_v2_data {
>  	size_t size;
>  	u8 data[] __counted_by(size);
>  };
>  
> -int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
> +int amd_write_stb(struct amd_pmc_dev *dev, u32 data)
>  {
>  	int err;
>  
> @@ -65,7 +65,7 @@ int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>  	return 0;
>  }
>  
> -static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
> +static int amd_read_stb(struct amd_pmc_dev *dev, u32 *buf)

Why aren't these two consistent with the rest that start with amd_stb_?

And thanks for doing this in a patch separate from the move, it's just so 
much simpler to review them independently. :-)

>  {
>  	int i, err;
>  
> @@ -81,7 +81,7 @@ static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
>  	return 0;
>  }
>  
> -static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
> +static int amd_stb_debugfs_open(struct inode *inode, struct file *filp)
>  {
>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>  	u32 size = FIFO_SIZE * sizeof(u32);
> @@ -92,7 +92,7 @@ static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
>  	if (!buf)
>  		return -ENOMEM;
>  
> -	rc = amd_pmc_read_stb(dev, buf);
> +	rc = amd_read_stb(dev, buf);
>  	if (rc) {
>  		kfree(buf);
>  		return rc;
> @@ -102,8 +102,7 @@ static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
>  	return rc;
>  }
>  
> -static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
> -					loff_t *pos)
> +static ssize_t amd_stb_debugfs_read(struct file *filp, char __user *buf, size_t size, loff_t *pos)
>  {
>  	if (!filp->private_data)
>  		return -EINVAL;
> @@ -112,24 +111,24 @@ static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, siz
>  				       FIFO_SIZE * sizeof(u32));
>  }
>  
> -static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
> +static int amd_stb_debugfs_release(struct inode *inode, struct file *filp)
>  {
>  	kfree(filp->private_data);
>  	return 0;
>  }
>  
> -static const struct file_operations amd_pmc_stb_debugfs_fops = {
> +static const struct file_operations amd_stb_debugfs_fops = {
>  	.owner = THIS_MODULE,
> -	.open = amd_pmc_stb_debugfs_open,
> -	.read = amd_pmc_stb_debugfs_read,
> -	.release = amd_pmc_stb_debugfs_release,
> +	.open = amd_stb_debugfs_open,
> +	.read = amd_stb_debugfs_read,
> +	.release = amd_stb_debugfs_release,
>  };
>  
>  /* Enhanced STB Firmware Reporting Mechanism */
> -static int amd_pmc_stb_handle_efr(struct file *filp)
> +static int amd_stb_handle_efr(struct file *filp)
>  {
>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	struct amd_pmc_stb_v2_data *stb_data_arr;
> +	struct amd_stb_v2_data *stb_data_arr;
>  	u32 fsize;
>  
>  	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
> @@ -144,15 +143,15 @@ static int amd_pmc_stb_handle_efr(struct file *filp)
>  	return 0;
>  }
>  
> -static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> +static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  {
>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>  	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
> -	struct amd_pmc_stb_v2_data *stb_data_arr;
> +	struct amd_stb_v2_data *stb_data_arr;
>  	int ret;
>  
>  	/* Write dummy postcode while reading the STB buffer */
> -	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
> +	ret = amd_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
>  	if (ret)
>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>  
> @@ -169,7 +168,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	 * platforms that support enhanced dram size reporting.
>  	 */
>  	if (dump_custom_stb)
> -		return amd_pmc_stb_handle_efr(filp);
> +		return amd_stb_handle_efr(filp);
>  
>  	/* Get the num_samples to calculate the last push location */
>  	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
> @@ -209,28 +208,28 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	return 0;
>  }
>  
> -static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
> -					   loff_t *pos)
> +static ssize_t amd_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
> +				       loff_t *pos)
>  {
> -	struct amd_pmc_stb_v2_data *data = filp->private_data;
> +	struct amd_stb_v2_data *data = filp->private_data;
>  
>  	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
>  }
>  
> -static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
> +static int amd_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
>  {
>  	kfree(filp->private_data);
>  	return 0;
>  }
>  
> -static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
> +static const struct file_operations amd_stb_debugfs_fops_v2 = {
>  	.owner = THIS_MODULE,
> -	.open = amd_pmc_stb_debugfs_open_v2,
> -	.read = amd_pmc_stb_debugfs_read_v2,
> -	.release = amd_pmc_stb_debugfs_release_v2,
> +	.open = amd_stb_debugfs_open_v2,
> +	.read = amd_stb_debugfs_read_v2,
> +	.release = amd_stb_debugfs_release_v2,
>  };
>  
> -static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
> +static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
>  {
>  	switch (dev->cpu_id) {
>  	case AMD_CPU_ID_YC:
> @@ -249,7 +248,7 @@ static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
>  	}
>  }
>  
> -int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
> +int amd_s2d_init(struct amd_pmc_dev *dev)

For consistency, amd_stb_s2d_init() ?

>  {
>  	u32 phys_addr_low, phys_addr_hi;
>  	u64 stb_phys_addr;
> @@ -259,12 +258,12 @@ int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	if (!enable_stb)
>  		return 0;
>  
> -	if (amd_pmc_is_stb_supported(dev))
> +	if (amd_is_stb_supported(dev))
>  		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> -				    &amd_pmc_stb_debugfs_fops_v2);
> +				    &amd_stb_debugfs_fops_v2);
>  	else
>  		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> -				    &amd_pmc_stb_debugfs_fops);
> +				    &amd_stb_debugfs_fops);

You might want to consider adding a patch to convert this to use ?: 
operator for the only arg that is changing so the entire call doesn't
need to be written twice nor is if/else needed.

-- 
 i.

>  
>  	/* Spill to DRAM feature uses separate SMU message port */
>  	dev->msg_port = 1;
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index a977ff1e52b5..8e7c87505327 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -667,7 +667,7 @@ static void amd_pmc_s2idle_prepare(void)
>  		return;
>  	}
>  
> -	rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_PREPARE);
> +	rc = amd_write_stb(pdev, AMD_PMC_STB_S2IDLE_PREPARE);
>  	if (rc)
>  		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
>  }
> @@ -686,7 +686,7 @@ static void amd_pmc_s2idle_check(void)
>  	/* Dump the IdleMask before we add to the STB */
>  	amd_pmc_idlemask_read(pdev, pdev->dev, NULL);
>  
> -	rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_CHECK);
> +	rc = amd_write_stb(pdev, AMD_PMC_STB_S2IDLE_CHECK);
>  	if (rc)
>  		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
>  }
> @@ -713,7 +713,7 @@ static void amd_pmc_s2idle_restore(void)
>  	/* Let SMU know that we are looking for stats */
>  	amd_pmc_dump_data(pdev);
>  
> -	rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_RESTORE);
> +	rc = amd_write_stb(pdev, AMD_PMC_STB_S2IDLE_RESTORE);
>  	if (rc)
>  		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
>  
> @@ -828,7 +828,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	}
>  
>  	amd_pmc_dbgfs_register(dev);
> -	err = amd_pmc_s2d_init(dev);
> +	err = amd_s2d_init(dev);
>  	if (err)
>  		goto err_pci_dev_put;
>  
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 07fcb13a4136..7e7f9170124c 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -75,8 +75,8 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>  #define AMD_S2D_REGISTER_RESPONSE	0xA80
>  #define AMD_S2D_REGISTER_ARGUMENT	0xA88
>  
> -int amd_pmc_s2d_init(struct amd_pmc_dev *dev);
> -int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
> +int amd_s2d_init(struct amd_pmc_dev *dev);
> +int amd_write_stb(struct amd_pmc_dev *dev, u32 data);
>  int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>  
>  #endif /* PMC_H */
> 
