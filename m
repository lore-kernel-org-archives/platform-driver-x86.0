Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429DE28DA1;
	Mon, 23 Dec 2024 19:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734981351; cv=none; b=XGkV3qRrGo82nkhYGpOjgSXbNounz6DTS/x40v5dt2TEdVyoOgpvDjlCj7rNRPfVUmB3G3Me5mSHKQr2GsAdTBfx+4+qj1nu7q6Il8QeVQ/266+3pxrNhd1tzJ0kws1XPw5CF4m88dfEXdzNBXQra+S4e+bLhd3fm5SPcTBXzvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734981351; c=relaxed/simple;
	bh=BOgtcRM2W/4AueunHohWxs4rEggabVTdXbv+JRC70c8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PbsuUwT1uThW9cqZGqYQjvzHQfxRbuJfxL81hjzPq3SRKzG99CTGdzm5EwhvhfnW7LJe4/LoJ5vcege8PPKM9S3P1KpyRF0xpSHwtGBLSqEPzsX3gUP8z1FoIGcJYQeOcJnm4usyUgL4jqIO3WN6o1hxUOHiultaQmrumqJ/GlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SM3Zbp09; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SM3Zbp09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734981350; x=1766517350;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BOgtcRM2W/4AueunHohWxs4rEggabVTdXbv+JRC70c8=;
  b=SM3Zbp09rzZ2rR87WZe1OCMU2WrddI70usyUOf+rQUnmMkQcQcsi6AHS
   0sRQjSRwMYd32hzPJuRnQkwKOJopOEWRHwXj4ZYUUPf1ofGlTOmwBrxuh
   pHk4/BN78nL47gqDy3S+mTND3vqEErDsb8id5bGKClTFAhgdy1CAzyfQn
   BVSOSJJHZ4pHHibyQKRWvs/fpNLBs4+2KGpkjKriS4FxN//AxPY8uvMXA
   I2QUzSBltGdJiiGaDSfX4QaicIiXQM7C82iUMD4DfPxBDpW/s1VYED7Y/
   iGpPGdPm5Nn46x+DYuH3+k0kFTXAU+EelKxUbU+RNFfqljaq1IO30kvH5
   A==;
X-CSE-ConnectionGUID: JTukz/EXRJGvXR/CsYYV7g==
X-CSE-MsgGUID: JYZ07AsESLGKE6ZTIavRsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="39394821"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="39394821"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 11:15:49 -0800
X-CSE-ConnectionGUID: CjZ8+x7pR0m87N9N1huJNA==
X-CSE-MsgGUID: sihLN/spT4e2thN38URYlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136596246"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 11:15:45 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Dec 2024 21:15:42 +0200 (EET)
To: Mingcong Bai <jeffbai@aosc.io>
cc: Alexis Belmonte <alexbelm48@gmail.com>, 
    Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Kexy Biscuit <kexybiscuit@aosc.io>, xiaoxi404 <1577912515@qq.com>, 
    Ai Chao <aichao@kylinos.cn>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: mark 8A15 board for timed OMEN
 thermal profile
In-Reply-To: <20241223100748.2157703-1-jeffbai@aosc.io>
Message-ID: <31f0819a-1a56-8f40-b898-76ed113ef545@linux.intel.com>
References: <20241223100748.2157703-1-jeffbai@aosc.io>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Dec 2024, Mingcong Bai wrote:

> From: xiaoxi404 <1577912515@qq.com>
> 
> The HP OMEN 8 (2022), corresponding to a board ID of 8A15, supports OMEN
> thermal profile and requires the timed profile quirk.
> 
> Upon adding this ID to both the omen_thermal_profile_boards and
> omen_timed_thermal_profile_boards, significant bump in performance can be
> observed. For instance, SilverBench (https://silver.urih.com/) results
> improved from ~56,000 to ~69,000, as a result of higher power draws (and
> thus core frequencies) whilst under load:
> 
> Package Power:
> 
> - Before the patch: ~65W (dropping to about 55W under sustained load).
> - After the patch: ~115W (dropping to about 105W under sustained load).
> 
> Core Power:
> 
> - Before: ~60W (ditto above).
> - After: ~108W (ditto above).
> 
> Add 8A15 to omen_thermal_profile_boards and
> omen_timed_thermal_profile_boards to improve performance.
> 
> Signed-off-by: xiaoxi404 <1577912515@qq.com>
> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>

Hi,

I wanted to apply this but the first signed-off-by line threw me off. It 
should contain person's name before the email address line like yours does 
(assuming the first signed-off-by is necessary in the first place, the 
patch itself looks quite trivial given it's just about adding one ID).

-- 
 i.

> ---
>  drivers/platform/x86/hp/hp-wmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 81ccc96ffe40..20c55bab3b8c 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -64,7 +64,7 @@ static const char * const omen_thermal_profile_boards[] = {
>  	"874A", "8603", "8604", "8748", "886B", "886C", "878A", "878B", "878C",
>  	"88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2", "88F4", "88FD",
>  	"88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901", "8902", "8912",
> -	"8917", "8918", "8949", "894A", "89EB", "8BAD", "8A42"
> +	"8917", "8918", "8949", "894A", "89EB", "8BAD", "8A42", "8A15"
>  };
>  
>  /* DMI Board names of Omen laptops that are specifically set to be thermal
> @@ -80,7 +80,7 @@ static const char * const omen_thermal_profile_force_v0_boards[] = {
>   * "balanced" when reaching zero.
>   */
>  static const char * const omen_timed_thermal_profile_boards[] = {
> -	"8BAD", "8A42"
> +	"8BAD", "8A42", "8A15"
>  };
>  
>  /* DMI Board names of Victus laptops */
> 
