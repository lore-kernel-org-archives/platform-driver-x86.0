Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8297215B0EC
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 19:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760469849; cv=none; b=hP+8PhOfjYPzZjyTbFQ+xdAfUU5SMWj4K14f5Ugg40RlqBLqSOEtoCxxAMk4TrJK1OIBXqBhWbDqnPqBhNZVYjQkm4Pq9DfqYiTny1QrhQm209lDssgOKL39DP3RQBX+tPzQ9RDqhHdS0ykprFduxl0+6R8uA1nzweEqnS2lbP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760469849; c=relaxed/simple;
	bh=dCxTkikJ/4hsArTQOtpHlXCDNekVFz82Gp2jmdjph7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgLj161iuekcWInBB0sE9Da0sVZ0k0jIwag3Mgb8XJ48GFJK2I2Wh7P2FfePMqZ9S4cJGlF1BmG64pb6oHv7PglXippNhf2VYVhsYQ/rRw4h+Fz6VExJwcQE7nnJIgawmwIM/OgGoh/wFja+tVJ2+z82vWKD9HYUULKX69aw38s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isge8QNK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isge8QNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760469847; x=1792005847;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dCxTkikJ/4hsArTQOtpHlXCDNekVFz82Gp2jmdjph7s=;
  b=isge8QNKPm1DapkFCzJIQFoSlS4xnXTWtvE2GKqZOwD1V3/uS0fNF+fP
   gjHLQSa5ubNBj9K/oDeoZalnyT3ePYcGR5bsvGtWwRj5AJAt3ZNBelPsX
   CFprCn+2fByBaDyrpu/yknAcHdHDm8yJGzghUEjt5HU7D97vYNauYaclJ
   MbpnT6r1ClquolXwKxBA/9PNo51Y3ysYBy23HLO2ttYTg7WxrmvooGZri
   nvalMTWisggw/nD/f1ZCJe3ebOWzrX0OFzIGWwBOc4dBn3S1MJNeohi81
   MKDvAvQqTqEFM5G5g8ELkXmt8VpfLGN0aXnlYN524Qj7liHdujQa4T1cF
   w==;
X-CSE-ConnectionGUID: wwuXiUMESGCSQfvjxFoUMw==
X-CSE-MsgGUID: bdAQEsD5TLOa5brRAaDsFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62672472"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="62672472"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 12:24:06 -0700
X-CSE-ConnectionGUID: qF50uZFISvWl44oCE8r9Wg==
X-CSE-MsgGUID: WjhzB1oRQV2Tiwpw+VbD6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="219111151"
Received: from xpardee-mobl.amr.corp.intel.com (HELO [10.124.130.255]) ([10.124.130.255])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 12:24:07 -0700
Message-ID: <c38c3b32-fce0-437c-b174-bf602927b0bb@linux.intel.com>
Date: Tue, 14 Oct 2025 12:24:05 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4][RFC] platform/x86/intel/pmc: Re-add SLP_S0_DBG
 register dump on Tiger Lake
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 platform-driver-x86@vger.kernel.org
Cc: irenic.rajneesh@gmail.com, david.e.box@intel.com, kernel-dev@igalia.com,
 kernel@gpiccoli.net
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
 <20250922230812.1584253-5-gpiccoli@igalia.com>
Content-Language: en-US
From: Xi Pardee <xi.pardee@linux.intel.com>
In-Reply-To: <20250922230812.1584253-5-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

My response is in line.

Thanks!
Xi

On 9/22/2025 3:52 PM, Guilherme G. Piccoli wrote:
> Commit a018e28f0880 ("platform/x86: intel_pmc_core: Remove slp_s0 attributes from tgl_reg_map")
> removed the SLP_Sx_DBG register dump on suspend/resume s0ix-related failures
> on Tiger Lake. The mentioned reason was related to potential sub-states.
>
> Let's re-enable the SLP_Sx_DBG register dumping on failures, also fixing
> the register mapping (according to the spec[0]) and adding it also to
> Tiger Lake H, as a means to improve debug of suspend/resume failures .
>
> If we do have the sub-states, but not in all cases, better to have some
> platforms with more debug information than entirely suppress this info.
>
> [0] Refer to: "Intel 500 Series Chipset Family PCH datasheet - Vol 2"
> (Doc ID: 636174). Link (from Sep/2025):
> www.intel.com/content/www/us/en/content-details/636174/intel-500-series-chipset-family-platform-controller-hub-pch-datasheet-volume-2-of-2.html
>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Starting with Tiger Lake platforms, the slp_s0_dbg register maps are 
deprecated. The data provided by these registers may no longer be valid.

On Tiger Lake and newer platforms, the intel_pmc_core driver introduces 
substate_status_registers and other updated attributes that offer 
information useful for debugging S0ix-related issues.

> ---
>   drivers/platform/x86/intel/pmc/tgl.c | 48 ++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>
> diff --git a/drivers/platform/x86/intel/pmc/tgl.c b/drivers/platform/x86/intel/pmc/tgl.c
> index 02e731ed3391..cdabe9b5c20b 100644
> --- a/drivers/platform/x86/intel/pmc/tgl.c
> +++ b/drivers/platform/x86/intel/pmc/tgl.c
> @@ -185,12 +185,58 @@ static const struct pmc_bit_map *tgl_lpm_maps[] = {
>   	NULL
>   };
>   
> +/*
> + * The following SLP_S0_DBG register mappings are based on the
> + * "Intel 500 Series Chipset Family PCH datasheet - Vol 2"
> + * specification (Doc ID: 636174).
> + */
> +
> +static const struct pmc_bit_map tgl_slps0_dbg0_map[] = {
> +	{"AUDIO_D3",		BIT(0)},
> +	{"OTG_D3",		BIT(1)},
> +	{"XHCI_D3",		BIT(2)},
> +	{"LPIO_D3",		BIT(3)},
> +	{"SATA_D3",		BIT(5)},
> +	{}
> +};
> +
> +static const struct pmc_bit_map tgl_slps0_dbg1_map[] = {
> +	{"USB2_PLL_OFF",	BIT(1)},
> +	{"AUDIO_PLL_OFF",	BIT(2)},
> +	{"MAIN_PLL_OFF",	BIT(4)},
> +	{"XOSC_OFF",		BIT(5)},
> +	{"PCIE_CLKREQS_OFF",	BIT(7)},
> +	{"AUDIO_ROSC_OFF",	BIT(8)},
> +	{}
> +};
> +
> +static const struct pmc_bit_map tgl_slps0_dbg2_map[] = {
> +	{"HSIO_CORE_GATED",	BIT(0)},
> +	{"CSME_GATED",		BIT(1)},
> +	{"GBE_NO_LINK",		BIT(4)},
> +	{"PCIE_LOW_POWER",	BIT(6)},
> +	{"ISH_VNN_REQ_ACT",	BIT(8)},
> +	{"CNV_VNN_REQ_ACT",	BIT(10)},
> +	{"PMSYNC_STATE_IDLE",	BIT(12)},
> +	{"ASLT_GT_THRES",	BIT(13)},
> +	{}
> +};
> +
> +const struct pmc_bit_map *tgl_slps0_dbg_maps[] = {
> +	tgl_slps0_dbg0_map,
> +	tgl_slps0_dbg1_map,
> +	tgl_slps0_dbg2_map,
> +	NULL
> +};
> +
>   static const struct pmc_reg_map tgl_reg_map = {
>   	.pfear_sts = ext_tgl_pfear_map,
>   	.slp_s0_offset = CNP_PMC_SLP_S0_RES_COUNTER_OFFSET,
> +	.slps0_dbg_maps = tgl_slps0_dbg_maps,
>   	.slp_s0_res_counter_step = TGL_PMC_SLP_S0_RES_COUNTER_STEP,
>   	.ltr_show_sts = cnp_ltr_show_map,
>   	.msr_sts = msr_map,
> +	.slps0_dbg_offset = CNP_PMC_SLPS0_DBG_OFFSET,
>   	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
>   	.regmap_length = CNP_PMC_MMIO_REG_LEN,
>   	.ppfear0_offset = CNP_PMC_HOST_PPFEAR0A,
> @@ -213,9 +259,11 @@ static const struct pmc_reg_map tgl_reg_map = {
>   static const struct pmc_reg_map tgl_h_reg_map = {
>   	.pfear_sts = ext_tgl_pfear_map,
>   	.slp_s0_offset = CNP_PMC_SLP_S0_RES_COUNTER_OFFSET,
> +	.slps0_dbg_maps = tgl_slps0_dbg_maps,
>   	.slp_s0_res_counter_step = TGL_PMC_SLP_S0_RES_COUNTER_STEP,
>   	.ltr_show_sts = cnp_ltr_show_map,
>   	.msr_sts = msr_map,
> +	.slps0_dbg_offset = CNP_PMC_SLPS0_DBG_OFFSET,
>   	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
>   	.regmap_length = CNP_PMC_MMIO_REG_LEN,
>   	.ppfear0_offset = CNP_PMC_HOST_PPFEAR0A,
