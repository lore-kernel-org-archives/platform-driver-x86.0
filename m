Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFAF25B097
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 12:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453418; cv=none; b=nL+zbwd+NNeOpt1HQF8e6sCCa+DLRN3P783Wi6Y+8qRAg/8PxcNy/v/KwApiABsWVdHr4E6rhHpVbf+VUaWJmnjzHQ0QZLLeZ8T9vrWCZd6a+prDmzMbrbNFSZGf+/y16ztfPAfQaI9gRv66pXP3WlwUoHrasDCR2todiCv+G1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453418; c=relaxed/simple;
	bh=lAt8Dk7KjKLjrKrtHwqyRSNRHf2qcgyg3PcVCDFfDRU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FEkO/TY7/Xft5MBY0LiCiwfIEzb+A5DNlSA2GFDTG/JwqwlbMns2+MR55vAaNZPE46jP81j+8GAFfR7dUq7SyVvWwtVfi/q+lX8cRE+tseHE+1VPl1K/HNMMsXwDQUY7apCfJiwPKC2CoC8vd9lPq10MfKo96+GrrgfBCqyyIMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elj9WsfQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elj9WsfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779453417; x=1810989417;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lAt8Dk7KjKLjrKrtHwqyRSNRHf2qcgyg3PcVCDFfDRU=;
  b=elj9WsfQCiZuGTXN9XaayW0L2/we1teWKxjN9TzIYojuwqtPAw3mFS8o
   3KGtm+YB8K7IgUgSqp30VLRHtDvlihBVxKN3RA4buOHGbY5pBMyzJvt7V
   85oJfw8+qVYhYa/HSiuPYwwLOxztn1usY3zjL2TcpytILONubhE8qUs0f
   BxMLloJ0a5VKkns3uiU4rBVB99AGEZdp7OpUyBRNVxwb2agBxf4vWwzBG
   i+TjDKZLaGdOhrEqW93LkO4zppJaaYPAF2e3p9J5rynJGJzRrUJQAbhQ/
   sgOiDISsibQ48YNJC0MxPzc+V/3CYB5qKTM2hW6Ft5BaWRu71wJg0fi2Z
   w==;
X-CSE-ConnectionGUID: GpiHdn3zSM29AynQXUExkw==
X-CSE-MsgGUID: /DJ31eUGQoGr4l9Gvn54QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="82960282"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="82960282"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 05:36:56 -0700
X-CSE-ConnectionGUID: eikdhoSSTF+M2h+l6QOyuQ==
X-CSE-MsgGUID: 95uv8+NaRci6zDaf6UQZZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="245972377"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 05:36:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 15:36:50 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH 2/5] platform/x86/amd/pmc: Add SMU mailbox offset retrieval
 for different CPU families
In-Reply-To: <20260520191149.773196-3-Shyam-sundar.S-k@amd.com>
Message-ID: <ec3c0d30-f852-7329-c53b-e999776adf6b@linux.intel.com>
References: <20260520191149.773196-1-Shyam-sundar.S-k@amd.com> <20260520191149.773196-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 May 2026, Shyam Sundar S K wrote:

> Different AMD CPU families have different SMU mailbox register offsets.
> Add a helper function amd_pmc_get_smu_mb() to populate the appropriate
> SMU message offset based on the CPU ID during probe.
> 
> This infrastructure will help support future features that require
> communication with the SMU through the correct mailbox address.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 7200f19088fe..7c80fb445138 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -101,6 +101,24 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
>  	iowrite32(val, dev->regbase + reg_offset);
>  }
>  
> +static void amd_pmc_get_smu_mb(struct amd_pmc_dev *dev)
> +{
> +	switch (dev->cpu_id) {
> +	case AMD_CPU_ID_PCO:
> +	case AMD_CPU_ID_RN:
> +	case AMD_CPU_ID_VG:
> +	case AMD_CPU_ID_YC:
> +	case AMD_CPU_ID_CB:
> +	case AMD_CPU_ID_PS:
> +		dev->smu_msg = 0x538;
> +		break;
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +		dev->smu_msg = 0x938;
> +		break;
> +	}
> +}
> +
>  static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>  {
>  	switch (dev->cpu_id) {
> @@ -111,12 +129,10 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>  	case AMD_CPU_ID_CB:
>  		dev->num_ips = 12;
>  		dev->ips_ptr = soc15_ip_blk;
> -		dev->smu_msg = 0x538;
>  		break;
>  	case AMD_CPU_ID_PS:
>  		dev->num_ips = 21;
>  		dev->ips_ptr = soc15_ip_blk;
> -		dev->smu_msg = 0x538;
>  		break;
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> @@ -127,7 +143,6 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>  			dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
>  			dev->ips_ptr = soc15_ip_blk;
>  		}
> -		dev->smu_msg = 0x938;
>  		break;
>  	}
>  }
> @@ -782,6 +797,9 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	/* Get num of IP blocks within the SoC */
>  	amd_pmc_get_ip_info(dev);
>  
> +	/* Populate SMU msg offset */
> +	amd_pmc_get_smu_mb(dev);
> +
>  	platform_set_drvdata(pdev, dev);
>  	if (IS_ENABLED(CONFIG_SUSPEND)) {
>  		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);

Could these difference should be recorded into an info struct so we don't 
need to make a function for each difference?

-- 
 i.

