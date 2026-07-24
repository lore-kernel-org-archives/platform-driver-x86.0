Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA21437453;
	Fri, 24 Jul 2026 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891869; cv=none; b=NcUUdbvI7f38DKkjjBpWOrNHpN55VSEOJLFzijk7L/FcCmmM+yhKEwq6svlHVyvIyBppv2oB6u6h8ny2iVFlCxrVVkvUoJd84kyS4v4QbUzspziQ9bWYO+e118IF5W1k0cy8pSKan/WF23ezQYQfy4Z/OxBKDQRD7V8WmHvlcdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891869; c=relaxed/simple;
	bh=oXZgtpRiLkco/AiyzFIFJru0BukUivtJy2fcQFrGRb0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HpTz/wVlICO8Uj1KpzVozCrafuhhwQtOsQd9oXK+0hJxzSW7exQJqwHbIo3WMD8ZlXtUWLTvC8yGfbMi82qOXdWCKe+CN5Y19aaowGsoaQD9dNNXuZTMENEtSrj2PGX9ozDu1vbF5+ZsbuNRDbqIdAC8WPJvlaaygAOeWI5Davg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MBgPsDQv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBgPsDQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784891865; x=1816427865;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=oXZgtpRiLkco/AiyzFIFJru0BukUivtJy2fcQFrGRb0=;
  b=MBgPsDQvQCPtSdV3KKV3i2XRpBUJUJx0pmryzN6vn0mCrHo3HLf3hcbS
   CM9LEoD+WxJOsOgMKPvVLfklYoBROoBeSOEg4QhP15bzIqFLKdvQzHuIc
   dV7EUkd+I4dy1jFb7W4+v1CVFafJ9fumq/uAvnmToWqpmzfjbOhxqer3r
   t7JbsjG7O6kzcAc7NyueOcrwjcea7TzIqqrx6+JUElteL0PHsfDZWUm9I
   djVSZhIemyLtIwb3LjQs20ARS+j+dUEg8yxmMZON2VgpIOQ3w6zwD/wyP
   XtmCVE4nRmJknAZDB0ouKVdKngYSgg2WWmyeQ7ipbIdJlM5HR0GFD0Cku
   Q==;
X-CSE-ConnectionGUID: qYR38Ai8RBebwcMMCyP0rg==
X-CSE-MsgGUID: R6lyehzSSKyLGOC8Bp8FUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85501651"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="85501651"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 04:17:43 -0700
X-CSE-ConnectionGUID: ZV0zHKhpRI6nvXF1d6JIhw==
X-CSE-MsgGUID: mgoSBn1URQavkp6SeOpw3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="255320312"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.8])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 04:17:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Jul 2026 14:17:37 +0300 (EEST)
To: Suryansh Singh <technosfan14@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add OMEN board 8BA9 thermal profile
 support
In-Reply-To: <20260723174443.26906-1-technosfan14@gmail.com>
Message-ID: <423a8ddd-e93e-8aaf-dcd8-d9d54d9a0600@linux.intel.com>
References: <20260723174443.26906-1-technosfan14@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Jul 2026, Suryansh Singh wrote:

> The HP OMEN 16-wd0xxx (board ID: 8BA9) has the same WMI interface
> as other Victus S boards, but requires quirks for correctly
> switching thermal profile.
> 
> Add the DMI board name to victus_s_thermal_profile_boards[] table
> and map it to omen_v1_thermal_params.
> 
> Without this entry, platform profile switching is unavailable,
> preventing fan RPM reporting and controlling.
> 
> Tested on:
>   HP OMEN 16-wd0012TX
>   DMI Board Name: 8BA9
> 
> It has been confirmed that the platform profile is registered
> successfully, and the fan RPMs are readable and controllable.
> 
> Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 8ba286ed8..052c64aa0 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -201,6 +201,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
>  		.driver_data = (void *)&omen_v1_legacy_thermal_params,
>  	},
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BA9") },
> +		.driver_data = (void *)&omen_v1_thermal_params,
> +	},

Hi,

This patch is based on too old code. In plaform drivers tree, hp-wmi's 
driver_data scope has been expanded to cover things beyond thermal params.

-- 
 i.

