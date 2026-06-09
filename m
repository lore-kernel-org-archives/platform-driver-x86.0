Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573BC2D8796
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993777; cv=none; b=fa0kVYrYOKesEuVwhZWFC2YgGopD5L2GwxT2RBIAREDl6VHpv2rtT8LMAiQaGafrd9JubBUHGadEwzSboCcD8s+Pqp5Uw1QTne8910aenoau5rCLtiwwrJCDafmCaWPFUmPd0T6pSV/pIjqjSlzoSvhFDjXnHBLCIBLS65KP+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993777; c=relaxed/simple;
	bh=1V65nasJhgszTT24pv6sFqC7LiZqjO/LnrjHua/H9L0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=T+oGqpMEciK3IKPfJf1bTMzb7AvFKbUZCShCEO7qqnOikOh8VJiAVG2S7IRYRLdCXuzyPyYngC85ubY0+ROs0ZLrTW8uCJ+ro/V+YcdYa61AIRzry3AwhsvG9wW2FFzoBjpSqsZtXC/O7wr30uqsOfZsegBwJOE9ezKO0AEz0FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=boBpQDqC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="boBpQDqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780993774; x=1812529774;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1V65nasJhgszTT24pv6sFqC7LiZqjO/LnrjHua/H9L0=;
  b=boBpQDqCi8XWkcf1zkHIZekWVh4aqfdN2JuKUAfz85L5wlwyFCvGSKu+
   N7e52mDPsafFOjcYbCdk0L+Hc41ohkYFs/Ri3Xt1dGsShYeD2kefXh8bx
   r7eV49bMuPHf9SaxQJMR4Vi1Qp6+FlMOF9jl9NlamQbLOAeO6Y5VBsHi/
   4KQpNDl0ADXwgXZEryEbo8d+eJIeBZ+mRhqHYsjPKtQdOXlXpsok9n93v
   YH1oyH1xQN78KCFJpjtrRx7cf/ZarB4w7T47hAceaDBDbKibhdQT5jKEb
   tvzplUdr+BVHjuERdjBPxU9YNXhi++zgnSco9mdecntDGpfRK7asB5QLD
   w==;
X-CSE-ConnectionGUID: wgqlan7cS5mvY8vzT7mhjA==
X-CSE-MsgGUID: vtvGQiZ7Rymw6XKkieGxXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="93234630"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="93234630"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 01:29:33 -0700
X-CSE-ConnectionGUID: EOefjhHFSG+Zd0cml1h2Tw==
X-CSE-MsgGUID: h8FvLxLWSO2IdIEEcUgJrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="245648669"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 01:29:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jun 2026 11:29:26 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 1/2] platform/x86/amd/pmc: Use per-SoC cpu_info struct
 for SMU mailbox and IP info
In-Reply-To: <20260609073543.2388987-2-Shyam-sundar.S-k@amd.com>
Message-ID: <4c372b4d-c694-6a9a-3a60-99b079be0f91@linux.intel.com>
References: <20260609073543.2388987-1-Shyam-sundar.S-k@amd.com> <20260609073543.2388987-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Jun 2026, Shyam Sundar S K wrote:

> Replace the scattered per-field assignments in amd_pmc_get_ip_info() with
> a single amd_pmc_cpu_info struct capturing all SoC-specific parameters
> such as SMU offsets, IP block table, and OS hint.
> 
> Define static const instances per SoC variant and embed them as driver_data
> in the PCI ID table via PCI_DEVICE_DATA(). Consolidate pci_match_id() into
> amd_pmc_set_cpu_info(), which assigns driver_data directly to cpu_info,
> the switch falls through only for 1Ah M20H/M60H variants requiring
> boot_cpu_data.x86_model detection to distinguish the M70 sub-variant.
> 
> Add scratch_reg to amd_pmc_cpu_info and populate it for each SoC
> variant, allowing amd_pmc_idlemask_read() to drop its cpu_id switch
> in favour of a single cpu_info->scratch_reg lookup.
> 
> Remove amd_pmc_get_os_hint() and use cpu_info->os_hint directly at call
> sites and rename AMD_CPU_ID_* to PCI_DEVICE_ID_AMD_CPU_ID_* with backward
> compatibility aliases.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 216 ++++++++++++++++-------------
>  drivers/platform/x86/amd/pmc/pmc.h |  70 +++++++---
>  2 files changed, 171 insertions(+), 115 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index cae3fcafd4d7..3ba50ebcc431 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -85,6 +85,83 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>  	{"VPE",		BIT(21)},
>  };
>  
> +/* CPU info structures for different SoC variants */
> +static const struct amd_pmc_cpu_info amd_pco_cpu_info = {
> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
> +	.num_ips	= 12,
> +	.scratch_reg	= 0,

There's no need to 0 init, it's the default value.

> +	.ips_ptr	= soc15_ip_blk,
> +	.os_hint	= MSG_OS_HINT_PCO,
> +};
> +
> +static const struct amd_pmc_cpu_info amd_czn_cpu_info = {
> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
> +	.num_ips	= 12,
> +	.scratch_reg	= AMD_PMC_SCRATCH_REG_CZN,
> +	.ips_ptr	= soc15_ip_blk,
> +	.os_hint	= MSG_OS_HINT_RN,
> +};
> +
> +static const struct amd_pmc_cpu_info amd_rn_cpu_info = {
> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
> +	.num_ips	= 12,
> +	.scratch_reg	= AMD_PMC_SCRATCH_REG_YC,

Previously, there was no case AMD_CPU_ID_RN: in amd_pmc_idlemask_read() 
but since the PCI IDs are overloaded, it used CZN's scratch reg.

(sashiko found this inconsistency in the change, but assuming this new 
scratch_reg value is correct, the current code is using a wrong value.)

> +	.ips_ptr	= soc15_ip_blk,
> +	.os_hint	= MSG_OS_HINT_RN,
> +};
> +
> +static const struct amd_pmc_cpu_info amd_ps_cpu_info = {
> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
> +	.num_ips	= 21,
> +	.scratch_reg	= AMD_PMC_SCRATCH_REG_YC,
> +	.ips_ptr	= soc15_ip_blk,
> +	.os_hint	= MSG_OS_HINT_RN,
> +};
> +
> +static const struct amd_pmc_cpu_info amd_1ah_cpu_info = {
> +	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_20H,
> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
> +	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
> +	.scratch_reg	= AMD_PMC_SCRATCH_REG_1AH,
> +	.ips_ptr	= soc15_ip_blk,
> +	.os_hint	= MSG_OS_HINT_RN,
> +};
> +
> +static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info = {
> +	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_20H,
> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
> +	.num_ips	= ARRAY_SIZE(soc15_ip_blk_v2),
> +	.scratch_reg	= AMD_PMC_SCRATCH_REG_1AH,
> +	.ips_ptr	= soc15_ip_blk_v2,
> +	.os_hint	= MSG_OS_HINT_RN,
> +};
> +
> +static const struct pci_device_id pmc_pci_ids[] = {
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_PCO, &amd_pco_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_RV, &amd_pco_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_RN, &amd_rn_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_CZN, &amd_czn_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_VG, &amd_rn_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_YC, &amd_rn_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_CB, &amd_rn_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_PS, &amd_ps_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_SP, NULL) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, NULL) },
> +	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
> +	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
> +	{ }
> +};
> +
>  static bool disable_workarounds;
>  module_param(disable_workarounds, bool, 0644);
>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
> @@ -101,35 +178,34 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
>  	iowrite32(val, dev->regbase + reg_offset);
>  }
>  
> -static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
> +static int amd_pmc_set_cpu_info(struct amd_pmc_dev *dev, struct pci_dev *rdev)
>  {
> +	const struct pci_device_id *id;
> +
> +	id = pci_match_id(pmc_pci_ids, rdev);
> +	if (!id)
> +		return -ENODEV;
> +
> +	if (id->driver_data) {
> +		dev->cpu_info = (const struct amd_pmc_cpu_info *)id->driver_data;
> +		return 0;
> +	}
> +
> +	/* Special case: 1Ah M20H/M60H needs x86_model detection */
>  	switch (dev->cpu_id) {

After the reorganization, this looks not yet initialized at this point.

I guess ->cpu_id could be initialized inside this function.

> -	case AMD_CPU_ID_PCO:
> -	case AMD_CPU_ID_RN:
> -	case AMD_CPU_ID_VG:
> -	case AMD_CPU_ID_YC:
> -	case AMD_CPU_ID_CB:
> -		dev->num_ips = 12;
> -		dev->ips_ptr = soc15_ip_blk;
> -		dev->smu_msg = 0x538;
> -		break;
> -	case AMD_CPU_ID_PS:
> -		dev->num_ips = 21;
> -		dev->ips_ptr = soc15_ip_blk;
> -		dev->smu_msg = 0x538;
> -		break;
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
> +		if (boot_cpu_data.x86_model == 0x70)
> +			dev->cpu_info = &amd_1ah_m70_cpu_info;
> +		else
> +			dev->cpu_info = &amd_1ah_cpu_info;
>  		break;
> +	default:
> +		dev_err(dev->dev, "Unknown CPU ID: 0x%x\n", dev->cpu_id);

Won't CPU_ID_SP and CPU_ID_SHP end up here now as the driver_data is NULL?

> +		return -ENODEV;
>  	}
> +
> +	return 0;
>  }
>  
>  static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
> @@ -296,9 +372,9 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
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
> @@ -347,32 +423,22 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>  	u32 val;
>  	int rc;
>  
> -	switch (pdev->cpu_id) {
> -	case AMD_CPU_ID_CZN:
> -		/* we haven't yet read SMU version */
> +	/* we haven't yet read SMU version */
> +	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
>  		if (!pdev->major) {
>  			rc = amd_pmc_get_smu_version(pdev);
>  			if (rc)
>  				return rc;
>  		}
> -		if (pdev->major > 56 || (pdev->major >= 55 && pdev->minor >= 37))
> -			val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
> -		else
> +		if (!(pdev->major > 56 || (pdev->major >= 55 && pdev->minor >= 37)))
>  			return -EINVAL;
> -		break;
> -	case AMD_CPU_ID_YC:
> -	case AMD_CPU_ID_CB:
> -	case AMD_CPU_ID_PS:
> -		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
> -		break;
> -	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> -	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
> -		break;
> -	default:
> -		return -EINVAL;
>  	}
>  
> +	if (!pdev->cpu_info->scratch_reg)
> +		return -EINVAL;
> +
> +	val = amd_pmc_reg_read(pdev, pdev->cpu_info->scratch_reg);
> +
>  	if (dev)
>  		pm_pr_dbg("SMU idlemask s0i3: 0x%x\n", val);
>  
> @@ -425,9 +491,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
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
> @@ -452,9 +518,9 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
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
> @@ -512,23 +578,6 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
>  	return rc;
>  }
>  
> -static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
> -{
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
> -	}
> -	return -EINVAL;
> -}
> -
>  static int amd_pmc_wa_irq1(struct amd_pmc_dev *pdev)
>  {
>  	struct device *d;
> @@ -602,7 +651,6 @@ static void amd_pmc_s2idle_prepare(void)
>  {
>  	struct amd_pmc_dev *pdev = &pmc;
>  	int rc;
> -	u8 msg;
>  	u32 arg = 1;
>  
>  	/* Reset and Start SMU logging - to monitor the s0i3 stats */
> @@ -617,8 +665,7 @@ static void amd_pmc_s2idle_prepare(void)
>  		}
>  	}
>  
> -	msg = amd_pmc_get_os_hint(pdev);
> -	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, false);
> +	rc = amd_pmc_send_cmd(pdev, arg, NULL, pdev->cpu_info->os_hint, false);
>  	if (rc) {
>  		dev_err(pdev->dev, "suspend failed: %d\n", rc);
>  		return;
> @@ -659,10 +706,8 @@ static void amd_pmc_s2idle_restore(void)
>  {
>  	struct amd_pmc_dev *pdev = &pmc;
>  	int rc;
> -	u8 msg;
>  
> -	msg = amd_pmc_get_os_hint(pdev);
> -	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, false);
> +	rc = amd_pmc_send_cmd(pdev, 0, NULL, pdev->cpu_info->os_hint, false);
>  	if (rc)
>  		dev_err(pdev->dev, "resume failed: %d\n", rc);
>  
> @@ -709,22 +754,6 @@ static const struct dev_pm_ops amd_pmc_pm = {
>  	.suspend = amd_pmc_suspend_handler,
>  };
>  
> -static const struct pci_device_id pmc_pci_ids[] = {
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
> -	{ }
> -};
> -
>  static int amd_pmc_probe(struct platform_device *pdev)
>  {
>  	struct amd_pmc_dev *dev = &pmc;
> @@ -736,11 +765,15 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  
>  	dev->dev = &pdev->dev;
>  	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> -	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
> +	if (!rdev) {
>  		err = -ENODEV;
>  		goto err_pci_dev_put;
>  	}
>  
> +	err = amd_pmc_set_cpu_info(dev, rdev);
> +	if (err)
> +		goto err_pci_dev_put;
> +
>  	dev->cpu_id = rdev->device;
>  	if (dev->cpu_id == AMD_CPU_ID_SP || dev->cpu_id == AMD_CPU_ID_SHP) {
>  		dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
> @@ -778,9 +811,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
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
> index fe3f53eb5955..4c3a4410790e 100644
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
> @@ -90,6 +94,22 @@ struct stb_arg {
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
> +	u32 scratch_reg;
> +	const struct amd_pmc_bit_map *ips_ptr;
> +	u8 os_hint;
> +};
> +
>  struct amd_pmc_dev {
>  	void __iomem *regbase;
>  	void __iomem *smu_virt_addr;
> @@ -99,9 +119,6 @@ struct amd_pmc_dev {
>  	u32 cpu_id;
>  	u32 dram_size;
>  	u32 active_ips;
> -	const struct amd_pmc_bit_map *ips_ptr;
> -	u32 num_ips;
> -	u32 smu_msg;
>  /* SMU version information */
>  	u8 smu_program;
>  	u8 major;
> @@ -116,11 +133,7 @@ struct amd_pmc_dev {
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
> @@ -151,20 +164,33 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
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

sashiko found an interesting issue related to these (it seems 
pre-existing)...

If the PCI ID is same, the match can never return the second entry.

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
