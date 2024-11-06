Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AD81DD0C8
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888102; cv=none; b=CeE7hyy1NQiytIDM2xomXm3mzFiqOirBBtQeAjDZrC2uj3gKHsDKhG7LmlwEShMXx0KE7pdFbpXPCkGzM7HZiGwyZ6qZiQBfMdQuOVGSdZmgKiP16TYPgujoao5HbSol3p15p56E2yh+fmgsubhTuRtL35gJfUFCwVQIkuSsVug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888102; c=relaxed/simple;
	bh=y3CqLpVYNtt1c0rZhoz2dcN7VyiBu8mNoViOrtuJ5/A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kG9w8604VAyznJGS87RxZE/xrA/mqogKkXe1I3RhGd1KAJHpPBp6TvoirBCk0erjQo/cLQfB/upf+9psEwqxEDFR9fG2oGJfROa44aMz5r7Eex6AbfCqFlePLq3X97exkjik03lOeZZFmxA3kMJN1GEbBB+CwPF5KPDy4mKX4rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOt7AwiJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOt7AwiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730888100; x=1762424100;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=y3CqLpVYNtt1c0rZhoz2dcN7VyiBu8mNoViOrtuJ5/A=;
  b=ZOt7AwiJay7gk8Av5T2saddPba7baEN3Md3gmbfhaI/yJDS7E3XEyme4
   UiYIOKxgYOofaPDVitghyKpVNv3Xnarg9Qq9DIQOd/JgF4VQ9Rj6PavPn
   2x/sNtbQzYtR9zB5Y+4/gTDCn/pxKzeO+WaggkvxJEaLUlPJ7fe5rl7bb
   OUDSBpCwf1H+ipYMN9mU6iDM7x5Aw68+TYKWMDIAo/6nRVMMdpRsIFLib
   zJ4kZ03KhnGGQ7kpQ5oHRKzF0Gz1CmplAMA7BZwWK1JQewXNKvzX393d3
   CqOZAASjT3eUABVWRZBo/0jvf/M1umUS0BI2E7tryaVoLThR5Ugw1n73M
   w==;
X-CSE-ConnectionGUID: P/8BsGpGSlGJDjx1hVZtTA==
X-CSE-MsgGUID: 8U+4nLixRPiewI2TqVV6tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30859732"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30859732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:15:00 -0800
X-CSE-ConnectionGUID: VQNXxIonTKifDl/y+Rfwpw==
X-CSE-MsgGUID: kM4yXjSTT1GyebXS1VX0Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="89586672"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:14:59 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 Nov 2024 12:14:55 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 09/13] platform/x86/amd/pmc: Update IP information
 structure for newer SoCs
In-Reply-To: <20241105173637.733589-10-Shyam-sundar.S-k@amd.com>
Message-ID: <0a57bfa4-abd8-15eb-222b-41d3052c69de@linux.intel.com>
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com> <20241105173637.733589-10-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Nov 2024, Shyam Sundar S K wrote:

> The latest AMD processors include additional IP blocks that must be turned
> off before transitioning to low power. PMFW provides an interface to
> retrieve debug information from each IP block, which is useful for
> diagnosing issues if the system fails to enter or exit low power states,
> or for profiling which IP block takes more time. Add support for using
> this information within the driver.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 43 +++++++++++++++++++++++++++---
>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>  2 files changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 1f0ddf5440c3..5ca97712ef44 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -94,6 +94,35 @@ struct amd_pmc_bit_map {
>  	u32 bit_mask;
>  };
>  
> +static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
> +	{"DISPLAY",     BIT(0)},
> +	{"CPU",         BIT(1)},
> +	{"GFX",         BIT(2)},
> +	{"VDD",         BIT(3)},
> +	{"VDD_CCX",     BIT(4)},
> +	{"ACP",         BIT(5)},
> +	{"VCN_0",       BIT(6)},
> +	{"VCN_1",       BIT(7)},
> +	{"ISP",         BIT(8)},
> +	{"NBIO",        BIT(9)},
> +	{"DF",          BIT(10)},
> +	{"USB3_0",      BIT(11)},
> +	{"USB3_1",      BIT(12)},
> +	{"LAPIC",       BIT(13)},
> +	{"USB3_2",      BIT(14)},
> +	{"USB4_RT0",	BIT(15)},
> +	{"USB4_RT1",	BIT(16)},
> +	{"USB4_0",      BIT(17)},
> +	{"USB4_1",      BIT(18)},
> +	{"MPM",         BIT(19)},
> +	{"JPEG_0",      BIT(20)},
> +	{"JPEG_1",      BIT(21)},
> +	{"IPU",         BIT(22)},
> +	{"UMSCH",       BIT(23)},
> +	{"VPE",         BIT(24)},
> +	{}

As Mario mentioned, please do ARRAY_SIZE() conversion first (which was 
also the order I asked for).

> +};
> +
>  static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>  	{"DISPLAY",	BIT(0)},
>  	{"CPU",		BIT(1)},
> @@ -162,14 +191,22 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>  	case AMD_CPU_ID_CB:
>  		dev->num_ips = 12;
>  		dev->smu_msg = 0x538;
> +		dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;

For consistency with num_ips, I'd call it ip_ptr or ips_ptr.

-- 
 i.

>  		break;
>  	case AMD_CPU_ID_PS:
>  		dev->num_ips = 21;
>  		dev->smu_msg = 0x538;
> +		dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
>  		break;
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -		dev->num_ips = 22;
> +		if (boot_cpu_data.x86_model == 0x70) {
> +			dev->num_ips = 25;
> +			dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk_v2;
> +		} else {
> +			dev->num_ips = 22;
> +			dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
> +		}
>  		dev->smu_msg = 0x938;
>  		break;
>  	}
> @@ -337,8 +374,8 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>  
>  	seq_puts(s, "\n=== Active time (in us) ===\n");
>  	for (idx = 0 ; idx < dev->num_ips ; idx++) {
> -		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
> -			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
> +		if (dev->ptr[idx].bit_mask & dev->active_ips)
> +			seq_printf(s, "%-8s : %lld\n", dev->ptr[idx].name,
>  				   table.timecondition_notmet_lastcapture[idx]);
>  	}
>  
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index be3e6b35433c..32b02ba95eeb 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -57,6 +57,7 @@ struct amd_pmc_dev {
>  	bool disable_8042_wakeup;
>  	struct amd_mp2_dev *mp2;
>  	struct stb_arg stb_arg;
> +	struct amd_pmc_bit_map *ptr;
>  };
>  
>  void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
> 
