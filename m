Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008291DE3DF
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Dec 2025 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808725; cv=none; b=P3CDx31snqrMMPycNqMhk69IqTfyASTevTG2JDOoMJCSDolJKAHMDCUil4aPy89EtSWoXclEnu9jQmwnwvXI1rAc+3agXPVF6mRkPX3H0iqzM3v3xjKyr1k/gCEUKLWpDIa402urOlZTZ9t/3iEfydudEbIGigdAqnp9SLfD7pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808725; c=relaxed/simple;
	bh=J+4ltBpjbrTZeH/Jr/w12L26OytDZi09CgeyWI+9Cc4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OgF55iMWGGls/MNJHm65YRL7QTQmS4MjGJb104mXGdgXOotKH2+A/VilLFaAaXlGTEq0A/sclXyWBZWpsXSuVpKgEbKD76D/GkmTLAb6zbkOp0W/AmBYBaVaTUWFSSHDlcMgGaVr4Ky3Q2HolfjK4+UNcK5Aon0K6Y95tc0YPdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXj876Nm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXj876Nm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765808724; x=1797344724;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=J+4ltBpjbrTZeH/Jr/w12L26OytDZi09CgeyWI+9Cc4=;
  b=EXj876NmYYJaRNXa21uc1Ay8S0yx2r78WftM9TwmBW0+j/GMmW55RJ0a
   KYOO55Y1w5T4v8up7aS12CqsOGAB/b0pscb3nW64bhCXp6G0a52/Mlb6V
   QX9HohWpkAnxrQDPtoqr9zbVCnt8oMwWBJhenC1dzRTxtNG1IxEeawxfC
   FNMGaJmY4ewCIPwKP+QEdWS1JaP5+nrrGQJy12EHZhaCk4tV8wcnYz6RC
   OH0THohU7CREIrvx+FAn+ZuqCPjlCGjgKZHcS5NbjTJDPP98K0t8ICW02
   WQYsK3G0mpjk7JtVDouL9YOwTACQ2D6yLTn6ZfGvzzacE1K7l7wKCtQp/
   g==;
X-CSE-ConnectionGUID: ud7KYnKyQ0OkaTNRpClk8A==
X-CSE-MsgGUID: WSM94UAcSHiyYTkr+3/YNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67592345"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67592345"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 06:25:22 -0800
X-CSE-ConnectionGUID: XbWrjkT2SCeXqHVcOl4CcA==
X-CSE-MsgGUID: x2AkyevlR9m6CMnzG22c/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="201918160"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 06:25:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 15 Dec 2025 16:25:17 +0200 (EET)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-wmi: fix platform profile values for
 Omen 16-wf1xxx
In-Reply-To: <20251213185107.179130-1-krishna.chomal108@gmail.com>
Message-ID: <6ae912bf-ceb9-b8cf-5e9b-831c91135a59@linux.intel.com>
References: <20251213185107.179130-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 14 Dec 2025, Krishna Chomal wrote:

> HP Omen 16-wf1xxx (board ID 8C78) currently sends the incorrect
> Victus-specific thermal profile values via WMI, leading to a logical
> inconsistency when switching between platform profiles.
> 
> The driver currently uses Victus S values:
> 0x00 => Balanced / Low-Power
> 0x01 => Performance
> 
> However, Omen Gaming Hub logs / EC register inspection on Windows shows
> that this board is intended to use:
> 0x30 => Balanced / Low-Power
> 0x31 => Performance
> 
> This patch corrects the thermal profile command values to match the
> values observed from Omen Gaming Hub logs. The performance benchmarks
> and peak power draw (from both CPU and GPU) show no observable change
> with this correction (suggesting that the firmware is currently tolerant
> of the incorrect values). However sending the correct values prevents
> potential regressions after future firmware updates.
> 
> Create a new omen_new_thermal_profile_boards[] array for devices that
> share the Victus WMI queries but require Omen thermal profile values.
> Conditionally use these values in platform_profile_victus_s_set_ec().
> 
> Tested on: HP Omen 16-wf1xxx (board 8C78)
> Result: Confirmed WMI codes 0x30/0x31 are now sent, resolving the
> logical inconsistency and ensuring the value visible in EC registers
> match the Windows state for this profile.
> 
> Fixes: fb146a38cb11 ("platform/x86: hp-wmi: Add Omen 16-wf1xxx fan support")
> Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 35 +++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index f4ea1ea05997..4dfd5fc230e2 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -105,6 +105,14 @@ static const char * const victus_s_thermal_profile_boards[] = {
>  	"8D41",
>  };
>  
> +/* DMI Board names of Omen laptops that have same WMI queries as
> + * victus_s_thermal_profile_boards but use hp_thermal_profile_omen_v1
> + * values.
> + */
> +static const char * const omen_new_thermal_profile_boards[] = {
> +	"8C78",
> +};
> +
>  enum hp_wmi_radio {
>  	HPWMI_WIFI	= 0x0,
>  	HPWMI_BLUETOOTH	= 0x1,
> @@ -1522,6 +1530,18 @@ static bool is_victus_thermal_profile(void)
>  			    board_name) >= 0;
>  }
>  
> +static bool is_omen_new_thermal_profile(void)
> +{
> +	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +
> +	if (!board_name)
> +		return false;
> +
> +	return match_string(omen_new_thermal_profile_boards,
> +			    ARRAY_SIZE(omen_new_thermal_profile_boards),
> +			    board_name) >= 0;
> +}
> +
>  static int platform_profile_victus_get_ec(enum platform_profile_option *profile)
>  {
>  	int tp;
> @@ -1678,19 +1698,28 @@ static int platform_profile_victus_s_set_ec(enum platform_profile_option profile
>  
>  	switch (profile) {
>  	case PLATFORM_PROFILE_PERFORMANCE:
> -		tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
> +		if (is_omen_new_thermal_profile())
> +			tp = HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE;
> +		else
> +			tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
>  		gpu_ctgp_enable = true;
>  		gpu_ppab_enable = true;
>  		gpu_dstate = 1;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
> -		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
> +		if (is_omen_new_thermal_profile())
> +			tp = HP_OMEN_V1_THERMAL_PROFILE_DEFAULT;
> +		else
> +			tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
>  		gpu_ctgp_enable = false;
>  		gpu_ppab_enable = true;
>  		gpu_dstate = 1;
>  		break;
>  	case PLATFORM_PROFILE_LOW_POWER:
> -		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
> +		if (is_omen_new_thermal_profile())
> +			tp = HP_OMEN_V1_THERMAL_PROFILE_DEFAULT;
> +		else
> +			tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
>  		gpu_ctgp_enable = false;
>  		gpu_ppab_enable = false;
>  		gpu_dstate = 1;

Hi,

Thank you for the patch but it looks this approach to add mappings using 
if()s to handle variations should be replaced with something better.

-- 
 i.

