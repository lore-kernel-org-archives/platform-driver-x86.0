Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9DD35979;
	Sun, 19 Jul 2026 22:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784498440; cv=none; b=k4i9gimoGfjXjggT59lY3bnqVOKjLzQSWdDac/qCVT92yYpnW/cShadmlvRnDwyLr2ObjJNEUTru5NEPyIfY5hHhvOm+qlN3yLyN3DdN4uWx3vO2Nxz0kS/10wpeHUjmfwqEpUgN2kosxWqoAT2cszsSwurl+Qk3GOWrcCSzUHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784498440; c=relaxed/simple;
	bh=a7PT8G+KFMF3keQqehEJcjY1SRLe634S/Qiro4sIyG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wv6eWrfsmdmWi7Xy/yFKffF4a26m9VYTyyKh9EoFkGOZgRvbDxZFjY8bfC60LsL0C6cay5DMQHQro9s8qhEtQ0R0VelUyH03B/bAUCpiFRjPgLDo1BECxbSDsEFRg63ETCJ1th2P/5jmNoIicfWWna90DOukNGlzH02ZgMD503s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoxgJVGX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoxgJVGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784498438; x=1816034438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a7PT8G+KFMF3keQqehEJcjY1SRLe634S/Qiro4sIyG0=;
  b=FoxgJVGXX4VquRPMUw1lirO/v0vCmyxUVSVvn2lKyRF32QRhw3s1cj4h
   xwJJgIog99JWCnBNiKK0n7rZxAIe3mWS6g0BUnKNmyN9Lb6mgPiWbjJ7w
   wSQNrPx2DsVlWQPMPNcsKtYKQcCWAKOnaogRNS012XSFlyPVuJIsIkEpF
   wf6wKLNk/z62Y1Kf1EsviXi2QbaM9m4S3pJ+hXWWgm6hCUCfigwF5flAj
   k9AXtxkv2AlEkHobY5leygxarF50JLGz3pRUxf7D1YvH3b+yOAHjFaL/E
   dZ/VhvgemLD/W0Id7VtjVrkYJYcnrjb9eh/bVQ86en0mhSOmqDUA3zADT
   A==;
X-CSE-ConnectionGUID: vJCpFzLKTKidRT2/edSK8w==
X-CSE-MsgGUID: 493fWWNzRiquBnxzpBEpbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95678397"
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="95678397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 15:00:34 -0700
X-CSE-ConnectionGUID: 4Z3UyxfJQw2u+Yu7aUYLKg==
X-CSE-MsgGUID: q3mi1VpwQmas3Nh+hZWx+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="257926607"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 15:00:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5D0F511F996;
	Mon, 20 Jul 2026 01:00:28 +0300 (EEST)
Date: Mon, 20 Jul 2026 01:00:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jakob Berg Jespersen <dev@berg.pm>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tooraj Taraz <tooraj.taraz@yahoo.com>,
	"Joseph V. Lavigne" <jlavig88@gmail.com>
Subject: Re: [PATCH] platform/x86: int3472: handle GPIO type 0x08 as a power
 regulator
Message-ID: <al1I_A0AiKXpHKfN@kekkonen.localdomain>
References: <20260719-sp7plus-int3472-v1-1-521a43f5c191@berg.pm>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-sp7plus-int3472-v1-1-521a43f5c191@berg.pm>

Hi Jakob,

Thanks for the patch.

On Sun, Jul 19, 2026 at 08:15:12PM +0200, Jakob Berg Jespersen wrote:
> On the Microsoft Surface Pro 7+, the rear camera's INT3472 device
> (INT3472:01, sensor INT347A / ov8865) enumerates a GPIO of type 0x08
> in its _DSM which the driver does not recognise, so it is left
> unmapped:
> 
>   int3472-discrete INT3472:01: GPIO type 0x08 unknown; the sensor may
>   not work
> 
> The DSDT shows this pin (0x0100AF08, pin 175, active-high) sitting
> alongside a normal type-0x0b power-enable GPIO: it gates a second
> sensor power rail. Because the type is unknown the rail is never
> enabled, the ov8865's "dvdd" supply resolves to a dummy regulator, and
> the sensor never probes.
> 
> Map type 0x08 for INT347A to a POWER_ENABLE regulator with con_id
> "dvdd", the supply the in-tree ov8865 driver already requests, so no
> sensor-driver change is needed. ("dvdd" rather than "avdd" because the
> type-0x0b power-enable pin on this INT3472 is already registered as
> "avdd".)
> 
> Type 0x08 is not in the driver's documented function list and is not
> otherwise handled by mainline; based on the sensor's supply set and the
> con_id that brings it up, it appears to be the DVDD (digital core
> voltage) rail, the counterpart to the existing DOVDD (0x10) type.
> 
> Related out-of-tree work approached the same rail by adding a new "pwr1"
> supply instead of the sensor's existing "dvdd" (linux-surface PR #1867
> for the Surface Pro 9, PR #2201 for the Pro 7+ ov8865); neither was sent
> upstream. Mapping to "dvdd" keeps the change contained to int3472.
> 
> With this change the SP7+ rear camera probes and streams reliably,
> validated by over a month of use.
> 
> Link: https://github.com/linux-surface/linux-surface/pull/1867
> Link: https://github.com/linux-surface/linux-surface/pull/2201
> Cc: Tooraj Taraz <tooraj.taraz@yahoo.com>
> Cc: Joseph V. Lavigne <jlavig88@gmail.com>
> Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>
> ---
> 0x08 is left as a bare literal rather than a named constant here; if
> its canonical meaning is known I'm happy to add e.g.
> INT3472_GPIO_TYPE_DVDD and/or handle it generically like DOVDD in v2.
> 
> This is my first kernel contribution, so please bear with me on any
> process mistakes.
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 115bb37577a1..98c7b9bc393f 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -164,6 +164,19 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
>  		.con_id = "dvdd",
>  		.enable_time_us = 45 * USEC_PER_MSEC,
>  	},
> +	{	/*
> +		 * Surface Pro 7+ ov8865 (rear camera): type 0x08 is an
> +		 * undocumented sensor power rail; left undriven the sensor
> +		 * stays in a failed power state. "dvdd" rather than "avdd"
> +		 * because this INT3472 also has a type 0x0b (power enable)
> +		 * pin already registered as "avdd".
> +		 */

GPIO type 8 is in fact "POWER1" (type 7 being "POWER0"). This hasn't been
seen anywhere yet so support for it hasn't been added either.

I understand the POWER_ENABLE GPIO is for executing the entire power
sequence and isn't expected to be found with the other regulators, hence an
apparent conflict here wouldn't be an issue.

I think for now we could map type POWER1 (8) to "dvdd", however not using a
quirk but doing it for all devices, like mapping POWER_ENABLE to "avdd".
That'd leave mapping POWER0 to "avdd" for later. The GPIO definition for
POWER0 could be added in any case.

I wonder what Hans or Dan think.

> +		.hid = "INT347A",
> +		.type_from = 0x08,
> +		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
> +		.con_id = "dvdd",
> +		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
> +	},
>  };
>  
>  static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
> 

-- 
Kind regards,

Sakari Ailus
