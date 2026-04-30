Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E29F1DD0EF;
	Thu, 30 Apr 2026 12:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553121; cv=none; b=Mz6LgZQMaZO0A0EaBw+l9rmGtVEJJebek55vcCZAAlA/t56SFhQqqtn5igaJQm5L9p8vHWCAOh/MBIKu/3fbpA/j3JJvr39xe1hAvGrrsb5GmF8KrZAaF3pa5t0GMYFXPfaa5DEE2hQIFHrOSS+B2bYhXdD1A0TuITwYAMKubGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553121; c=relaxed/simple;
	bh=nlmE8JcoySFlDRnjWQemkJZbwPkG5KjIYi7rjJb6cL8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=vGJzJsCdOjoGPhZoiKAMstCpdEJ4CuaZXpTxfcDmcb1HQT2zzUhVpeXIqV6YIy8/3067PpO/xgB7XFuZTXZ9kO50+ZV5qBsXib4f/QOWmmHghsVPYZ5YC0mfOrw+leeNLxaIiblUlJPtGkNUBbWYNwxu5j0hsYDKp3/B6B4eEwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfo6nwgK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfo6nwgK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777553120; x=1809089120;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nlmE8JcoySFlDRnjWQemkJZbwPkG5KjIYi7rjJb6cL8=;
  b=gfo6nwgK4sb1ot19istnhdI0DAwnT9B+tPECHJhB7SDFgYE+lWnhXjed
   ciB72KCukipbdRaxdVoZ+EHsd99Jbzb3HIYaDAgnKNhWQLlppgzxfa66E
   DrcHk1VYsTwZet+M+XuSB4dY/UUH0AjlhS5xDGEITUdktHfD2BWxI9b2X
   ZdDzyDDPW8CQHQh0SPUByeokFlmnH2RmvPA6tMTOBk1121hd9mPB/sliE
   E9kSdxfdHF0TO0oujMbFQntVObJaWe3Go5R207xPTyQdqToNRZzNzs6C0
   PLuvB83aeHvoXFJ6zAJ9C1Ye+5Z2TCl41RT3rpmfYFDJ2ECwYYNYG2dDN
   A==;
X-CSE-ConnectionGUID: /a+XG3UyS52OBxNcfdsEsg==
X-CSE-MsgGUID: L6XTSuA7T3Os+CUCvpjJag==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89876348"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="89876348"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:45:20 -0700
X-CSE-ConnectionGUID: 0k41RrMzRZe2KsGgLz+5Mg==
X-CSE-MsgGUID: YDe0Iyr1Tsif3gjam1ly7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="234464129"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:45:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 30 Apr 2026 15:45:13 +0300 (EEST)
To: Haichen Feng <2806891994@qq.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add support for Victus 16-r0xxx
 (8BC2)
In-Reply-To: <tencent_C70DE4F14F7552DAFC00633507DB5B48F708@qq.com>
Message-ID: <930ba4a0-91be-03b3-4f71-4f43ea334843@linux.intel.com>
References: <tencent_C70DE4F14F7552DAFC00633507DB5B48F708@qq.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 25 Apr 2026, Haichen Feng wrote:

> The HP Victus 16-r0xxx (board ID: 8BC2) has the same WMI as other Victus
> S boards, but requires quirks for correctly switching thermal
> profile.
> 
> Add the DMI board name to victus_s_thermal_profile_boards[] table and
> map it to omen_v1_thermal_params.
> 
> Testing on board 8BC2 confirmed that platform profile is registered
> successfully and fan RPMs are readable and controllable.
> 
> Signed-off-by: Haichen Feng <2806891994@qq.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index d1cc6e7d1..075d39417 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -213,6 +213,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCD") },
>  		.driver_data = (void *)&omen_v1_thermal_params,
>  	},
> +	{
> +		.matches = {DMI_MATCH(DMI_BOARD_NAME, "8BC2")},

Please place it into the correct place (8BC2 < 8BC[AD]) in the array.

> +		.driver_data = (void *)&omen_v1_thermal_params,
> +	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD4") },
>  		.driver_data = (void *)&victus_s_thermal_params,
> 

-- 
 i.

