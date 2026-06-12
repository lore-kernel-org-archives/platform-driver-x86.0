Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2CA22332E;
	Fri, 12 Jun 2026 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781265777; cv=none; b=n+S5HgxugUMeWpJPzgSaSi+479QM8L5oi/ugQhEzgiD6TDKt81O2TunDs7+gSy2dG8amIOmQkyZTpP+e1HtU8CMx9eQX5EnV961BDNQGA2cMhUrln7geT5o3ajd683eaeN60GK8FaswjTV8sujXtK69qpAGXSb2tlL6y/7tX3WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781265777; c=relaxed/simple;
	bh=zvHOTDfnLWYFWzxLlQCIBfHK5ZuxrsIA+vrD2ADurZA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fsn6ktZM7TD5ELsUb/cfv2DF4DiV5+MZ/aQjZynwStHURUdGxQXOg6sXfviMgd9NmwSuzoso54+OP5g1Rk1ClCBiluPev77mRg1nLnXGC7T40m3R1xfgBfXhb64LZsyCMlI9o5Ftu+JYWegCDx1uJ6GBadkOYOINcQxfafr3lww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1gYGrkL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1gYGrkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781265777; x=1812801777;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zvHOTDfnLWYFWzxLlQCIBfHK5ZuxrsIA+vrD2ADurZA=;
  b=c1gYGrkLESofNjSdNtXKLPryhZa1INUcaKqdW2mSibHOSs+RTCvUuqPn
   BFix0hGaqEr0LfjBT/4AaXLv9ed1umyljTQweD5G0kKJOBlf1XP1eKeOs
   mn2GBCAaogRRbnHx5Gilig63qrbavmT/4b1jb53h3ZaqZg1bI2n8kJgWi
   HGK4Zz1aLbNrXWsnA1d4d2b3Il+oFK0XtFNBADDmOwE39Nf04BK5I+TO3
   htVY5E4mlSGdMJv2ca9lBBgnNcH2OduP2l2EamkG5VmL+pYAXNPcJ1w9N
   8W6U4+7wwlUO3RpAXUvpAF92v9s7YHpgo/IhKDtfB7Mm3TYB5NR4vAfsA
   Q==;
X-CSE-ConnectionGUID: DwqKSrqBR+CtNDuehlSTNQ==
X-CSE-MsgGUID: roPb2mjSRQ+Mp4f51qaHDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69640731"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="69640731"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 05:02:56 -0700
X-CSE-ConnectionGUID: gdVTycTtRXyYZWwfeyzSxQ==
X-CSE-MsgGUID: 6pSrcEyVR3eZ1XqEyUYj5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="270848138"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 05:02:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 12 Jun 2026 15:02:48 +0300 (EEST)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: asus-armoury: add support for
 FX608JPR
In-Reply-To: <20260612115628.964152-4-denis.benato@linux.dev>
Message-ID: <670fcc2d-287e-1e7d-2f31-788fa1d91a6b@linux.intel.com>
References: <20260612115628.964152-1-denis.benato@linux.dev> <20260612115628.964152-4-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Jun 2026, Denis Benato wrote:

> Add TDP data for laptop model FX608JPR.
> 
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/platform/x86/asus-armoury.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index 39edc0114b11..9370acc755f4 100644
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -909,6 +909,34 @@ static const struct dmi_system_id power_limits[] = {
>  			.requires_fan_curve = true,
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "FX608JPR"),

>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "FX607VU"),

Shouldn't FX608JPR come after FX607VU?

You might have to violate the strict alphanumeric order in some cases 
where the name is a strict subset of the other as the first matching one 
is picked from the array. But for other cases, keeping things in order 
will be easier.

-- 
 i.

