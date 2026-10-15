Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC8F522693;
	Thu, 15 Oct 2026 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069984; cv=none; b=WZ+jfausR0EzTbeKpBBU+ZtJDatp9j9acMyasJikELcwTKn+7bQhxeZTqib4lTFIjnAHo2eQi9S0/csGU8QV0HpWxDreU7I8mFbYZIhR7FoxcT/A3DWlzc2aRixmVscZn7hjOFB6fWSeEbfRnO4aGK/3FqN2L3JAdle3klMdTNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069984; c=relaxed/simple;
	bh=zwJoTiaHJkQ5LAw4a3wrOsGuZ+iFglC9UvJFSjQGIck=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=H47imzlnL00PeyXCYpcHOzetMwGTLdtAhF/Hlhcr3ndlEoqKfM61AaV9doJDXFRcT57JehWAY8qilWkLlC+Qj3q9rLMfIn1dUkyRsMCWJHQzHywu5WqH2T+ZU2qPyZxSOxuexzGDT8g3tC6CQOUPT+ZJTOj0+hG8HVhDUwbOZK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUOQzIL9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUOQzIL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792069983; x=1823605983;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zwJoTiaHJkQ5LAw4a3wrOsGuZ+iFglC9UvJFSjQGIck=;
  b=IUOQzIL9nm6brXcZzc2HvuTewmy+fGdj60s/4dfgAkIWkOhAL/NWO3ZR
   vML7G2TpYCUIZkA1gLpX7sBoA4ll4fwO+8gkhXxB7jNul/OJAGMbOWzuS
   n0J9Ak5Hqier1GT2noBY2ZTuDNFxZA8zRziZHohmgUtLFHQdrBr4yIYyz
   GI7XKphfEzgOsnCicMWPwkgndSkNFuQOfcZJVEY4XJjdOp88SpUFiKOL7
   Zuml7L97KJGID6gLkNAQlbZDBH1u1NLCK3aLpj7vBjPHRTLj2zQrlyUTC
   107AN3qY0GgcurTEX5b3nK5WYfumaP1TlyQ0Z/sR7532LGe9gF4akeBb1
   A==;
X-CSE-ConnectionGUID: 9arGS/aARYS0HTdXyUMynA==
X-CSE-MsgGUID: 2M6NkXocQyq0nDJO1a2gfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="859871"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="859871"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 06:13:02 -0700
X-CSE-ConnectionGUID: +PU7XH6bTgKmZtMFVHo/rA==
X-CSE-MsgGUID: om8seBPGQlGMkCXZjDvRrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1655170"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 06:12:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Oct 2026 16:12:55 +0300 (EEST)
To: "Pavel Kossenko (kotekompotek)" <kotekompotek@gmail.com>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] platform/x86: asus-laptop: Add WiMAX rfkill switch
 for Pegatron Lucid
In-Reply-To: <20261010193837.1120-3-kotekompotek@gmail.com>
Message-ID: <9dc32782-10b0-9b64-32de-18324a91d874@linux.intel.com>
References: <20261010193837.1120-1-kotekompotek@gmail.com> <20261010193837.1120-3-kotekompotek@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 11 Oct 2026, Pavel Kossenko (kotekompotek) wrote:

> On the Pegatron Lucid the ATK methods ENPR and DAPR enable and disable
> a radio selected by an id. The driver exposes ids 0-2 (WLAN, Bluetooth,
> WWAN) as the pega-wlan, pega-bt and pega-wwan rfkill switches, but the
> DSDT also implements id 6, which drives GPIO27 and the EC bit WMHD:
> 
>   If ((Arg0 == 0x06)) { GP27 = Zero; WMHD = Zero; ALED (One) }
> 
> The firmware leaves GPIO27 high at boot. On units fitted with an Intel
> Centrino Advanced-N + WiMAX 6250 combo card (8086:0087, subsystem
> 8086:1301) this keeps the whole card in hardware RF-kill, so Wi-Fi is
> unusable even though pega-wlan is unblocked:
>
>   iwlwifi 0000:02:00.0: reporting RF_KILL (radio disabled)

And what will happen due to your patch if the unit is not fitted with 
the mentioned card?
 
> The same card works under Windows, presumably because the vendor
> utility calls ENPR(6).
> 
> Register a "pega-wimax" rfkill switch for id 6. The rfkill core applies
> the default unblocked state on registration, which calls ENPR(6) and
> releases the card:
> 
>   iwlwifi 0000:02:00.0: RF_KILL bit toggled to enable radio.
> 
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Pavel Kossenko (kotekompotek) <kotekompotek@gmail.com>
> ---
>  drivers/platform/x86/asus-laptop.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
> index 8e69f02..ef4c2cc 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -192,6 +192,7 @@ MODULE_PARM_DESC(als_status, "Set the ALS status on boot "
>  #define PEGA_WWAN	0x02
>  #define PEGA_ALS	0x04
>  #define PEGA_ALS_POWER	0x05
> +#define PEGA_WIMAX	0x06
>  
>  #define METHOD_PEGA_READ	"RDLN"
>  #define PEGA_READ_ALS_H	0x02
> @@ -1454,6 +1455,17 @@ static int pega_rfkill_init(struct asus_laptop *asus)
>  
>  	ret = pega_rfkill_setup(asus, &asus->wwan, "pega-wwan",
>  				PEGA_WWAN, RFKILL_TYPE_WWAN);
> +	if (ret)
> +		goto exit;
> +
> +	/*
> +	 * The firmware leaves this line asserted at boot. On units fitted
> +	 * with an Intel Centrino Advanced-N + WiMAX 6250 combo card it keeps
> +	 * the whole card in hardware RF-kill, Wi-Fi included. Registering
> +	 * the switch unblocks it by default, which calls ENPR(6).
> +	 */
> +	ret = pega_rfkill_setup(asus, &asus->wimax, "pega-wimax",
> +				PEGA_WIMAX, RFKILL_TYPE_WIMAX);
>  
>  exit:
>  	if (ret)
> 

-- 
 i.

