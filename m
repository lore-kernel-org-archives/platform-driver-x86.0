Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5A7419FB2;
	Fri, 16 Oct 2026 08:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139825; cv=none; b=LJ1i8h6+GZz7aUvaPwwl+0YjFhVcQs9sIE2fMzRYPLiI/9YtjfT6KI0OyBsj79S+k1Nq4+rK0FBCV4Y28fA/j+4iDvm3Ox/KlZJYvcvm/WYaCBX5ikorSTJ2T91voQYAQekIAAi4F0CbD3xZBnb9CjrDYHEb7YfspSIsRDpCHTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139825; c=relaxed/simple;
	bh=CxzDJvVUAzYb1RS3B8JQr3TpIQGDimakH/FJC66fDvo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WBzwBeEmtWT9jncN2/l+7WjW/T7ZUpj6qBzIr7wLDNpdPwYXDUSbSBaILLfbpln8QswC3n4/VZ0bly0UudAq27OZaeL0D8/Dl6YRaKT6WhcWNB8DWMcAMHWEdoItvLxhxbVagjuH+OLbYaQqB7Oi6xjFx8HYp+KQp5yRsQpUKeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLNXKZ32; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLNXKZ32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792139823; x=1823675823;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CxzDJvVUAzYb1RS3B8JQr3TpIQGDimakH/FJC66fDvo=;
  b=JLNXKZ32/ySb7ZUT+3kP9gQEYfVaeeDiffec/E9eg24ZSwicVfpFCf1V
   ldP4Ay5wUbwdlWKnwvKo2pYWUF/kIzgVlXmHa9EAnkcBYk0AunQqFCHX4
   8+tICBIBwH0ZuFoy0hVr6gUgcuYsfRK5Io8uqN/Bl6kjwKd5FpeKNCCl5
   uk62NUgCW2yWs1hpIuPpXHR/xdOIuL9LfqZQDkfiuprz62cMYXYGOyrGF
   +mvUnBMChLmUisXLV7FofrLwOjZrK0xkzuZjAFP2bZYKaFPtx+AkDZon1
   V9n+qor7ipX+JYY3bRaYmDp7pnhmbu8GHUzCo+u2qA3sPO5v9z0EUp0Au
   A==;
X-CSE-ConnectionGUID: AN8P3oymRf6j80v1w84+9g==
X-CSE-MsgGUID: wS2AgJCUTbGFYwo7WdVlIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="825879"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="825879"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 01:37:02 -0700
X-CSE-ConnectionGUID: pUT1RhQLQsacTReH/njzZg==
X-CSE-MsgGUID: XqJ8NXbfQZuIkugI61BEaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1965176"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.34])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 01:36:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 16 Oct 2026 11:36:53 +0300 (EEST)
To: Marco Scardovi <scardracs@disroot.org>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] platform/x86: asus-armoury: add power limits quirk
 for G713QR
In-Reply-To: <20261015181850.170862-2-scardracs@disroot.org>
Message-ID: <39b7adda-585e-f9f4-2ca6-26959085e688@linux.intel.com>
References: <20261015181850.170862-1-scardracs@disroot.org> <20261015181850.170862-2-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Oct 2026, Marco Scardovi wrote:

> add power limits quirk entry for ASUS G713QR laptop.

Please write changelog with proper English, so follow the correct 
capitalization (and punction, etc. rules).

Don't leave lines short like this. Either reflow it as paragraph or make 
the next part truly an own paragraph with an empty line in between.

> The limits are extracted from the device's ThrottleGear XML configuration.
> 
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/platform/x86/asus-armoury.h | 13 changes(+/-)
>  1 file changed, 13 insertions(+), 0 deletions(-)
> 
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -1130,6 +1130,19 @@
>  			.requires_fan_curve = true,
>  		},
>  	},
> +		{
> +			.matches = {
> +				DMI_MATCH(DMI_BOARD_NAME, "G713QR"),
> +			},
> +			.driver_data = &(struct power_data) {
> +				.ac_data = &(struct power_limits) {
> +					.ppt_pl1_spl_max = 80,
> +					.ppt_pl1_spl_min = 15,
> +					.ppt_pl2_sppt_max = 80,
> +					.ppt_pl2_sppt_min = 15,
> +				},
> +			},
> +		},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "GA401IHR"),
> 

-- 
 i.

