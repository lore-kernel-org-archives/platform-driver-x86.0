Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECF33C9881;
	Wed,  1 Jul 2026 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905512; cv=none; b=IErQBCEM/DhTUWcTLYiTyR215UpD4PoV9/UaPnMxXP+UTQeExhAMxQyQETQnymiqyksmeMnY8Z9kcdUFPfZMnbejPMghR0Btlx0FHrN/f9apnRAvzJBIJCuIfyW6XZzUJdIimuwPSP03aQ+x8kuAkCgXjEDOGirZmwpEJlXx6c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905512; c=relaxed/simple;
	bh=1v3SBt89h42SC+qC0AOOFYXMGysKrplRq6O8ppzGIcM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KWS5IGMcdmCaGIqyKpHWAopPFvNpHSzzWSjQyeQ3930nZ8HbLwCGVOhQBceGwaQQZBke1BTm8Xi617Z/FLAWBU0erD9/vtgzR5n3xPwtb4S6RO+NnpFUPVWJc5e3hHkr+xj2Ox1Q4Iuy+3TTcOFqId1Lt9ln8m1izOktqJnGv1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjOrW1fb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjOrW1fb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782905511; x=1814441511;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1v3SBt89h42SC+qC0AOOFYXMGysKrplRq6O8ppzGIcM=;
  b=mjOrW1fb2Jt4ctQi80rK/X/OADCTQLgHMu5DOL1Z4V+/AB/biEhL3YsW
   +E3Z1rHyvZIhxm+4yrJU9tWNew4C6nG/TLkRhv7ZkkfT5FOKK0yIO9f8V
   G8LviAzBt+mRTapUahC5LbE3JakFLQj0QXJxS2h5JFnKlw3GuXU4DPwr5
   UBmTJMhGjv2GMEru2+dFZ2lB8U82tu6OYAipQiCrfsZ8Pwi3wEkX32A9e
   TU4rs2sxFJq+U+oYhT3Dw/pAcxj8lXu86+uY+ouIHDOvpfkvYhIn6WCH0
   GYfYkaYdRs/ncU9UW32ub12az5I+BCZuJS0x5whTMCL2ZS4oCXWheh0V6
   g==;
X-CSE-ConnectionGUID: XwCnaypNSZepk2onT0ukvA==
X-CSE-MsgGUID: LIE4kGdLQ5SZeuTuxsFkVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="95019401"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="95019401"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:31:50 -0700
X-CSE-ConnectionGUID: TUtV8rX1S0KXOpbJnpyzHg==
X-CSE-MsgGUID: QWcFlmzRTPC0cdmyw6GGqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="282618786"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:31:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 1 Jul 2026 14:31:44 +0300 (EEST)
To: Lauri Sarap <lauri.aardla@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add fan control support for OMEN
 8C4D
In-Reply-To: <20260616014158.816064-1-lauri.aardla@gmail.com>
Message-ID: <d084f3f0-51c7-36b9-2a23-6d5a6aee2c98@linux.intel.com>
References: <20260616014158.816064-1-lauri.aardla@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Jun 2026, Lauri Sarap wrote:

> The HP OMEN Transcend 16-u1xxx with board ID 8C4D uses the
> Victus S fan control path with OMEN v1 thermal profile parameters.
> 
> Manual fan control has been tested through the hwmon pwm interface. The
> legacy OMEN profile path exposes controls but does not change fan speed
> on this board; the Victus S table with omen_v1_thermal_params provides
> working fan RPM changes.
> 
> Assisted-by: Codex:GPT-5
> Signed-off-by: Lauri Sarap <lauri.aardla@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index d1cc6e7d1..ffe229ec0 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -221,6 +221,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
>  		.driver_data = (void *)&victus_s_thermal_params,
>  	},
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C4D") },
> +		.driver_data = (void *)&omen_v1_thermal_params,
> +	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
>  		.driver_data = (void *)&omen_v1_thermal_params,

Thanks for the patch.

hp-wmi driver's .driver_data scope has been expanded. Please check the 
very changes recently added into the review-ilpo-next branch in the 
platform drivers repo and adapt this patch accordingly. Then post v2, 
thank you.

-- 
 i.

