Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5E038887D;
	Fri,  4 Sep 2026 07:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505498; cv=none; b=nSmnR3NSMNYCwPLhXhRWHcuYJMr9I1qi11b011blUK1TpfmAULtafacKVIYVi3PxJ6IzCtlJNMoNzLmrPldKZ3IX1Gm2LSOFwWhrtzcBJmBMI9HGTso1tuNVb2i8v4Qr6nPTnr2++8JelMZPV5jorqMz0zwBqrkGHOTtAvcsfUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505498; c=relaxed/simple;
	bh=dra3v/zqINWBLuLGa52Cly6NR2d/qWOM7ridNNobHh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLOPbbg0EKzpJuO8fDD6tOTIVDx/+PgG1jh3Jt0I30fQNFdDVBhXfZ34U/GuDUQRIQuw8sIftBzGmX5FQX94GiTsmW9+9CnF6S33Cp4G56F7/QkVK7b5IOfO0RhttVr88iYzrs4hnLHG9iwiSCdcb4ZRA4sbQ5WT0Pc1/KtN2SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVWSF404; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVWSF404"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788505497; x=1820041497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dra3v/zqINWBLuLGa52Cly6NR2d/qWOM7ridNNobHh4=;
  b=EVWSF404bcWbRAGXCimqePRgsvNW0SE5HLPSdYNnZHOXNASE3iTxHMav
   ePI+yHZpZ7LF5Bo2XPxzF1oj0HC/KwrRDNNp9+KqQ05f+4M63vf4UUs6d
   x+mBd4Yv2HaZFu1o6J2Ndl4hnqmqeja+qbVteCVcXJbLsLdPApJQYwssv
   6MDUu8kOIrHI0onJU9LuLp5tK0fRg1whrQmIYSU5CZVH0vWLFOwZ0oUEo
   9Ft5dQ8g2GNGvjPhSy5CNNeZkIOLzQfIP9Le/GhxShFgx5PJDSAeyo396
   RIpv2FTIoyTOcG5pIEudU9d2nxNWzMauCAR2HZMFm9EThJx6Bsthgragq
   Q==;
X-CSE-ConnectionGUID: jBt+jAeMR5acXX6pkFO/Ww==
X-CSE-MsgGUID: zGMRTz9+Qn2yr9GrZ/yZIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89023699"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="89023699"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:04:56 -0700
X-CSE-ConnectionGUID: rE+l+poVT9mFuACqH4bm+Q==
X-CSE-MsgGUID: uMP2EUC3RfiT04+UXFtXGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273743627"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.250])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:04:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 45394121BD3;
	Fri, 04 Sep 2026 10:04:52 +0300 (EEST)
Date: Fri, 4 Sep 2026 10:04:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "D. Manresa" <dmanresa@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: int3472: Add TPS68470 board data for Dell
 Latitude 7275
Message-ID: <apptlIQexoFg42DF@kekkonen.localdomain>
References: <20260904062006.39209-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904062006.39209-1-dmanresa@gmail.com>

Hi D.,

On Fri, Sep 04, 2026 at 08:20:06AM +0200, D. Manresa wrote:
> The Dell Latitude 7275 2-in-1 has the same camera design as the Latitude
> 7212 Rugged Extreme Tablet: an OmniVision OV5670 front sensor (ACPI
> INT3479) powered by a TI TPS68470 PMIC, with GPIO 3 as reset and GPIO 4 as
> powerdown and the same regulator voltages. The only difference is that the
> PMIC ACPI node enumerates as INT3472:04 instead of INT3472:05, so the
> existing board data is not matched and the driver fails with "No
> board-data found for this model".
> 
> Add a board data entry for the Latitude 7275 reusing the 7212 regulator
> and GPIO tables with the right device name.

What's below would better fit after the '---' line.

> 
> Tested on a Latitude 7275 (BIOS 1.18.0): the PMIC probes, the OV5670
> binds and libcamera streams from the IPU3.
> 
> Note: on this machine the sensor sits on the I2C4 controller (INT3446),
> whose MMIO region overlaps an ACPI OperationRegion (\_SB.PCI0.GEXP.BAR0),
> so the intel-lpss driver only binds with acpi_enforce_resources=lax.

Is this the same issue than for Latutude 5285 here
<URL:https://lore.kernel.org/linux-media/20260831160754.9857-1-tchatard@gmail.com/>?

> 
> Signed-off-by: D. Manresa <dmanresa@gmail.com>
> ---
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -449,6 +449,15 @@
>  	},
>  };
>  
> +static const struct int3472_tps68470_board_data dell_7275_tps68470_board_data = {
> +	.dev_name = "i2c-INT3472:04",
> +	.tps68470_regulator_pdata = &dell_7212_tps68470_pdata,
> +	.n_gpiod_lookups = 1,
> +	.tps68470_gpio_lookup_tables = {
> +		&dell_7212_int3479_gpios,
> +	},
> +};
> +
>  static const struct int3472_tps68470_board_data msi_prestige_ai_evo_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:06",
>  	.tps68470_regulator_pdata = &msi_prestige_ai_evo_tps68470_pdata,
> @@ -500,6 +509,13 @@
>  	},
>  	{
>  		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7275"),
> +		},
> +		.driver_data = (void *)&dell_7275_tps68470_board_data,
> +	},
> +	{
> +		.matches = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
>  			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 13 AI+ Evo A2VMG"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-13Q3"),

-- 
Regards,

Sakari Ailus
