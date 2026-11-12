Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516847;
	b=RI/y2pv4pIXZPv0EwzMvtM6jnhZaNAN7iWPahA904yxAHr7auc+Bot/AEMoDhd+jaKHH
	 fGeZiNJIBL9Jf65MgtTVdbRn6HIrqC1D9qXeCIrFDCkh6Ihw8LiZFV6BzBnHRo2Bx8Oor
	 dUU1tYMOVreDyGbgSQKfG+4vmiyZKjnS9YFR8ygYeY7sJ1LttXdM6GwIhYwFbE8mSadDN
	 j0eK4+EiXKyX/JeOUgXQs+o64VAwKE0KHeR5ByUb8MNbjFc/8QcUXeTpcUgKK7b9i6kXp
	 VX/j8jr8ysyLQsCL0CrGjWzOt+FKyXYDhEzKyuFndu0hYQO/VfbsLow4ILzgJOrrGEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516847;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=3mWl5DSuTvnWy0h2ls1NCfIua9/rwmVVE5LGpPkf7D0=;
	b=NvGpK/gSjr9EiCyDyAbvYC1GK3U2fVuyZZ8ZsA/P2ydG05Tipm2mURDsXoNeHmKvTi6Y
	 a77RPyS8160EyItIa5vsnbOePTQ9aniaZkplYzLagQ3oOLn9SXLpkxpAI04L5dj2yquvr
	 6p10ZV7a++TUgJxIB70HOB22QlQ0fU6S2xRuzgmBdwkuIu7UlDmfp/kJZxtuHZDxE4f2J
	 ezmuWRDM4BU3glcg7WHweVAROo2w++AIk4fLc8N3uOcFI4kGT/yCrxgFFg+zsJrrRCfBQ
	 NHbh6GmZfkL4FHYA4yQJJrn3KTuo4cmfhYOR9zzlM5UlliWkS/S8CBHRRbPXIcXyVrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Zt/K322W";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEAC606A31C;
	Thu, 12 Nov 2026 20:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEEAC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zt/K322W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794516847; x=1826052847;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xHK6ula+VTAFn4Hmpzn0u/uLw0J2RO7ovDl+ruyXvbc=;
  b=Zt/K322W6ntvUV7FrDVHw56eQpDNVBJzIPXOO0TUPpyJCj+BsyGkaYqW
   I1XSyj4sPmTVP2qGItmgwC8M/27V7SKgWVVu5VA/BL1zOVt4HYYulW5u0
   95vCVIE1yMZC0U8TSX5dIiGYpguCd7MKRKkoX0SPDMjEuhCC0sS9nMrJ/
   KZ95UK5Ti4TZfxcdikCbv3ehB51ls/4Q771XYHMxjJpnyLiiwUdxaQmU4
   5vefObPI6M5DZzBlFpdpFcCVU1QW+MACXomU1rm3tRHaUbxZI9ha8VKh2
   +GfMv20zpR0roxJItrxFiwebvpZL7GOZnry7xAte5GZHjRJno/t2x9okF
   g==;
X-CSE-ConnectionGUID: +CDI5VfiRI6OtCOVXsiwUQ==
X-CSE-MsgGUID: 8an0XzgwSQqgKkjjEuLWTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3306032"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3306032"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:54:07 -0800
X-CSE-ConnectionGUID: 9xo6y2YmT2uKDRz/TmRliQ==
X-CSE-MsgGUID: Cj/NGy0+Sk+59SZpw77cYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9309090"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:54:03 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 12 Nov 2026 22:53:59 +0200 (EET)
To: Yun Wang <7z0423arsenova@proton.me>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Mingyou Chen <qby140326@gmail.com>, 
    Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, 
    Chris Taraszka <chris@miget.com>, Yu Pan <neko205@aosc.io>
Subject: Re: [PATCH v2] platform/x86: bitland-mifs-wmi: Add Redmi G 2022
 (TM2135) quirk
In-Reply-To: <20261112195915.875137-1-7z0423arsenova@proton.me>
Message-ID: <4ab5da2a-6e4a-4574-9236-2a5ec43a13da@linux.intel.com>
References: <20261112195915.875137-1-7z0423arsenova@proton.me>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Nov 2026, Yun Wang wrote:

> The Redmi G 2022 (board TM2135, BIOS RMGAD6T0P1313) implements only
> three modes: 0x02 for quiet, 0x01 for balanced and 0x03 for performance.
> The default profile table maps balanced to 0x00, but this firmware
> recognizes it as the performance mode. Because the firmware does not
> implement the AC adapter type query, setting balanced-performance or
> performance fails with -ENODATA.
> 
> Add a DMI entry with a three-entry profile table for this model and
> enable skip_ac_type_check. 0x04 is not used for performance: writing it
> succeeds and the value reads back as 0x04, but in three test runs on
> 7.2.11 the firmware did not emit WMI event 0x16, which it emits after
> every other mode change. The Fn+K hotkey also cycles only through the
> three modes above.
> 
> Tested on this machine with this patch and the series it depends on,
> built as an out-of-tree module and loaded on a 7.2.14 kernel. Writing
> low-power, balanced, and performance succeeds, the profile reads back
> correctly, and the firmware emits one 0x16 event for each (values 2, 1,
> and 3). Writing balanced-performance is rejected, and Fn+K cycles
> through low-power, balanced, and performance.
> 
> Claude Code (claude-opus-5-5) analyzed the ACPI tables, wrote the test
> scripts, specified the change and corrected this changelog. I wrote the
> code and the changelog and ran the tests on this machine.
> 
> Link: https://lore.kernel.org/platform-driver-x86/OT2JfRLDi6yHShYvywRZoFBYdW-TUgdKqKtahRM5b0cZxNo6eGZHnO5dKf4oYFaEtZhEsqU-Q-2OFe0D-qToJMVUrS5_d2aa2Q5LD50ISIc=@proton.me/
> Link: https://lore.kernel.org/all/BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKyZahijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=@proton.me/
> Suggested-by: Mingyou Chen <qby140326@gmail.com>
> Tested-by: Yu Pan <neko205@aosc.io>
> Signed-off-by: Yun Wang <7z0423arsenova@proton.me>
> ---
> Changes in v2:
> - Rebased onto review-ilpo-next, which now has Mingyou Chen's merge
>   series (v16) and Chris Taraszka's Xiaomi Book Pro 14 series. The
>   TM2135 entries now follow the TM2424 ones; the added lines are the
>   same as in v1.
> - Added Yu Pan's Tested-by.
> - Retested with this patch on top of review-ilpo-next, built as an
>   out-of-tree module and loaded on a 7.4-rc2 based kernel: the results
>   are the same as described in the changelog.
> 
> v1: https://lore.kernel.org/all/20261106143114.95008-1-7z0423arsenova@proton.me/
> 
>  drivers/platform/x86/bitland-mifs-wmi.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index d834168381..3aac9d17ff 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -128,6 +128,18 @@ static const struct bitland_mifs_quirks tm2424_quirks = {
>  	.skip_ac_type_check = true,
>  };
>  
> +static const struct bitland_profile_entry tm2135_profile_entries[] = {
> +	{ PLATFORM_PROFILE_LOW_POWER,		0x02 },
> +	{ PLATFORM_PROFILE_BALANCED,		0x01 },
> +	{ PLATFORM_PROFILE_PERFORMANCE,		0x03 },
> +};
> +
> +static const struct bitland_mifs_quirks tm2135_quirks = {
> +	.profile_entries = tm2135_profile_entries,
> +	.num_profile_entries = ARRAY_SIZE(tm2135_profile_entries),
> +	.skip_ac_type_check = true,
> +};
> +
>  static const struct dmi_system_id bitland_mifs_dmi_table[] = {
>  	{
>  		.matches = {
> @@ -136,6 +148,13 @@ static const struct dmi_system_id bitland_mifs_dmi_table[] = {
>  		},
>  		.driver_data = (void *)&tm2424_quirks,
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TIMI"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2135"),
> +		},
> +		.driver_data = (void *)&tm2135_quirks,
> +	},

Thanks, but I already took v1 resolving the conflict myself. I used the 
opposite order than you so that the board names are "increasing".

-- 
 i.

