Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C81413B2B3
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709043221; cv=none; b=tXDDxWIZWA4v+A/PspDro03CmlkgNPXdrk/MOda7F6b4dhs3b/2KAhhbfEYj4Zjx2KKL7l28+rsw2tKIMVRUTwDIbZrRW0acPJzEM3oV2B/fVc0PMU0mb0EYs7jv7aODHjkSQykZNmnLHp6Np5MY1cO4ynVcnXETYHeRQqm9Q+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709043221; c=relaxed/simple;
	bh=rFhlhpY+REHVTQOk1QeQBLSHkiio+Teuq19QQwBrk0M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AtKh5wHeSNn6sFnha5KtdINuCnbYW3IO5jttyBRzbAMcAMlOWbxGQl4eyyL2K7ucjY/hfqx3+xMVNE9GRBnpoV94ds16NxrhFdqixpHzEASqmNkz7DHcBXbmV3YS4OecFhUMLB4ZG1GmjRxwT3nkgYydIMotTDMqgcBq4jyO0bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f83VwB7F; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f83VwB7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709043221; x=1740579221;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rFhlhpY+REHVTQOk1QeQBLSHkiio+Teuq19QQwBrk0M=;
  b=f83VwB7FocR8kQhfCfBPiEVyA8G3LtI5FhqVYSF2MPUrcuyeztyCGbqq
   aVle5M3ZITe8R2SO6JPy+/VFAJUGvX922T2NZrwT3qVBhey+mM2Ei4Pcn
   xdGT/lh2lpo1si2i0b0rCp3sWRZaKpTZl0r1SBhd0I8zlQu5sQONQaJzA
   MX0sgbSErdphJIuPcuLNt2VemSAXDYiQf/k0/vgGVctZSuPHovJyx04mr
   sdLisneBMg+E7eUvxlD5C8KOVl1S8veVEz1odZxh3uvz5guQc0s1xQLRT
   695bb4K5x73e/MjuHCTkEvZzieAeadeZRaTuSn7B+66ue+foZdXW13yTe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14823990"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="14823990"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 06:13:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="44558033"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.34.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 06:13:37 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 27 Feb 2024 16:13:33 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 5/7] platform/x86/amd/pmf: Add support to get APTS index
 numbers for static slider
In-Reply-To: <20240227125520.3153140-6-Shyam-sundar.S-k@amd.com>
Message-ID: <91a406cd-bf71-ab86-09ba-97d90f2ae1fd@linux.intel.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com> <20240227125520.3153140-6-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Feb 2024, Shyam Sundar S K wrote:

> APMF spec has a newer section called the APTS (AMD Performance and
> Thermal State) information, where each slider/power mode is associated
> with an index number.
> 
> Add support to get these indices for the Static Slider.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 10 +++++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 24 +++++++++++++++++
>  drivers/platform/x86/amd/pmf/sps.c  | 42 ++++++++++++++++++++++++++++-
>  3 files changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 0fc8ad0ac3e9..28df45c058db 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -96,6 +96,16 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
>  	return !!(pdev->supported_func & BIT(index - 1));
>  }
>  
> +int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
> +				       struct apmf_static_slider_granular_output_v2 *data)
> +{
> +	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
> +		return -EINVAL;
> +
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR,
> +								data, sizeof(*data));
> +}
> +
>  int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
>  				    struct apmf_static_slider_granular_output *data)
>  {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 5cad11369697..b27e96aeac23 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -85,6 +85,7 @@
>  #define MAX_OPERATION_PARAMS					4
>  
>  #define PMF_IF_V1		1
> +#define PMF_IF_V2		2
>  
>  struct sbios_hb_event_v2 {
>  	u16 size;
> @@ -264,6 +265,17 @@ struct amd_pmf_dev {
>  	u16 pmf_if_version;
>  };
>  
> +struct apmf_sps_prop_granular_v2 {
> +	u8 ac_best_perf;
> +	u8 ac_balanced;
> +	u8 ac_best_pwr_efficiency;
> +	u8 ac_energy_saver;
> +	u8 dc_best_perf;
> +	u8 dc_balanced;
> +	u8 dc_best_pwr_efficiency;
> +	u8 dc_battery_saver;

I started to wonder if these could be made into an two element array with 
4xu8 in each, one for AC and DC because it would simplify some other code 
in the subsequent patches (and perhaps even in this patch)?

-- 
 i.

