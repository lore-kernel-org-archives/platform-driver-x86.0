Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173813CF1E5;
	Fri, 28 Aug 2026 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787904192; cv=none; b=itUKo/mJ2GfDAA1qlxDE1qN7W3liqOXzvB6/aUJ3WsQ4e+bMA9WIYMdAO2+C5XTanw+CkLpop2OZ/WHcmOAJlAbRTa4/yjXRGcvKBw+uhTYYVw73AFKbaUnDRyMfsTwLpbsdPdJ3J+x2osKArMzrSAZbDY+h5JCFd3WiMR+tXKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787904192; c=relaxed/simple;
	bh=gRh2D6m+qW2xYeXS/yuKwRgetzMFzQUb8xjKd7dFYws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhlwIjIpqVqYjaYqGz4GpJQggvMX3UuKW0/1IOvp29Luewrrj64J1B1SKpq0TMDNZURjIPAirf7CekQTFbr45s0OysKas/JvpUWX2qoaCts+G4t0wwf7TwRy9HPC97TIfpgbKlK3gCnvXK43vGB7OhA8/G7okmRdxF07omDiYc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7KH+OVC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7KH+OVC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787904191; x=1819440191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gRh2D6m+qW2xYeXS/yuKwRgetzMFzQUb8xjKd7dFYws=;
  b=F7KH+OVCLXsi4BbDvy58mICOh+TE0gRbXSqhahk88WM/peNPAyEO5yHv
   QmN3CTQDQlpUft1n0BgxnpQ7YpfPHvUVQEn8ncjuNym+z/hXbUEYizMk7
   XuOAaIU+AZCGQbROd6Hb/mr8cgy1A8qEI/oHbNrxZg1q9RrbvrszgATFY
   W/bS32o0Igf6hDzsH3F3BTLR2wgMo1P7aV3b/q0TmrxxCn16dWC57tLCg
   t/TtBIB2sxn5nqU3kSoGu7w4+BO4Ig1GGyfEGG25kAK70aQTib2YEdj64
   uJViTiZ0CLuKZJuebqE45apGl2PaSXw3JdIKsLuZc4GTHJig1L4v0u+if
   A==;
X-CSE-ConnectionGUID: qANO8mlaSiqOQutmtUpo4Q==
X-CSE-MsgGUID: duzaiDa8S4eh2j/VBJjvLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99570593"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="99570593"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 01:03:10 -0700
X-CSE-ConnectionGUID: taBku3MWSIi17UqF0LuQBA==
X-CSE-MsgGUID: Djso2zsUSnqEUJc3PpAAng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="264323442"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 01:03:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B28EF121505;
	Fri, 28 Aug 2026 11:03:01 +0300 (EEST)
Date: Fri, 28 Aug 2026 11:03:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net, andriy.shevchenko@intel.com,
	v.vitovt@gmail.com
Subject: Re: [PATCH v9 4/6] platform/x86: int3472: tps68470: add board data
 for Dell Latitude 5285
Message-ID: <apFAtVQd_3HLL2cD@kekkonen.localdomain>
References: <20260827201611.99825-1-tchatard@gmail.com>
 <20260827201611.99825-5-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827201611.99825-5-tchatard@gmail.com>

Hi Thierry,

Thanks for the update.

On Thu, Aug 27, 2026 at 10:16:09PM +0200, Thierry Chatard wrote:
> The Dell Latitude 5285 2-in-1 has two cameras connected through a TPS68470
> PMIC/clock/GPIO hub:
> 
>   Front: OV5670 (ACPI INT3479) on I2C4
>   Back:  OV8858 (ACPI INT3477) on I2C2, daisy-chained behind TPS68470
>          S_I2C port (controlled by reg 0x43 S_I2C_CTL)
> 
> GPIO mapping (TPS68470):
>   INT3479 (OV5670): GPIO3 = reset, GPIO4 = powerdown (both active-low)
>   INT3477 (OV8858): GPIO9 = s_resetn, GPIO7 = s_enable (both active-low)
>     GPIO9 and GPIO7 are the TPS68470 secondary-port GPIOs (SGPO reg 0x22
>     bits 2 and 0), not regular GPDO outputs.
> 
> Regulator mapping:
>   CORE  -> dvdd  / INT3477
>   ANA   -> avdd  / INT3477
>   VIO   -> generic (kept always_on; no direct consumers)
>   VSIO  -> dovdd / INT3477: enabling VSIO sets S_I2C_CTL (reg 0x43),
>            opening the I2C passthrough to OV8858; the ov8858 driver
>            enables dovdd at probe time, which naturally activates the
>            passthrough before any I2C transaction to the sensor.
>   AUX1  -> dvdd  / INT3479
>   AUX2  -> dovdd / INT3479
> 
> A static clock consumer list is provided for both sensors (INT3477 and
> INT3479) to work around the broken ACPI _DEP on INT3479 described in the
> previous patch.
> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>

Is Documentation/process/coding-assistants.rst relevant for the set?

> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 170 +++++++++++++++++-
>  1 file changed, 167 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036..6961e2926 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -74,8 +74,12 @@ static const struct regulator_init_data surface_go_tps68470_vcm_reg_init_data =
>  	.consumer_supplies = int347a_vcm_consumer_supplies,
>  };
>  
> -/* Ensure the always-on VIO regulator has the same voltage as VSIO */
> -static const struct regulator_init_data surface_go_tps68470_vio_reg_init_data = {
> +/*
> + * Keep VIO always_on.  Its voltage must exactly match VSIO on any board
> + * using the TPS68470 I2C pass-through, and must never have direct consumers
> + * (all I2C-path outputs are gated through VSIO).
> + */
> +static const struct regulator_init_data generic_tps68470_vio_reg_init_data = {
>  	.constraints = {
>  		.min_uV = 1800600,
>  		.max_uV = 1800600,
> @@ -122,7 +126,7 @@ static const struct tps68470_regulator_platform_data surface_go_tps68470_pdata =
>  		[TPS68470_CORE] = &surface_go_tps68470_core_reg_init_data,
>  		[TPS68470_ANA]  = &surface_go_tps68470_ana_reg_init_data,
>  		[TPS68470_VCM]  = &surface_go_tps68470_vcm_reg_init_data,
> -		[TPS68470_VIO] = &surface_go_tps68470_vio_reg_init_data,
> +		[TPS68470_VIO] = &generic_tps68470_vio_reg_init_data,

I think this would be better put into a separate patch before this one.
Also intel_nvl_tps68470_vio_reg_init_data is exactly the same.

>  		[TPS68470_VSIO] = &surface_go_tps68470_vsio_reg_init_data,
>  		[TPS68470_AUX1] = &surface_go_tps68470_aux1_reg_init_data,
>  		[TPS68470_AUX2] = &surface_go_tps68470_aux2_reg_init_data,

-- 
Regards,

Sakari Ailus
