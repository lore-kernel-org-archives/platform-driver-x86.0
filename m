Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA6A145356
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 13:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709041707; cv=none; b=nxwrptludgapXOvj1Ufm7NTTWMnukVwyJXoTz0h8HvClwEfztmEm1JnV/HZ7PKaSWoEGYDoaqlTR1IcNlB99I26+DS42bp2saSdty0f8LdWp3WegFIPO4c/o+Cj+KfJj3oDBlwCU92sVU4vu3gcUdm8y+DzfgW4HDm1bS/3kHlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709041707; c=relaxed/simple;
	bh=DPCz3M1GH0q0t6l7yrOp+AQYxoWxiRSBmlUzvSOSy0g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JO4YGUypYufLDckQAtBGOf5+FsU1na/UCSMQnQzYnhX90sHaULpsCop9OL1qQ81YekQFHDTm0KYbKXv3Jzn5sOGbiYydxG+VV1XsTBTbA8fkmxTXbCfa0h3rIuYZBEDkf1Hn4/uuEIyagDQ+CJaAtQe/bqv51UmpaP8RCPBS9kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VO/DTVUj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VO/DTVUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709041705; x=1740577705;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DPCz3M1GH0q0t6l7yrOp+AQYxoWxiRSBmlUzvSOSy0g=;
  b=VO/DTVUjLb5yFC3NL8pJqOjhP9t5pZYghT7bLc+RzsMY/yJbn/W2ac6h
   ytzXBvOaSIedAKQsuZaOBFRIoK1xp60oFOPyjiMMXDpj3BJkcAahlVP6D
   or6dn+Uh1E8vVC2zJrRQuWIpY7S9Y5yWUkVsuzuU6NQZo1xZW9P11w4mT
   9oklx5C36FUYcGhao+pYb/IeD8Wf5qayNeat9FKiRgHhuZXGFo/I0IpVo
   f6QJ/8hHsrgP7X9KyVqdy9eMttbzsT1kDzT5t8UPvCKOtYwx85o7da4YS
   b7wkrv96N07JIoCRgi3Pi1aBDWWF5/xPlcTrqG2uJV3ZoF1w2MDj/Ur3y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3509424"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3509424"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 05:48:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="11669662"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.34.61])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 05:48:13 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 27 Feb 2024 15:48:08 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 5/7] platform/x86/amd/pmf: Add support to get APTS index
 numbers for static slider
In-Reply-To: <20240227125520.3153140-6-Shyam-sundar.S-k@amd.com>
Message-ID: <17d7c1e5-2400-4a4a-93cf-bfbe6fefb209@linux.intel.com>
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

Wrong aligment. Please go through all the patches to check these.

> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index 33e23e25c8b1..dc4c7ccd4c43 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -10,6 +10,7 @@
>  
>  #include "pmf.h"
>  
> +static struct amd_pmf_static_slider_granular_v2 config_store_v2;
>  static struct amd_pmf_static_slider_granular config_store;
>  
>  #ifdef CONFIG_AMD_PMF_DEBUG
> @@ -63,10 +64,46 @@ static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *dat
>  
>  	pr_debug("Static Slider Data - END\n");
>  }
> +
> +static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v2 *data)
> +{
> +	pr_debug("Static Slider APTS state index data - BEGIN");
> +	pr_debug("size: %u\n", data->size);
> +	pr_debug("ac_best_perf: %u\n", data->sps_idx.ac_best_perf);
> +	pr_debug("ac_balanced: %u\n", data->sps_idx.ac_balanced);
> +	pr_debug("ac_best_pwr_efficiency: %u\n", data->sps_idx.ac_best_pwr_efficiency);
> +	pr_debug("ac_energy_saver: %u\n", data->sps_idx.ac_energy_saver);
> +	pr_debug("dc_best_perf: %u\n", data->sps_idx.dc_best_perf);
> +	pr_debug("dc_balanced: %u\n", data->sps_idx.dc_balanced);
> +	pr_debug("dc_best_pwr_efficiency: %u\n", data->sps_idx.dc_best_pwr_efficiency);
> +	pr_debug("dc_battery_saver: %u\n", data->sps_idx.dc_battery_saver);

I know these are debug only but what is the advantage of having the 
underscores in them? I think they'd read & match just fine without them 
(perhaps pwr->power would be better but it's up to you) and ac/dc can then 
be capitalized.


-- 
 i.

