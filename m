Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4417F343881
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909746; cv=none; b=q3LyWYMzc/qilZiLc0rU8Me2300GH+eBBR1DUJfrw0uS6oOSvCwVjyGX8XulEWO823ZYWDfyTTM5+5/8whfXnW6ALI0tn7n/XrzpzY3qSVssIGctnrC1xbTfSTdrTBkTmM3/3K/0PWrIOUnKt7AsB2TKER17oRtmED+xHAdbxIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909746; c=relaxed/simple;
	bh=woc9Pij4yIq8/lFcx2FUwelHkF4lDCjvs60gVSenNpE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CMR2hmZLDWec7fYKmRkNzI34j0oo2gSP33goMhYTfKr6loyFXJwmH9ORrseB0ogEIsacpf5qFCqHOzo9K6NE65VrgtyiAURQHDYxFVp9vXNMEo8MemarqWXMyqEjK+GhK9N7gs2hqPJdrYATRImGPjyJq2FXBqyVkfmclhfNKAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5tNhJi1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5tNhJi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780909743; x=1812445743;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=woc9Pij4yIq8/lFcx2FUwelHkF4lDCjvs60gVSenNpE=;
  b=C5tNhJi1QvvVsfABvDt4qxRJWVhKJZ6vHWPMf98hZCvx6/YAJ5MQQCvH
   ONFTkB8Ro/DiteC8yp7ChoemzyAZB2tvkXqRF9g/VbQ/fzrJOzluRDMzo
   +WI2KEeyn4U5WGGZAzKdLOQfUldf4tdEbqwo22JdEv/OnIA94tIe78f9D
   qbg8ZnO0AtjWjMMJsYFyt3c2uzAWLT5fH9USlL5BDPuOYUYzI1fRlmLDH
   CLIgUdRIanL6/SzDljTdET1hY+1zkygWGID77PuMQv4vf+4sDFpbXY1mI
   t+/EBhDhKWhPFDygj2QTuXOsIc0fH0tbpIGOoW4/oOaVxY2cr6kJOXMrq
   w==;
X-CSE-ConnectionGUID: oEUn/jlfToyT+EwhjAnUow==
X-CSE-MsgGUID: PabOZmXKTpenfa/nSYNFCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81496659"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="81496659"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 02:09:01 -0700
X-CSE-ConnectionGUID: H0YAuNvlRzWiRw1zqtrtuw==
X-CSE-MsgGUID: 0Yx3dxWgR9mLmTO20/alyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="241049465"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 02:08:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jun 2026 12:08:55 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmc: Use per-SoC cpu_info struct
 for SMU mailbox and IP info
In-Reply-To: <20260601112103.1690951-2-Shyam-sundar.S-k@amd.com>
Message-ID: <d18cbafc-fd11-c3f9-db5f-4976ba26e711@linux.intel.com>
References: <20260601112103.1690951-1-Shyam-sundar.S-k@amd.com> <20260601112103.1690951-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Jun 2026, Shyam Sundar S K wrote:

> Replace the scattered per-field assignments in amd_pmc_get_ip_info() and
> amd_pmc_get_os_hint() with a single amd_pmc_cpu_info struct capturing all
> SoC-specific parameters such as SMU offsets, IP block table, and OS hint.
> 
> Define static const instances per SoC variant and embed them as
> driver_data in the PCI ID table via PCI_DEVICE_DATA(), avoiding runtime
> switch statements. Store a pointer in amd_pmc_dev replacing the individual
> smu_msg, num_ips, and ips_ptr fields, SMU send/receive paths and debugfs
> iterator dereference through it. For the 1Ah M70 variant requiring
> boot_cpu_data.x86_model detection, fallback to amd_pmc_set_cpu_info().
> 
> Also, rename AMD_CPU_ID_* to PCI_DEVICE_ID_AMD_CPU_ID_* with compatibility
> aliases.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 161 +++++++++++++++++++----------
>  drivers/platform/x86/amd/pmc/pmc.h |  69 +++++++++----
>  2 files changed, 156 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index cae3fcafd4d7..6c7fa80c7f09 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -85,6 +85,52 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>  	{"VPE",		BIT(21)},
>  };
>  
> +/* CPU info structures for different SoC variants */
> +static const struct amd_pmc_cpu_info amd_pco_cpu_info = {
> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
> +	.num_ips	= 12,
> +	.ips_ptr	= soc15_ip_blk,
> +	.os_hint	= MSG_OS_HINT_PCO,
> +};
> +
> +static const struct amd_pmc_cpu_info amd_rn_cpu_info = {
> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
> +	.num_ips	= 12,
> +	.ips_ptr	= soc15_ip_blk,
> +	.os_hint	= MSG_OS_HINT_RN,
> +};
> +
> +static const struct amd_pmc_cpu_info amd_ps_cpu_info = {
> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
> +	.num_ips	= 21,
> +	.ips_ptr	= soc15_ip_blk,
> +	.os_hint	= MSG_OS_HINT_RN,
> +};
> +
> +static const struct amd_pmc_cpu_info amd_1ah_cpu_info = {
> +	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_20H,
> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
> +	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
> +	.ips_ptr	= soc15_ip_blk,
> +	.os_hint	= MSG_OS_HINT_RN,
> +};
> +
> +static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info = {
> +	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_20H,
> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
> +	.num_ips	= ARRAY_SIZE(soc15_ip_blk_v2),
> +	.ips_ptr	= soc15_ip_blk_v2,
> +	.os_hint	= MSG_OS_HINT_RN,
> +};
> +
>  static bool disable_workarounds;
>  module_param(disable_workarounds, bool, 0644);
>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
> @@ -101,35 +147,37 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
>  	iowrite32(val, dev->regbase + reg_offset);
>  }
>  
> -static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
> +static void amd_pmc_set_cpu_info(struct amd_pmc_dev *dev)
>  {
> +	const struct amd_pmc_cpu_info *info = NULL;
> +
>  	switch (dev->cpu_id) {
>  	case AMD_CPU_ID_PCO:
> +		info = &amd_pco_cpu_info;
> +		break;
>  	case AMD_CPU_ID_RN:
>  	case AMD_CPU_ID_VG:
>  	case AMD_CPU_ID_YC:
>  	case AMD_CPU_ID_CB:
> -		dev->num_ips = 12;
> -		dev->ips_ptr = soc15_ip_blk;
> -		dev->smu_msg = 0x538;
> +		info = &amd_rn_cpu_info;
>  		break;
>  	case AMD_CPU_ID_PS:
> -		dev->num_ips = 21;
> -		dev->ips_ptr = soc15_ip_blk;
> -		dev->smu_msg = 0x538;
> +		info = &amd_ps_cpu_info;

Are these actually needed, can't the code be reorganized so here we do 
only:

	id = pci_match_id(pmc_pci_ids, rdev);
	if (!id)
		return -ENODEV;

	if (id->driver_data) {
		dev->cpu_info = id->driver_data;
		return 0;
	}

	switch (...) {

>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -		if (boot_cpu_data.x86_model == 0x70) {
> -			dev->num_ips = ARRAY_SIZE(soc15_ip_blk_v2);
> -			dev->ips_ptr = soc15_ip_blk_v2;
> -		} else {
> -			dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
> -			dev->ips_ptr = soc15_ip_blk;
> -		}
> -		dev->smu_msg = 0x938;
> +		/* Special case: check x86_model for M70 variant */
> +		if (boot_cpu_data.x86_model == 0x70)
> +			info = &amd_1ah_m70_cpu_info;
> +		else
> +			info = &amd_1ah_cpu_info;

Just assign directly to dev->cpu_info.

>  		break;
> +	default:
> +		dev_err(dev->dev, "Unknown CPU ID: 0x%x\n", dev->cpu_id);
> +		return;
>  	}
> +
> +	dev->cpu_info = info;
>  }
>  
>  static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
> @@ -296,9 +344,9 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>  		   table.timeto_resume_to_os_lastcapture);
>  
>  	seq_puts(s, "\n=== Active time (in us) ===\n");
> -	for (idx = 0 ; idx < dev->num_ips ; idx++) {
> -		if (dev->ips_ptr[idx].bit_mask & dev->active_ips)
> -			seq_printf(s, "%-8s : %lld\n", dev->ips_ptr[idx].name,
> +	for (idx = 0 ; idx < dev->cpu_info->num_ips ; idx++) {
> +		if (dev->cpu_info->ips_ptr[idx].bit_mask & dev->active_ips)
> +			seq_printf(s, "%-8s : %lld\n", dev->cpu_info->ips_ptr[idx].name,
>  				   table.timecondition_notmet_lastcapture[idx]);
>  	}
>  
> @@ -425,9 +473,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>  		argument = dev->stb_arg.arg;
>  		response = dev->stb_arg.resp;
>  	} else {
> -		message = dev->smu_msg;
> -		argument = AMD_PMC_REGISTER_ARGUMENT;
> -		response = AMD_PMC_REGISTER_RESPONSE;
> +		message = dev->cpu_info->smu_msg;
> +		argument = dev->cpu_info->smu_arg;
> +		response = dev->cpu_info->smu_rsp;
>  	}
>  
>  	value = amd_pmc_reg_read(dev, response);
> @@ -452,9 +500,9 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
>  		argument = dev->stb_arg.arg;
>  		response = dev->stb_arg.resp;
>  	} else {
> -		message = dev->smu_msg;
> -		argument = AMD_PMC_REGISTER_ARGUMENT;
> -		response = AMD_PMC_REGISTER_RESPONSE;
> +		message = dev->cpu_info->smu_msg;
> +		argument = dev->cpu_info->smu_arg;
> +		response = dev->cpu_info->smu_rsp;
>  	}
>  
>  	/* Wait until we get a valid response */
> @@ -514,19 +562,12 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
>  
>  static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
>  {
> -	switch (dev->cpu_id) {
> -	case AMD_CPU_ID_PCO:
> -		return MSG_OS_HINT_PCO;
> -	case AMD_CPU_ID_RN:
> -	case AMD_CPU_ID_VG:
> -	case AMD_CPU_ID_YC:
> -	case AMD_CPU_ID_CB:
> -	case AMD_CPU_ID_PS:
> -	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> -	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -		return MSG_OS_HINT_RN;
> +	if (!dev->cpu_info) {
> +		dev_err(dev->dev, "CPU info not initialized\n");
> +		return -EINVAL;
>  	}
> -	return -EINVAL;
> +
> +	return dev->cpu_info->os_hint;

If there's always a cpu_info struct (see below), the whole function can be 
removed and the caller just uses the ->cpu_info->os_hint directly.

>  }
>  
>  static int amd_pmc_wa_irq1(struct amd_pmc_dev *pdev)
> @@ -710,18 +751,18 @@ static const struct dev_pm_ops amd_pmc_pm = {
>  };
>  
>  static const struct pci_device_id pmc_pci_ids[] = {
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CB) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_PCO, &amd_pco_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_RV, &amd_pco_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_RN, &amd_rn_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_CZN, &amd_rn_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_VG, &amd_rn_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_YC, &amd_rn_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_CB, &amd_rn_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_PS, &amd_ps_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_SP, NULL) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, NULL) },

I suggest you add a dummy entry for these two as well so we'll always 
have a valid cpu_info struct.

> +	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
> +	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
>  	{ }
>  };
>  
> @@ -729,6 +770,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  {
>  	struct amd_pmc_dev *dev = &pmc;
>  	struct pci_dev *rdev;
> +	const struct pci_device_id *id;
>  	u32 base_addr_lo, base_addr_hi;
>  	u64 base_addr;
>  	int err;
> @@ -736,7 +778,13 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  
>  	dev->dev = &pdev->dev;
>  	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> -	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
> +	if (!rdev) {
> +		err = -ENODEV;
> +		goto err_pci_dev_put;

FYI, there's also __free(pci_dev_put) but then you'll need to handle 
no_free_ptr() on the success path which will require some reorganization 
so my suggestion is to look at it after this series is done.

> +	}
> +
> +	id = pci_match_id(pmc_pci_ids, rdev);
> +	if (!id) {
>  		err = -ENODEV;
>  		goto err_pci_dev_put;
>  	}
> @@ -749,6 +797,18 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	}
>  
>  	dev->rdev = rdev;
> +
> +	if (id->driver_data)
> +		dev->cpu_info = (const struct amd_pmc_cpu_info *)id->driver_data;

IMO, this would be more logical to do inside amd_pmc_set_cpu_info().

> +	else
> +		amd_pmc_set_cpu_info(dev);

Perhaps this call can be moved earlier, so that pci_match_id() has to be 
done only once inside it?

> +	if (!dev->cpu_info) {
> +		dev_err(dev->dev, "Failed to set CPU info\n");
> +		err = -ENODEV;
> +		goto err_pci_dev_put;
> +	}
> +
>  	err = amd_smn_read(0, AMD_PMC_BASE_ADDR_LO, &val);
>  	if (err) {
>  		dev_err(dev->dev, "error reading 0x%x\n", AMD_PMC_BASE_ADDR_LO);
> @@ -778,9 +838,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	if (err)
>  		goto err_pci_dev_put;
>  
> -	/* Get num of IP blocks within the SoC */
> -	amd_pmc_get_ip_info(dev);
> -
>  	platform_set_drvdata(pdev, dev);
>  	if (IS_ENABLED(CONFIG_SUSPEND)) {
>  		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index fe3f53eb5955..0fd0ced21831 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -17,6 +17,10 @@
>  /* SMU communication registers */
>  #define AMD_PMC_REGISTER_RESPONSE	0x980
>  #define AMD_PMC_REGISTER_ARGUMENT	0x9BC
> +#define AMD_PMC_REGISTER_MESSAGE	0x538
> +
> +/* SMU communication registers for 1Ah 20h SoC */
> +#define AMD_PMC_REGISTER_MSG_1AH_20H	0x938
>  
>  /* PMC Scratch Registers */
>  #define AMD_PMC_SCRATCH_REG_CZN		0x94
> @@ -90,6 +94,21 @@ struct stb_arg {
>  	u32 resp;
>  };
>  
> +struct amd_pmc_bit_map {
> +	const char *name;
> +	u32 bit_mask;
> +};
> +
> +/* SoC-specific information */
> +struct amd_pmc_cpu_info {
> +	u32 smu_msg;
> +	u32 smu_arg;
> +	u32 smu_rsp;
> +	u32 num_ips;
> +	const struct amd_pmc_bit_map *ips_ptr;
> +	int os_hint;
> +};
> +
>  struct amd_pmc_dev {
>  	void __iomem *regbase;
>  	void __iomem *smu_virt_addr;
> @@ -99,9 +118,6 @@ struct amd_pmc_dev {
>  	u32 cpu_id;
>  	u32 dram_size;
>  	u32 active_ips;
> -	const struct amd_pmc_bit_map *ips_ptr;
> -	u32 num_ips;
> -	u32 smu_msg;
>  /* SMU version information */
>  	u8 smu_program;
>  	u8 major;
> @@ -116,11 +132,7 @@ struct amd_pmc_dev {
>  	bool disable_8042_wakeup;
>  	struct amd_mp2_dev *mp2;
>  	struct stb_arg stb_arg;
> -};
> -
> -struct amd_pmc_bit_map {
> -	const char *name;
> -	u32 bit_mask;
> +	const struct amd_pmc_cpu_info *cpu_info;
>  };
>  
>  struct smu_metrics {
> @@ -151,20 +163,33 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
>  void amd_mp2_stb_init(struct amd_pmc_dev *dev);
>  void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>  
> -/* List of supported CPU ids */
> -#define AMD_CPU_ID_RV			0x15D0
> -#define AMD_CPU_ID_RN			0x1630
> -#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
> -#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
> -#define AMD_CPU_ID_VG			0x1645
> -#define AMD_CPU_ID_YC			0x14B5
> -#define AMD_CPU_ID_CB			0x14D8
> -#define AMD_CPU_ID_PS			0x14E8
> -#define AMD_CPU_ID_SP			0x14A4
> -#define AMD_CPU_ID_SHP			0x153A
> -#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
> -#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
> -#define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
> +/* List of supported CPU/device IDs */
> +#define PCI_DEVICE_ID_AMD_CPU_ID_RV	0x15D0
> +#define PCI_DEVICE_ID_AMD_CPU_ID_RN	0x1630
> +#define PCI_DEVICE_ID_AMD_CPU_ID_PCO	PCI_DEVICE_ID_AMD_CPU_ID_RV
> +#define PCI_DEVICE_ID_AMD_CPU_ID_CZN	PCI_DEVICE_ID_AMD_CPU_ID_RN
> +#define PCI_DEVICE_ID_AMD_CPU_ID_VG	0x1645
> +#define PCI_DEVICE_ID_AMD_CPU_ID_YC	0x14B5
> +#define PCI_DEVICE_ID_AMD_CPU_ID_CB	0x14D8
> +#define PCI_DEVICE_ID_AMD_CPU_ID_PS	0x14E8
> +#define PCI_DEVICE_ID_AMD_CPU_ID_SP	0x14A4
> +#define PCI_DEVICE_ID_AMD_CPU_ID_SHP	0x153A
> +
> +/* Backward compatibility aliases */
> +#define AMD_CPU_ID_RV		PCI_DEVICE_ID_AMD_CPU_ID_RV
> +#define AMD_CPU_ID_RN		PCI_DEVICE_ID_AMD_CPU_ID_RN
> +#define AMD_CPU_ID_PCO		PCI_DEVICE_ID_AMD_CPU_ID_PCO
> +#define AMD_CPU_ID_CZN		PCI_DEVICE_ID_AMD_CPU_ID_CZN
> +#define AMD_CPU_ID_VG		PCI_DEVICE_ID_AMD_CPU_ID_VG
> +#define AMD_CPU_ID_YC		PCI_DEVICE_ID_AMD_CPU_ID_YC
> +#define AMD_CPU_ID_CB		PCI_DEVICE_ID_AMD_CPU_ID_CB
> +#define AMD_CPU_ID_PS		PCI_DEVICE_ID_AMD_CPU_ID_PS
> +#define AMD_CPU_ID_SP		PCI_DEVICE_ID_AMD_CPU_ID_SP
> +#define AMD_CPU_ID_SHP		PCI_DEVICE_ID_AMD_CPU_ID_SHP
> +
> +#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT		0x1507
> +#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT		0x1122
> +#define PCI_DEVICE_ID_AMD_MP2_STB		0x172c
>  
>  int amd_stb_s2d_init(struct amd_pmc_dev *dev);
>  int amd_stb_read(struct amd_pmc_dev *dev, u32 *buf);
> 

-- 
 i.

