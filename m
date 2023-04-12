Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08323C77B6E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Apr 2023 10:46:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjDLKqt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Apr 2023 06:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjDLKqm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 06:46:42 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A476A78
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 03:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681296401; x=1712832401;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=q6lveQBAmRdk3KNS+OsnnXm+7WrZrJOBwwAimh03fm0=;
  b=F11SxAogEO+CbLl+N/7RSwPu6MTEnn9xIRJ16+DlzkEGNVRGIl5mffft
   p+BeJYSitFPTLgt7aaYaESfy1GEVgJCzeUxgVh6W+n6UiNiU0th1RFBlo
   Wg9+Mvt+aa5A6PACw8IIBmY+Dx6jy81QrNKbNIMNd7bRSOeEtEMdr5t3n
   lKCBezY1cl31bmSTGeyFuv9GAzQlfXtj63+GcnjQTIcn8QH7qikXU8EbY
   7w0JpEyXWQdB4ANN2v/x3uNDN2POz0zLO3pf/kFu1tZpi9BKCwCwyzD2d
   GI19V6XIIKctd9MvJ4KzNi5U3G5HtO1cK5/YVcLylkCoruPmE1lW8USs8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="323484303"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="323484303"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 03:46:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="688918750"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="688918750"
Received: from chanse1-mobl2.ger.corp.intel.com ([10.251.213.80])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 03:46:11 -0700
Date:   Wed, 12 Apr 2023 13:46:08 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/x86/amd: pmc: Get STB DRAM size from
 PMFW
In-Reply-To: <20230412102156.2592318-1-Shyam-sundar.S-k@amd.com>
Message-ID: <24be9a44-c273-fad9-666c-699270e95929@linux.intel.com>
References: <20230412102156.2592318-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 12 Apr 2023, Shyam Sundar S K wrote:

> Recent PMFW's have support for querying the STB DRAM size. Add this
> support to the driver.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2:
>  - Based on review-hans branch
>  - Add a switch for cpu-id check based on feedback from Mario.
> 
>  drivers/platform/x86/amd/pmc.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 877b629e5cae..9f8bc6711413 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -114,6 +114,7 @@ enum s2d_arg {
>  	S2D_PHYS_ADDR_LOW,
>  	S2D_PHYS_ADDR_HIGH,
>  	S2D_NUM_SAMPLES,
> +	S2D_DRAM_SIZE,
>  };
>  
>  struct amd_pmc_bit_map {
> @@ -146,6 +147,7 @@ struct amd_pmc_dev {
>  	u32 base_addr;
>  	u32 cpu_id;
>  	u32 active_ips;
> +	u32 dram_size;
>  /* SMU version information */
>  	u8 smu_program;
>  	u8 major;
> @@ -888,11 +890,34 @@ static const struct pci_device_id pmc_pci_ids[] = {
>  	{ }
>  };
>  
> +static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
> +{
> +	switch (dev->cpu_id) {
> +	case AMD_CPU_ID_YC:
> +		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39)))
> +			goto err_dram_size;
> +		break;
> +	default:
> +		goto err_dram_size;
> +	}
> +
> +	amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, STB_SPILL_TO_DRAM, 1);

Passing true to bool argument, not 1.

> +	if (!dev->dram_size)
> +		goto err_dram_size;

Don't overwrite the error code from amd_pmc_send_cmd() with -EINVAL on 
the error path but pass the same errorcode on.

It might warrant splitting the error path such that the amd_pmc_send_cmd() 
errors do not print the error in this function but only return the error 
code (amd_pmc_send_cmd() already has dev_err() for each of the error 
return cases). That only leaves what to do on non-error return and zero 
dram_size, is that expected to happen?

-- 
 i.

> +
> +	return 0;
> +
> +err_dram_size:
> +	dev_err(dev->dev, "DRAM size command not supported for this platform\n");
> +	return -EINVAL;
> +}
> +
>  static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  {
>  	u32 phys_addr_low, phys_addr_hi;
>  	u64 stb_phys_addr;
>  	u32 size = 0;
> +	int ret;
>  
>  	/* Spill to DRAM feature uses separate SMU message port */
>  	dev->msg_port = 1;
> @@ -901,6 +926,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	if (size != S2D_TELEMETRY_BYTES_MAX)
>  		return -EIO;
>  
> +	/* Get DRAM size */
> +	ret = amd_pmc_get_dram_size(dev);
> +	if (ret)
> +		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
> +
>  	/* Get STB DRAM address */
>  	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
>  	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
> @@ -910,7 +940,7 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	/* Clear msg_port for other SMU operation */
>  	dev->msg_port = 0;
>  
> -	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, S2D_TELEMETRY_DRAMBYTES_MAX);
> +	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
>  	if (!dev->stb_virt_addr)
>  		return -ENOMEM;
>  
> 

