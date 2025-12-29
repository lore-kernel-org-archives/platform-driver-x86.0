Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C7C212F98;
	Mon, 29 Dec 2025 10:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767005094; cv=none; b=ldmbMmHNcEV0hsk6UJ6J1SETX0PSJ/gek6EfwFJj88SRwDwQ3zEptfCUOb6ceBo0UMa8CWlN3RacqOtHKlcK2i6vTeys08PxywrFmMxQzYISp9gmZlnGLRFJkzMwiIWYPv7+WGSDVuBxQwAXKLmc3zgGH6JTzuoeonlxOcVEjV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767005094; c=relaxed/simple;
	bh=ADSHyaH3l1QMtFLxEB68EIhbsz5LetaH9PG9L4gdXcE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o4pYFDtkzhgvB+dE6ATRceCk4hXDGDheiTa28f+RWMEtmr7K4hX38hmSWCQzCOrQ+2Dk5t/vJYMHkcjM95kqRVxwzJ76CZlXbRBsIEB9j69dEXIf8CKt3vTgHMYv2n9xfyQqi1PBkvAWuU/G23yj63OxBxBnlh5G9fdEZCjTplU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKfzXan/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKfzXan/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767005092; x=1798541092;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ADSHyaH3l1QMtFLxEB68EIhbsz5LetaH9PG9L4gdXcE=;
  b=oKfzXan//qMr3k8dtUKAbS0TWdFPYbpQt91hEVYlhS/Ry82PFmyGdQFD
   ee5TF170NVU21l9KrLn3m94eIlKcQ8Q2Yy8aRCh45N7MHfCy/b23JCaof
   kjOK6s74lp31R+XflZhCJ1jq90RahWPobhUXQi4I9Q1hhnc7cGTSmL84I
   PqbS0uu047QjD///AkAiyLrIHvBkHBk9TAkfavWfAhC8OXhHxCSdZo2Sf
   yV5SWFDmN1k7BdMbftyAlQQAkBukZykWtghto6OmmlbEBWuNN+iVCrH6y
   T8AB2j4tZ9JOHGP13tA1FKoHfQpqsrHlCbrWOu2iq0efNVo0k3jB/3gdq
   g==;
X-CSE-ConnectionGUID: ThJaReVoS02m5+7kCveLjQ==
X-CSE-MsgGUID: zIVUuIgVQLOAiF0fqr38Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="72238677"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="72238677"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:44:52 -0800
X-CSE-ConnectionGUID: fX8gfYzoSgqggBPQQlKPNA==
X-CSE-MsgGUID: 3yg0zviCTbmQmR+yl0mNaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="200791517"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:44:49 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 12:44:45 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-armoury: fix ppt data for FA507R
In-Reply-To: <20251224230726.1836388-1-denis.benato@linux.dev>
Message-ID: <a94abbbd-523a-6a02-e85c-5e6f9c59f921@linux.intel.com>
References: <20251224230726.1836388-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Dec 2025, Denis Benato wrote:

> PPT data for FA507R was reported to be wrong by a user:
> Change limits to make them equal to Armoury Crate limits.
> 
> Signed-off-by: Denis Benato <denis.benato@linux.dev>

Fixes tag missing.

-- 
 i.

> ---
>  drivers/platform/x86/asus-armoury.h | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index a1bb2005c3f3..ad23718b4298 100644
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -449,12 +449,27 @@ static const struct dmi_system_id power_limits[] = {
>  			.ac_data = &(struct power_limits) {
>  				.ppt_pl1_spl_min = 15,
>  				.ppt_pl1_spl_max = 80,
> -				.ppt_pl2_sppt_min = 25,
> +				.ppt_pl2_sppt_min = 35,
>  				.ppt_pl2_sppt_max = 80,
>  				.ppt_pl3_fppt_min = 35,
> -				.ppt_pl3_fppt_max = 80
> +				.ppt_pl3_fppt_max = 80,
> +				.nv_dynamic_boost_min = 5,
> +				.nv_dynamic_boost_max = 25,
> +				.nv_temp_target_min = 75,
> +				.nv_temp_target_max = 87,
> +			},
> +			.dc_data = &(struct power_limits) {
> +				.ppt_pl1_spl_min = 15,
> +				.ppt_pl1_spl_def = 45,
> +				.ppt_pl1_spl_max = 65,
> +				.ppt_pl2_sppt_min = 35,
> +				.ppt_pl2_sppt_def = 54,
> +				.ppt_pl2_sppt_max = 65,
> +				.ppt_pl3_fppt_min = 35,
> +				.ppt_pl3_fppt_max = 65,
> +				.nv_temp_target_min = 75,
> +				.nv_temp_target_max = 87,
>  			},
> -			.dc_data = NULL,
>  		},
>  	},
>  	{
> 
