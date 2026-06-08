Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC23B4423
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910328; cv=none; b=g8wG9NCDbIokI8V1SHkF36Y9I4Mduho1dHfNpNHNTdysr3Kr90GKuDcGXay9fVAcQ6chE7On7Xma8Hfh3YZ1DawD+1TxFNbisXOp9BKNhB5wAebQtPfXkndG+GRWkRar3e7ynR163AHYG/vFTJYuZEMNFzqA3hUhS8K0kXWjLc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910328; c=relaxed/simple;
	bh=2lDYG5PZr5hihykDa79LUT7Yu6wH98cLFcdyTNrHWU0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CM2Hn2RU9soM/WUQ31enkDXaw4CCXxLn5Zlgp0bEb8Xmq0EIFRFf0Gqqzo5+2j6oxLL7bxa+9Q3u6p3gQMBDZIVMadyvt9EdhvxLlTebQ31Fqk1ponCqM1mPmkuMpzCKOSojollqO/VUKDX3wfuzC2dl8bnTEig3dvaIHzrlMVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmGZzyAI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmGZzyAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780910327; x=1812446327;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2lDYG5PZr5hihykDa79LUT7Yu6wH98cLFcdyTNrHWU0=;
  b=BmGZzyAIJbTfBav0T7j/++8S8g58vjq/KdtPbjODuyvNOEOxR/HvIMfC
   emObngLNbXpBxFGMGkYTVYOjJwUN8/CiVu8X0PnjgPDsSS8p6nschu7qf
   mhUdccdvLV6gZnsUppLh+VWf+zs7mF3PuZIDEFoFj8ejoPlOenX/8DRlp
   W0zTjIMwMQvd4CZel9ZRixf86MotWsjGkldg7cBSFc5hLwDA40yR0DDho
   Hlfrn1+ReOMgR+N1W403qj9L7o9vKTOmHsr8z0iSPT3i5cYT8k/dGnrLO
   WJPHmb6+Bz+PAwIZ+xeSpvq2HX/evf0+7M6uEq1OG42sK4hjOgGx66bLl
   Q==;
X-CSE-ConnectionGUID: a5wRy4p+TVe1K6h99VPE6g==
X-CSE-MsgGUID: H9OWlJgHQvSe4jlCCsRRdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="107081900"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="107081900"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 02:18:47 -0700
X-CSE-ConnectionGUID: yqbXB29sQVmXBJOwAzbegw==
X-CSE-MsgGUID: XkQsdjnwQumLP+KsyKW2WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="275693406"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 02:18:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jun 2026 12:18:40 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmc: Add PMC driver support for
 AMD 1Ah M80H SoC
In-Reply-To: <20260601112103.1690951-3-Shyam-sundar.S-k@amd.com>
Message-ID: <13db00fa-ec6b-4de7-d5ec-c9d9895af7d4@linux.intel.com>
References: <20260601112103.1690951-1-Shyam-sundar.S-k@amd.com> <20260601112103.1690951-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Jun 2026, Shyam Sundar S K wrote:

> The 1Ah M80H SoC uses a different set of SMU mailbox register offsets
> compared to the existing 1Ah variants: message at 0xA10, argument at
> 0xA18, and response at 0xA14.
> 
> Add amd_1ah_m80_cpu_info with these offsets, wire it into the PCI ID
> table via PCI_DEVICE_DATA(), handle it in amd_pmc_set_cpu_info() and
> amd_pmc_idlemask_read(), and add the corresponding ACPI ID AMDI000C.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 15 +++++++++++++++
>  drivers/platform/x86/amd/pmc/pmc.h |  6 ++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 6c7fa80c7f09..8da988016661 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -131,6 +131,15 @@ static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info = {
>  	.os_hint	= MSG_OS_HINT_RN,
>  };
>  
> +static const struct amd_pmc_cpu_info amd_1ah_m80_cpu_info = {
> +	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_80H,
> +	.smu_arg	= AMD_PMC_REGISTER_ARG_1AH_80H,
> +	.smu_rsp	= AMD_PMC_REGISTER_RSP_1AH_80H,
> +	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
> +	.ips_ptr	= soc15_ip_blk,
> +	.os_hint	= MSG_OS_HINT_RN,
> +};
> +
>  static bool disable_workarounds;
>  module_param(disable_workarounds, bool, 0644);
>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
> @@ -172,6 +181,9 @@ static void amd_pmc_set_cpu_info(struct amd_pmc_dev *dev)
>  		else
>  			info = &amd_1ah_cpu_info;
>  		break;
> +	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
> +		info = &amd_1ah_m80_cpu_info;

This shouldn't be necessary if you get it directly from the match.

> +		break;
>  	default:
>  		dev_err(dev->dev, "Unknown CPU ID: 0x%x\n", dev->cpu_id);
>  		return;
> @@ -415,6 +427,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>  		break;
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
>  		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);

I guess the scratch register too could come from the info, you just 
need to handle the AMD_CPU_ID_CZN version check prior to that.


I really like how clean adding new platforms becomes with the info 
infrastructure in place. Thanks.

>  		break;
>  	default:
> @@ -763,6 +776,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
>  	{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, NULL) },
>  	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
>  	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
> +	{ PCI_DEVICE_DATA(AMD, 1AH_M80H_ROOT, &amd_1ah_m80_cpu_info) },
>  	{ }
>  };
>  
> @@ -882,6 +896,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
>  	{"AMDI0009", 0},
>  	{"AMDI000A", 0},
>  	{"AMDI000B", 0},
> +	{"AMDI000C", 0},
>  	{"AMD0004", 0},
>  	{"AMD0005", 0},
>  	{ }
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 0fd0ced21831..0a3b81944920 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -22,6 +22,11 @@
>  /* SMU communication registers for 1Ah 20h SoC */
>  #define AMD_PMC_REGISTER_MSG_1AH_20H	0x938
>  
> +/* SMU communication registers for 1Ah 80h SoC */
> +#define AMD_PMC_REGISTER_MSG_1AH_80H	0xA10
> +#define AMD_PMC_REGISTER_ARG_1AH_80H	0xA18
> +#define AMD_PMC_REGISTER_RSP_1AH_80H	0xA14
> +
>  /* PMC Scratch Registers */
>  #define AMD_PMC_SCRATCH_REG_CZN		0x94
>  #define AMD_PMC_SCRATCH_REG_YC		0xD14
> @@ -189,6 +194,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>  
>  #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT		0x1507
>  #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT		0x1122
> +#define PCI_DEVICE_ID_AMD_1AH_M80H_ROOT		0x115b
>  #define PCI_DEVICE_ID_AMD_MP2_STB		0x172c
>  
>  int amd_stb_s2d_init(struct amd_pmc_dev *dev);
> 

-- 
 i.

