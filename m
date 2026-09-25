Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C007332EBB;
	Fri, 25 Sep 2026 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334239; cv=none; b=lXs7Ee8aDqigHQvA+Wu1dLT0XVZT0sEqPIDV6nvN9M1ZkVlLyzwyGYxoSMRlLQyW/LYIcRsqu6/4NnfCT+7wE1xgS49iSAe3KRTDClqIzV54k6rkgB2Jnva+4pj2NAdFGpCn3X/k/Fe2RNNpafegRCmyaKis1Hq4JJxHq62byuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334239; c=relaxed/simple;
	bh=nXQnIlYNwBU1e8HetIwjFEmHHHz4OIEgbg1vGVK4Ns4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Tw0EFT71h1c0L9rxj7aggVYs9RpV2nAmkP3x4krHae/fwOd3OndCgZagWMkykGiHN+3vV+6sa0hhLFHdpPHtuAO2+YBKWzmLJB9aDBHSQzWhxd7iiRk/zAJdPVEm8p8FwOchMvZVlTL335Vp0Eyv+6CLozj3uSpm03B3QFMa+sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcwEUEtc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcwEUEtc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790334238; x=1821870238;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nXQnIlYNwBU1e8HetIwjFEmHHHz4OIEgbg1vGVK4Ns4=;
  b=TcwEUEtcqpm+TRNNqqVevyrY78wD40A4krlD5h5/DEG2QhWo53nsl8KD
   041X1LFMA5rNdIedr7LtfAyoV8dAvfRIs6zVnPS9Oo2gJJ1RTwK1bP7vN
   T254mChpyLF6pI+N5La5I6FSVXzImrUY8BVCP9ab5V4ka+1o5yhqZlWmk
   X63qFsIFDXynzs3hflbb7EkXYqXzSZMPk4p685E+7cOvUVZRzukpbih7J
   eEsh0ykcQuzbVgZkspF4gEh9exyy4bF4UVu1ir9IZzkIhSLP0301lxMuU
   OPEwmNMLTBZeziUfIhQF1/3Uq8fU4W+naiNFO5YXF+cK+cokyeOk+2iY3
   A==;
X-CSE-ConnectionGUID: UI66HF0ITz2MmmseXrjpSA==
X-CSE-MsgGUID: oPHy5y8GQZybqX7cQmOyOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89982436"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="89982436"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:03:58 -0700
X-CSE-ConnectionGUID: 8tQhNSLuTQeN9tn0rTv30g==
X-CSE-MsgGUID: aoiTU67JQR6BEDKShx4+Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272438369"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.131])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:03:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 25 Sep 2026 14:03:53 +0300 (EEST)
To: TuteMthCD <matias.civadda2342001@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Fix profile handling on
 Redmi Book Pro 14 2022
In-Reply-To: <20260925032001.111062-1-matias.civadda2342001@gmail.com>
Message-ID: <6467163f-8978-1c20-c7f4-360a3762edcc@linux.intel.com>
References: <20260925032001.111062-1-matias.civadda2342001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Sep 2026, TuteMthCD wrote:

> On the TIMI Redmi Book Pro 14 2022 (board TM2107), the firmware returns
> the current platform profile at byte offset 2 of the WMI response.
> The driver instead reads offset 4, which remains zero in the observed
> responses. Consequently, profile reads report balanced even after
> selecting another mode.
> 
> The generic performance capability check also requires a barrel-jack
> power supply. This blocks performance selection on this USB-C-only
> machine.
> 
> Add an exact DMI match for this model to read the profile from offset 2
> and require external power without the barrel-jack restriction.
> 
> Tested on physical Redmi Book Pro 14 2022 hardware (TM2107),
> BIOS RMARB4B0P1010, running Linux 7.2.6-zen2-1-zen.
> 
> Assisted-by: Codex:GPT-6
> Signed-off-by: TuteMthCD <matias.civadda2342001@gmail.com>

Please see Documentation/process/submitting-patches.rst for how to 
properly sign off your submissions and what it means.

> ---
>  drivers/platform/x86/bitland-mifs-wmi.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index 3a373184519d..c132902bc5f8 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/dev_printk.h>
>  #include <linux/device.h>
>  #include <linux/device/devres.h>
> +#include <linux/dmi.h>
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
>  #include <linux/init.h>
> @@ -38,6 +39,17 @@
>  #define BITLAND_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
>  #define BITLAND_EVENT_GUID	"46C93E13-EE9B-4262-8488-563BCA757FEF"
>  
> +static const struct dmi_system_id bitland_tm2107_table[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TIMI"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2107"),
> +		},
> +	},
> +	{}
> +};
> +
>  enum bitland_mifs_operation {
>  	WMI_METHOD_GET	= 250,
>  	WMI_METHOD_SET	= 251,
> @@ -195,13 +207,18 @@ static int laptop_profile_get(struct device *dev,
>  		.function = WMI_FN_SYSTEM_PER_MODE,
>  	};
>  	struct bitland_mifs_output result;
> +	u8 mode;
>  	int ret;
>  
>  	ret = bitland_mifs_wmi_call(data, &input, &result);
>  	if (ret)
>  		return ret;
>  
> -	switch (result.data[0]) {
> +	/* TM2107 returns the profile in byte 2 instead of byte 4. */
> +	mode = dmi_check_system(bitland_tm2107_table) ?
> +		result.reserved2 : result.data[0];

You claimed above you tested this patch but how is that possible as this 
patch will not even compile???

Did AI just make up the claim you've tested the patch? Letting AI make 
claims on your behalf that you did things which are not true is misusing 
community's goodwill and trust, and totally unwanted behavior! Please 
don't do that again.

Next time, please properly test the very patch you're sending and review 
it yourself before hitting the send button. Do not mindlessly send patches 
that are AI generated, we don't want unfiltered AI output to be sent to 
us.

In addition, any patch you're submitting to platform drivers list should 
be based on top of for-next or review-ilpo-next branch in the pdx86 repo, 
not some random other tree (if that's the explanation for the 
inconsistencies here).

> +
> +	switch (mode) {
>  	case WMI_PP_BALANCED:
>  		*profile = PLATFORM_PROFILE_BALANCED;
>  		break;
> @@ -229,6 +246,10 @@ static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *da
>  	struct bitland_mifs_output output;
>  	int ret;
>  
> +	/* TM2107 only requires external power, including USB-C. */
> +	if (dmi_check_system(bitland_tm2107_table))
> +		return power_supply_is_system_supplied() > 0 ? 0 : -EOPNOTSUPP;
> +
>  	/* Full-speed/performance mode requires DC power (not USB-C) */
>  	if (!power_supply_is_system_supplied())
>  		return -EOPNOTSUPP;
> 
Variations like the ones you have in this patch should be covered using a 
struct in .driver_data in a generic dmi table, not some device specific 
table.

You probably should also add depends on DMI.

-- 
 i.

