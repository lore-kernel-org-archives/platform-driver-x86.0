Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E30D3C553F;
	Fri, 22 May 2026 11:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448182; cv=none; b=GaCbOgWHw3RcE0duehCB7WVv3r0A+qMnI0xr0zJtumr+E64/e8lveedtPP0b/25GH50XRjs155S5oZg1/5H9Tlwx1gpTo2623aG+h/t69Z+0pMIIPvY9Cg1j1hxsoCXzr4swXO+6M0df4jT4qDjxHNNUdRL5gfhptDP3N0lbPSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448182; c=relaxed/simple;
	bh=RYSbaRb5o1TsCmDk7m1wfi0iLe+cG2ODOqW/gtEA5Sw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=O4r4z+ZOPfdpEOXzJ6jnnFmwGUnnO7sW1aUseJs+ylWngIQTXBYxQMVgZsnOYrRm0Elt8KYY/U1DPuVofQS/AhhEDF+EZw88TmgqxCelsyi2T5Uv3P5uCJuVzWSFznj6bP9WfSVg0Mu1dgzCKIM0kVraVo+WNJQPLv+kslHCPLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6pVWnBO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6pVWnBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779448181; x=1810984181;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RYSbaRb5o1TsCmDk7m1wfi0iLe+cG2ODOqW/gtEA5Sw=;
  b=J6pVWnBOQZ3KEA6PLAneh2tzw/QTH42cMCa6U1acZ47/9UGXVJp2FVjI
   fMcPwJcFCO4mwVVH/v674HO/ovxtaGwuNPazN1cm0PlyUOQhGVI8tMj3/
   BvK8sul0FlGAY4VszREYLkspz6m5JdhIk2NpMK9zFym/BWLZHAaAi0gfe
   +J5bkHSD+j20H5v0u6s3eFE+KLqI5jTF7Hr68lkqIHupJnrtibztR9rgN
   mDr3Kq7sxGstm80hdN8q65Ny0A29uMd4tjFtpqGquKVT+OaurjKi39x8i
   oPdg1SYNxb3E/uLOxBPlOlh92ZA2WGc/OC6EfbTWOnFwoV8BJSlmh29EW
   g==;
X-CSE-ConnectionGUID: /QyY5i97TLGr+gXekY6mIw==
X-CSE-MsgGUID: bdoihPRWQoGLBPOmnikefA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="83995147"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="83995147"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:09:41 -0700
X-CSE-ConnectionGUID: jLEP+zZbS2S4udvwEzbjfQ==
X-CSE-MsgGUID: 7OkyjZucRDuZYF3ZxcwOZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="264707639"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:09:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 14:09:33 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Suma Hegde <suma.hegde@amd.com>, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v3 2/7] platform/x86/amd/hsmp: Add UAPI structures for
 Family 1Ah Model 50h-5Fh metrics table
In-Reply-To: <20260517151211.415627-3-muralidhara.mk@amd.com>
Message-ID: <81f5f74f-a11b-1231-f521-58d4648842f8@linux.intel.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com> <20260517151211.415627-3-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 17 May 2026, Muralidhara M K wrote:

> Define the UAPI structures hsmp_metric_table_zen6_iod,
> hsmp_metric_table_zen6_ccd and the top-level hsmp_metric_table_zen6
> to describe the per-IOD and per-CCD metrics layout for AMD Family 1Ah
> Model 50h-5Fh processors (HSMP protocol version 7).  These structures
> allow userspace tools to interpret the raw metric table binary exposed
> through the HSMP character device.
> 
> Driver enablement for protocol version 7 is added in a follow-up patch.
> 
> Reviewed-by: Suma Hegde <suma.hegde@amd.com>
> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
> Changes:
> v1->v2: Split the change
> v2->v3: Move proto version check to seperate patch
> 
>  arch/x86/include/uapi/asm/amd_hsmp.h | 88 ++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> index 603d62f8d4da..da3e3bbfa33e 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -575,6 +575,94 @@ struct hsmp_metric_table {
>  	__u32 gfxclk_frequency[8];
>  };
>  
> +#define F1A_M50_M5F_MAX_CORES_PER_CCD_32	32
> +#define F1A_M50_M5F_MAX_FREQ_TABLE_SIZE		4
> +#define F1A_M50_M5F_MAX_XGMI			8
> +#define F1A_M50_M5F_MAX_PCIE			8
> +#define F1A_M50_M5F_MAX_CCD			8

Should have a prefix.

> +
> +/* Metrics table (supported only with proto version 7) */
> +struct hsmp_metric_table_zen6_iod {
> +	__u32 num_active_ccds;
> +	__u32 accumulation_counter;
> +
> +	/* TEMPERATURE */
> +	__u64 max_socket_temperature_acc;
> +
> +	/* POWER */
> +	__u32 socket_power_limit;
> +	__u32 max_socket_power_limit;
> +	__u64 socket_power_acc;
> +	__u64 core_power_acc;
> +	__u64 uncore_power_acc;
> +
> +	/* ENERGY */
> +	__u64 timestamp;
> +	__u64 socket_energy_acc;
> +	__u64 core_energy_acc;
> +	__u64 uncore_energy_acc;
> +
> +	/* FREQUENCY */
> +	__u64 fclk_frequency_acc;
> +	__u64 uclk_frequency_acc;
> +	__u64 ddr_rate_acc;
> +	__u64 lclk_frequency_acc[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +
> +	/* FREQUENCY RANGE */
> +	__u32 fclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +	__u32 uclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +	__u32 ddr_rate_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +	__u32 max_df_pstate_range;
> +	__u32 min_df_pstate_range;
> +	__u32 lclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +	__u32 max_lclk_dpm_range;
> +	__u32 min_lclk_dpm_range;
> +
> +	/* XGMI */
> +	__u64 xgmi_bit_rate[F1A_M50_M5F_MAX_XGMI];
> +	__u64 xgmi_read_bandwidth[F1A_M50_M5F_MAX_XGMI];
> +	__u64 xgmi_write_bandwidth[F1A_M50_M5F_MAX_XGMI];
> +
> +	/* ACTIVITY */
> +	__u64 socket_c0_residency_acc;
> +	__u64 socket_df_cstate_residency_acc;
> +	__u64 dram_read_bandwidth_acc;
> +	__u64 dram_write_bandwidth_acc;
> +	__u32 max_dram_bandwidth;
> +	__u64 pcie_bandwidth_acc[F1A_M50_M5F_MAX_PCIE];
> +
> +	/* THROTTLERS */
> +	__u32 prochot_residency_acc;
> +	__u32 ppt_residency_acc;
> +	__u32 thm_residency_acc;
> +	__u32 vrhot_residency_acc;
> +	__u32 cpu_tdc_residency_acc;
> +	__u32 soc_tdc_residency_acc;
> +	__u32 io_mem_tdc_residency_acc;
> +	__u32 fit_residency_acc;
> +};
> +
> +struct hsmp_metric_table_zen6_ccd {
> +	__u32 core_apicid_of_thread0[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +	__u64 core_c0[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +	__u64 core_cc1[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +	__u64 core_cc6[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +	__u64 core_frequency[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +	__u64 core_frequency_effective[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +	__u64 core_power[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +};
> +
> +/*
> + * Metrics table for Family 0x1A, Models 0x50 to 0x5F, table version 0x00700000
> + *
> + * Future processors within the same family and model may support a
> + * variable number of CCDs and cores

How is the correct number of CCDs then known?

If it's through num_active_ccds, I question if hsmp_metric_table_zen6 
struct hierarchy is correct as then something under iod seems to 
determine how to interpret the ccd[] array.

> + */
> +struct hsmp_metric_table_zen6 {
> +	struct hsmp_metric_table_zen6_iod iod;
> +	struct hsmp_metric_table_zen6_ccd ccd[F1A_M50_M5F_MAX_CCD];
> +};
> +
>  /* Reset to default packing */
>  #pragma pack()
>  
> 

-- 
 i.

