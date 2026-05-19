Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AAF3ED3BF;
	Tue, 19 May 2026 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199114; cv=none; b=h4kf7dVPEZeFZA2JMzTcKfAvy68jlxr5Mbvsnb97wtoawBk44dxb8y448VU3hwaEB+/nWxNQtdkmrNKWIBkAivR23wMT56k5M8+djPG8apx/lRxmJpynOMh7lAc1B/5lyOFr3wlEK1+HGF/0M4vDlFjMznIFeLHptloEU/y6Uu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199114; c=relaxed/simple;
	bh=xYPfb8j49SZYO9HzJea+iFMdPFT06oUvLrSimk8X714=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DW2TO1xFgYxxOPpnxiSJwvCSerSrhb5OoM115mmCDnGHWS1Q0tLS/qCveVfFWmaq3nkWwLpnuHgX1cttN2fA6DrBN57hdW0rHbg7jidXvWBGhdVCn1SzGpW5B2jkD5kNOb+yLmFF8Bpf43jvNRP+uKFWhn6tvHbzBgeItIaDJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKDrh0Nv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKDrh0Nv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779199112; x=1810735112;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xYPfb8j49SZYO9HzJea+iFMdPFT06oUvLrSimk8X714=;
  b=PKDrh0NvIDceTnogv5GKVD4UYh04bi2fHvnwkdinH+maSLVC71VQpitv
   AbPcJNdlNdH9iTe4VxI8GTy6Ko15jN12TldfkMA9cLnBH+78a7zM8qD7C
   wvlRHnpOVeZxsdlUN0T1leuFX7di9xCvt9C3OHZE3wgtUrZns+Q9H+stK
   CmDmIlQj5zEI1/qnFCzw5HygCo1YZTaIfYieXgJ3OsJqLvKrW1t7VmFsq
   adn+darkInUXAVdn0vXg7OzgxPJjRunvDvHaFatzhnXfw66hY5i2sxipG
   QvMwFWP0q57vOwKtMhDFKgrwSArsHmSVxi3VVbtpjXleHFDPxcuBLfAMp
   A==;
X-CSE-ConnectionGUID: QDZI8vEmS8a4kdQ5pIqS9g==
X-CSE-MsgGUID: vxhV82aQS5mA94woTOI72A==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80107435"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80107435"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 06:58:31 -0700
X-CSE-ConnectionGUID: SVCzvbN3QlaOgLhMKtZQKQ==
X-CSE-MsgGUID: wJ9Pv92vT429JBP9rp6oFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="236766306"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 06:58:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 May 2026 16:58:25 +0300 (EEST)
To: foobisdweik <dweikmferris@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] platform/x86: hp-wmi: Add support for Omen 16-b1xxx
 (8A13)
In-Reply-To: <20260513193916.84673-2-dweikmferris@gmail.com>
Message-ID: <c3873f59-eeb0-e596-94ea-462afb863aa0@linux.intel.com>
References: <20260513193916.84673-1-dweikmferris@gmail.com> <20260513193916.84673-2-dweikmferris@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 May 2026, foobisdweik wrote:

> Add board name 8A13 (OMEN by HP Laptop 16-b1xxx, 12th-gen Intel/RTX 30
> series) to the Omen thermal-profile, timed-thermal-profile, and Victus-S
> DMI lists.
> 
> The 8A13 firmware exposes the standard Omen "PerformanceControl" WMI
> feature, uses the legacy EC thermal-profile offset (0x95), and
> implements the Victus-S-style GM2D/GM2E WMI methods at EC offsets
> 0xB0..0xB3 (RPM1..RPM4 tach) and 0x34..0x35 (SRP1/SRP2 setpoints).
> This makes it identical in interface to its same-era sibling 8A44
> (Omen 16-n0xxx), so reuse omen_v1_legacy_thermal_params.
> 
> After this change /sys/firmware/acpi/platform_profile reports
> cool/balanced/performance and the hp hwmon device exposes per-fan
> tachs plus the manual-mode pwm control on Omen 16-b1xxx.
> 
> Signed-off-by: foobisdweik <dweikmferris@gmail.com>

Hi,

Thanks for the patch, but we're not allowed to take in patches with sign 
off lines using nicknames or pseudo names (please see 
Documentation/process/submitting-patches.rst).

> ---
>  drivers/platform/x86/hp/hp-wmi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 24c151289dd3..389506a6d2e3 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -157,7 +157,7 @@ static const char * const omen_thermal_profile_boards[] = {
>  	"886B", "886C", "88C8", "88CB", "88D1", "88D2", "88F4", "88F5", "88F6",
>  	"88F7", "88FD", "88FE", "88FF",
>  	"8900", "8901", "8902", "8912", "8917", "8918", "8949", "894A", "89EB",
> -	"8A15", "8A42",
> +	"8A13", "8A15", "8A42",
>  	"8BAD",
>  	"8C58",
>  	"8E41",
> @@ -177,7 +177,7 @@ static const char * const omen_thermal_profile_force_v0_boards[] = {
>   * "balanced" when reaching zero.
>   */
>  static const char * const omen_timed_thermal_profile_boards[] = {
> -	"8A15", "8A42",
> +	"8A13", "8A15", "8A42",
>  	"8BAD",
>  };
>  
> @@ -189,6 +189,10 @@ static const char * const victus_thermal_profile_boards[] = {
>  
>  /* DMI Board names of Victus 16-r and Victus 16-s laptops */
>  static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A13") },
> +		.driver_data = (void *)&omen_v1_legacy_thermal_params,
> +	},

I'll soon be pushing out review-ilpo-fixes branch, which will add 8902 
here. In order to avoid conflict with it, please base this change on top 
of it.

>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
>  		.driver_data = (void *)&omen_v1_legacy_thermal_params,
> 

-- 
 i.

