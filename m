Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080294CEE65;
	Mon,  5 Oct 2026 17:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222287; cv=none; b=DbTbmCjrQvTYMTmfRGN6PUviuWyXiWhvMxlsxRFkYN1sPq2JIM7ZPEvUCKRBLrFhWs/rfsEZFcAdYaoyfJ8BbSQkW39XpBrQS2SwBCHoYG7iYKet3+hPU1tNKlmL0p56tzBd48cU4e2FxgEuloUHtPABmeOdCGH7bj0ZfMqkjkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222287; c=relaxed/simple;
	bh=uYeJ+m4DPDsq62TbZO99y21SAk0FOTG2X+2TuN2rIxY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FmiZ0k6eLiyFke8RnKdvczRGgJodjGUHTGDoLR4jU3HlWfAxOngTNqYi66DCSR5T55+l6Glhk6P00IwZsofJd8r8zf5ut0gjXIr4tDagH+MZgEZD82PkH6PBgjxH6DBPYwA91M//AJtXvmQWdh8nmbFUBAByl6qfu/MmeZ647qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPaPiQo2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPaPiQo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791222286; x=1822758286;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uYeJ+m4DPDsq62TbZO99y21SAk0FOTG2X+2TuN2rIxY=;
  b=PPaPiQo2OzvoidZUDzXtJna5Y5NYPK8Cgx43Mha3GLYg99UepQR1nfV3
   81waZPnJ6Y7V15xKk2hrhjMaP2xPtnvNqJsspuqSdigpLS5vpSiORLt7M
   9g32JYw6VZapcVqUiIhHnP7hlcm2gh7kkBvR66gGhMdPHAWBERn3fv1L4
   XSDB4XvzDm39uiA815OEvVgnxPPz14RlJaaeY/MTZIL3DUnOuy/1IKWbE
   rrYqJjJHGUz1vLv5DiVyEpDjUTsqnGU15y4q8hly/cLKaBGYuw/Myd88K
   ue0QHxHx/wxTzKNQ3BGD86rRd+rDpHGARY9rqhgrtDmAQv3wttjL/3sIf
   g==;
X-CSE-ConnectionGUID: +JG/IOjuTp+RFp+JgzrKPQ==
X-CSE-MsgGUID: J2/BohW3QPS7xHASL1T26A==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90960214"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="90960214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:44:46 -0700
X-CSE-ConnectionGUID: ZuvLbBj7S5uAJTqlenCK7A==
X-CSE-MsgGUID: RBLuL9o9ScGc6vkJm/xMvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="306387405"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:44:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 Oct 2026 20:44:38 +0300 (EEST)
To: Marco Scardovi <scardracs@disroot.org>
cc: Hans de Goede <hansg@kernel.org>, Denis Benato <denis.benato@linux.dev>, 
    Luke Jones <luke@ljones.dev>, Corentin Chary <corentin.chary@gmail.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: asus-armoury: add power limits quirk for
 FA608UH
In-Reply-To: <20260919052944.24252-1-scardracs@disroot.org>
Message-ID: <d37a8b62-a97f-29d0-24d2-48588e2a7aec@linux.intel.com>
References: <20260919052944.24252-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 19 Sep 2026, Marco Scardovi wrote:

> add power limits quirk entry for ASUS FA608UH laptop.
> The limits are extracted from the device's ThrottleGear XML configuration.
> 
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
>  1 file changed, 31 insertions(+), 0 deletions(-)
> 
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -713,6 +713,37 @@
>  			},
>  		},
>  	},
> +		{
> +			.matches = {
> +				DMI_MATCH(DMI_BOARD_NAME, "FA608UH"),
> +			},
> +			.driver_data = &(struct power_data) {
> +				.ac_data = &(struct power_limits) {
> +					.nv_dynamic_boost_max = 15,
> +					.nv_dynamic_boost_min = 10,
> +					.nv_temp_target_max = 87,
> +					.nv_temp_target_min = 75,
> +					.ppt_pl1_spl_max = 90,
> +					.ppt_pl1_spl_min = 15,
> +					.ppt_pl2_sppt_max = 90,
> +					.ppt_pl2_sppt_min = 35,
> +					.ppt_pl3_fppt_max = 90,
> +					.ppt_pl3_fppt_min = 35,
> +				},
> +				.dc_data = &(struct power_limits) {
> +					.nv_temp_target_max = 87,
> +					.nv_temp_target_min = 75,
> +					.ppt_pl1_spl_def = 45,
> +					.ppt_pl1_spl_max = 65,
> +					.ppt_pl1_spl_min = 15,
> +					.ppt_pl2_sppt_def = 54,
> +					.ppt_pl2_sppt_max = 65,
> +					.ppt_pl2_sppt_min = 35,
> +					.ppt_pl3_fppt_max = 65,
> +					.ppt_pl3_fppt_min = 35,
> +				},
> +			},
> +		},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "FA608UM"),

Hi,

This won't work.

You're touching what is effectively the same place in the file in 
different patches that are not in a proper series, please don't do that.

If you're sending multiple of these next to each other, just make a proper 
series out of them, and if you have something pending I've not yet applied 
and end up needing to touch again the same place, send a new version of 
the existing series so I can just ignore the old one instead of having to 
figure out what's the correct order for applying things cleanly.

It's also much easier for me to apply 4 changes that are in a series than 
4 individual patches so as long as it's even remotely logical as a set of 
patches you should always prefer series over sending n individual patches 
to the same driver almost back to back.

I've stopped processing the remaining 4 entries and dropped them from my 
queue, please resend them as a series.

-- 
 i.

