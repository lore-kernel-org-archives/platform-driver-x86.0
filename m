Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894FB308F23;
	Mon, 29 Dec 2025 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013759; cv=none; b=MWgDdhVJ25Iix1Wjpa6NEUu2rjj0v/GdL/dM70SibWGfE/CojTPZZejHmFIoW6/qrztGkj0gm4W0xtM3NLt25iXXPxN1oFrLd3Zj5/TdK+5NXTXV0ye3mDEX6RD00aqCr4SW/5hzWr3QHZArYWyaFfTDwQtFos73fwa+UGT5jvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013759; c=relaxed/simple;
	bh=xgAYdifhQ8Wv9PzIzWqliR2fKFS0Lr6e95a/o/NB5Mk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t75huUR6wmQ5bm4gNafh3dMpltmu9WUQf3zmPnn9p3IaTAOkR/Io+GWRbkjRiEL1Hq7m2ZgnrScGZ4s7JPUMT4PaeICZA+1aiELRx0cgVF6czb5xJhhfKNaKRPPnS1y8BR8dve4H3g2XLyMe2Iom/9ATfSaimwyrkK/heWG1yrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNoKHbl7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNoKHbl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767013757; x=1798549757;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xgAYdifhQ8Wv9PzIzWqliR2fKFS0Lr6e95a/o/NB5Mk=;
  b=FNoKHbl75K7UYmrAMQ13OVXZ1nGXPQPjGB/49AunRzjZ4P6gnBnQbuI3
   QsJh3WjYAZtlf+tphQwdmgDJlwIPAarHN3EoEcjUkNeSLShc6bA1M4D2u
   DO7DZPUSQkJesJ8e9gRWPUaiVdmv9WKEWfz8mmyET/pKMwLOFsLKDGkgs
   88desrTs4SxJHH/r/Ok+Ls1hfX0FEh5h1TOisicgmAQM9KnETk3ZKnJAg
   P8dzFzjH8iBdBij28thfvDmessMuYz6bFDI4qIQ9xJKBy63YWV92CyVmu
   VMOipBrswWyQtG2Z52SIW9iDqKj7x/jX5IqIRkiLyo30rXKC52hpOvRMD
   Q==;
X-CSE-ConnectionGUID: AxOOMjVTTIyjr3nvy+Egug==
X-CSE-MsgGUID: ITsshcw/TliN8a423zoxGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="86047938"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="86047938"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 05:09:17 -0800
X-CSE-ConnectionGUID: 2FOUK/s/SDGT05AIqyLm8g==
X-CSE-MsgGUID: n/A3m7cjQQCTN8AEibO83Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="205818209"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 05:09:14 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 15:09:11 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for GU605CR
In-Reply-To: <20251225023841.1970513-1-denis.benato@linux.dev>
Message-ID: <491d2182-930c-46fd-20f6-5d6e7f5ffeb7@linux.intel.com>
References: <20251225023841.1970513-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Dec 2025, Denis Benato wrote:

> Add TDP data for laptop model GU605CR.
> 
> Signed-off-by: Denis Benato <denis.benato@linux.dev>

Hi Denis,

I've applied these 4 to the review-ilpo-fixes branch, but next time please 
please make them a series instead of sending 4 very similar ID addition 
changes to the same file independently.

A series is easier for me to apply as a whole than 4 patches individually. 
Also, series won't cause some messy misapplication as easily as individual 
patches that can be applied in order different from what was used by the 
submitter to create them (it seems there were no context conflicts with 
these but I had to check that == extra work for me).

-- 
 i.

> ---
>  drivers/platform/x86/asus-armoury.h | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index a1bb2005c3f3..d8814165d480 100644
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -950,6 +950,35 @@ static const struct dmi_system_id power_limits[] = {
>  			},
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "GU605CR"),
> +		},
> +		.driver_data = &(struct power_data) {
> +			.ac_data = &(struct power_limits) {
> +				.ppt_pl1_spl_min = 30,
> +				.ppt_pl1_spl_max = 85,
> +				.ppt_pl2_sppt_min = 38,
> +				.ppt_pl2_sppt_max = 110,
> +				.nv_dynamic_boost_min = 5,
> +				.nv_dynamic_boost_max = 20,
> +				.nv_temp_target_min = 75,
> +				.nv_temp_target_max = 87,
> +				.nv_tgp_min = 80,
> +				.nv_tgp_def = 90,
> +				.nv_tgp_max = 105,
> +			},
> +			.dc_data = &(struct power_limits) {
> +				.ppt_pl1_spl_min = 30,
> +				.ppt_pl1_spl_max = 85,
> +				.ppt_pl2_sppt_min = 38,
> +				.ppt_pl2_sppt_max = 110,
> +				.nv_temp_target_min = 75,
> +				.nv_temp_target_max = 87,
> +			},
> +			.requires_fan_curve = true,
> +		},
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "GU605CW"),
> 
