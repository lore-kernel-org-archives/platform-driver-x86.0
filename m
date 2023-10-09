Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A721CE95A95
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 15:12:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376435AbjJIPMl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 11:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376436AbjJIPMk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 11:12:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B3FCC
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 08:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696864356; x=1728400356;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rBYJyWDZxghCXOyW4pbfvJKjt8OIv8alB/hSjvD3cOY=;
  b=OukUQ5YpxajVk57JMQRcEu3JSVHCQECfgFZD3xC30/HrwMNixbQ9gKRX
   +u6gY1pisWkxIrjzfS10gFLu5t+HnmqHXFo4e/vshbT8PkWTFoHQYHIhY
   IdfKZw84wsOoiONIKA+95UbnbRlqqR5pODGWj8TTetCmhWKERxJEgjxCx
   7z3+wfsXSDSH3zpUmZMrhLoY9pYRjjumILt5WaQ4XjeV/4Hby+hZwp5H8
   m7cEj8sp6KTdo3J5+iczOZ+UVVqatju8H5Om3MkjN1WxWDu5o0NKBbfj2
   9JQdwr8nL6dWRl2dGKGbAwLYV53UrUfbJluJuG+LbFFXsSIQMLOunF2dr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="383041455"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="383041455"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1000250312"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="1000250312"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:12:33 -0700
Date:   Mon, 9 Oct 2023 18:12:31 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v7 1/3] platform/x86/amd/pmc: Use flex array when calling
 amd_pmc_stb_debugfs_open_v2()
In-Reply-To: <20231009141254.22114-1-Shyam-sundar.S-k@amd.com>
Message-ID: <8bb675d-8bbf-c6cb-cec1-f53910ac673e@linux.intel.com>
References: <20231009141254.22114-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 9 Oct 2023, Shyam Sundar S K wrote:

> Currently in amd_pmc_stb_debugfs_open_v2() the buffer size is assumed to
> be fixed and a second call to amd_pmc_stb_debugfs_open_v2() may race with
> a process holding open another fd. This could change "fsize" to a
> bigger size causing an out of bounds read.
> 
> Instead create a struct with a flexarray to solve this.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v6->v7:
> - No change
> 
> v6:
> - Handle release buffer case as per Hans remarks
> - based on review-ilpo branch
> 
> v5:
> - new patch based on comments in v4 from Hans.
> - based on review-ilpo branch
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index c92dd5077a16..fdc1e104c437 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -122,6 +122,11 @@ enum s2d_arg {
>  	S2D_DRAM_SIZE,
>  };
>  
> +struct amd_pmc_stb_v2_data {
> +	size_t size;
> +	u8 data[] __counted_by(size);
> +};
> +
>  struct amd_pmc_bit_map {
>  	const char *name;
>  	u32 bit_mask;
> @@ -239,7 +244,8 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  {
>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
> +	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
> +	struct amd_pmc_stb_v2_data *flex_arr;
>  	int ret;
>  
>  	/* Write dummy postcode while reading the STB buffer */
> @@ -247,10 +253,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	if (ret)
>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>  
> -	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
> -	if (!buf)
> -		return -ENOMEM;
> -
>  	/* Spill to DRAM num_samples uses separate SMU message port */
>  	dev->msg_port = 1;
>  
> @@ -264,10 +266,16 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	dev->msg_port = 0;
>  	if (ret) {
>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
> -		kfree(buf);
>  		return ret;
>  	}
>  
> +	fsize = (num_samples > S2D_TELEMETRY_BYTES_MAX) ? S2D_TELEMETRY_BYTES_MAX : num_samples;

min() but that will only work when you add U postfix to 
S2D_TELEMETRY_BYTES_MAX (I see no reason why it couldn't make it 
unsigned).

Make sure to add the include for it too.

-- 
 i.


> +	flex_arr = kmalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
> +	if (!flex_arr)
> +		return -ENOMEM;
> +
> +	flex_arr->size = fsize;
> +
>  	/* Start capturing data from the last push location */
>  	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>  		fsize  = S2D_TELEMETRY_BYTES_MAX;
> @@ -277,8 +285,8 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  		stb_rdptr_offset = 0;
>  	}
>  
> -	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> -	filp->private_data = buf;
> +	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> +	filp->private_data = flex_arr;
>  
>  	return 0;
>  }
> @@ -286,11 +294,9 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
>  					   loff_t *pos)
>  {
> -	if (!filp->private_data)
> -		return -EINVAL;
> +	struct amd_pmc_stb_v2_data *data = filp->private_data;
>  
> -	return simple_read_from_buffer(buf, size, pos, filp->private_data,
> -					S2D_TELEMETRY_BYTES_MAX);
> +	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
>  }
>  
>  static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
> 
