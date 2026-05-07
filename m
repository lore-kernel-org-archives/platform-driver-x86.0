Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9462DF136;
	Thu,  7 May 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158657; cv=none; b=upvjIAHKvMzYFR7Q5ACVqtMvXBhsYqZ9P1hTehoO1irU8S6XJiLnkL5uL8FSJjG91hl4HGyVWaSyCzcQvsrA07jq/xIlI7mRMD7RJeBTUm6jY0AN51qNG1pWsYPjRH3kOQbYFP3x8gsRFpOrzsFubIkLUF0/1k6lxX3NWF0jxyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158657; c=relaxed/simple;
	bh=gpD+/5TkisG4vZVJF9sV3qWvTaVRgEUxRjmZYumbvQg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oVmojzB5e0h4L+/K5UfGMPKjf1Si9+lIzRb0xXbVzVV9iGImPusfFImNpkGswjm/CF2Jr4RR+gkZ5cnfCxZ/UtrryEPBbBvfmU18jFHWlm8oF7v3Pen4eQXAQs9b6Ia5g0kblFajfdVeSj8sfBFTzLEKPAUwv5fW/MmjgnW4Rd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FygYi3Cb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FygYi3Cb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778158656; x=1809694656;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gpD+/5TkisG4vZVJF9sV3qWvTaVRgEUxRjmZYumbvQg=;
  b=FygYi3CbMu6O0p1s5+K+2+rVhFTkGyTyCpQYuSujMD+hiqUuxNLWMgal
   RBQ0FgH1HzNmolNaDg4sC1xoUEoY3SqcVErHJHA22v6SF0HbU7Gqaa+FM
   LntegfbkIVRv8zoh8JvEW6PWN60fT5Lb1TCVL+EP8gBiP0w12VMkz1NLY
   x9I/HIF/pPf4zuOcMMQ0m7dJS0yg3C+QxlQgrtxArPyVdHml3FWDt16WM
   j+4L83kqMa6VxqW7bm81vuvv9zw0dVCEt5s1ucrmqZZ9f10VUYGEaqpWj
   6LvotDrxhJ9CMNQy6p0uEqB1Ua4orQQPTDD9WoSnSA1EoEK1yxzlAeCvF
   g==;
X-CSE-ConnectionGUID: E30XitgyS1avoWEAJ6pm6w==
X-CSE-MsgGUID: 5UMAeQXIQQ26BC0DYtHa1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="89694588"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="89694588"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 05:57:35 -0700
X-CSE-ConnectionGUID: Oi1AbT1xQfCMEvWoeoVGYw==
X-CSE-MsgGUID: EY6l/52FT8y7+H8wTVe+Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="260161340"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.116])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 05:57:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 7 May 2026 15:57:30 +0300 (EEST)
To: Haichen Feng <2806891994@qq.com>
cc: Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4] platform/x86: hp-wmi: Add support for Victus 16-r0xxx
 (8BC2)
In-Reply-To: <tencent_99A9EA72B4A101066BC4B6F391F41BB8E309@qq.com>
Message-ID: <d50fc9a7-52d4-eda5-0082-8e11f71235fc@linux.intel.com>
References: <f1258e15-cd9f-c215-4cc6-0b3b282994ba@linux.intel.com> <tencent_99A9EA72B4A101066BC4B6F391F41BB8E309@qq.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 May 2026, Haichen Feng wrote:

> The HP Victus 16-r0xxx (board ID: 8BC2) has the same WMI as other Victus
> S boards, but requires quirks for correctly switching thermal profile.
> 
> Add the DMI board name to victus_s_thermal_profile_boards[] table and
> map it to omen_v1_thermal_params.
> 
> Testing on board 8BC2 confirmed that platform profile is registered
> successfully and fan RPMs are readable and controllable.
> 
> Signed-off-by: Haichen Feng <2806891994@qq.com>
> ---
> Change in v2:
>  - Move code to correct place
>  
> Change in v3:
>  - Move code to the front of 8BCA
>  
> Change in v4:
>  - Add explanation about this patch
>  - Insert a space at the second parenthesis in 8BC2 line
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index d1cc6e7d1..71a2093cc 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -205,6 +205,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
>  		.driver_data = (void *)&victus_s_thermal_params,
>  	},
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BC2") },
> +		.driver_data = (void *)&omen_v1_thermal_params,
> +	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
>  		.driver_data = (void *)&omen_v1_thermal_params,
> 

Hi,

Can you please resend this v4 into a new thread. b4 I use while applying 
patches seems to unable to  capture it from here and gets the wrong 
version.

-- 
 i.

