Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA80435AB9;
	Tue,  7 Jul 2026 16:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442451; cv=none; b=C1S5ESixqfxeEfSCLtvwXT+4cAj9byczugkrR8dw0LLB67Ccla2zhpGbRSyf5eta2uxqpMuUCVNS/W51Ymoos/xXHcYGWgKDeMFNO3IX7m4/elZ+vbxWfIYKljLPHfWm1BLzjHZ2csc1CRZZFGRS/lXXFaXvenTZG7l6bn5otP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442451; c=relaxed/simple;
	bh=4nVAe3EzvYgnNWjMg7CZJRHDaIWlXr3YCD+w/uJCc+4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HXj7gnkzK54GnNg6lsytZqvw/IvXjLRyk2sZPVgN5tDKUBa45QaqAsAermBbSCbSUoBhBJ9XJf4sRErPDdMzSciF1+qNn+5kTf9J9nQ8oy+JGs3zjRxEUWCA/DoA3h6KL+nyPe+f68vmzmrkshNZNsXR2lOEzyycqZrGE0ZC8lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6XlJ02A; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6XlJ02A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783442448; x=1814978448;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4nVAe3EzvYgnNWjMg7CZJRHDaIWlXr3YCD+w/uJCc+4=;
  b=K6XlJ02AIo1yJ2St6DAkNy+qWGFtvjRWiwQr7UnuXtTaYOSTTTw9Ib+3
   TMmt/rs8krXztJ1QUVNPSvECcSmzsT6c4vuOgEH15d/Xij/0G2MMgrbjM
   x+u19b149VNXjwu/9MTOFnbx6RTGKX577msky9tSVLfPPzziYslMP7BaN
   19xPcRGxIKqqDw5ilBJ2ffjVxEtsfgE/ozKnr9YiJgZjuQjaQzEgHzhIs
   AFuBLpTUrFzM4/koBUztGjZkSzR9P6YiqDlX+G5MTjLT3rW7n8W4JuUel
   GUIvr1olS6pW1HSQmgtgB69Oh0sz2hP2JezOP7RSoJG5Z/IhXcmN0SLhd
   w==;
X-CSE-ConnectionGUID: EMaFZEmER5K08s5X93nvmQ==
X-CSE-MsgGUID: TcyNXhMKTumABDvwqBukTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83205077"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83205077"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 09:40:47 -0700
X-CSE-ConnectionGUID: 9x9SDOHRSWSwS1s9z/EMng==
X-CSE-MsgGUID: MeHXS3kXS4CkigXybG0EXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277256082"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 09:40:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 19:40:39 +0300 (EEST)
To: Marco Scardovi <scardracs@disroot.org>
cc: krishna.chomal108@gmail.com, eliadevito@gmail.com, emreleno@gmail.com, 
    Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    moravec@ukf.sk, platform-driver-x86@vger.kernel.org, 
    "Rafael J. Wysocki" <rafael@kernel.org>, regressions@leemhuis.info, 
    regressions@lists.linux
Subject: Re: [PATCH v2 1/1] platform/x86: hp-wmi: fix platform profile issues
 on generic HP laptops
In-Reply-To: <20260623164603.10322-2-scardracs@disroot.org>
Message-ID: <358d9315-e974-3180-8919-3451c982fc44@linux.intel.com>
References: <ajqgkq_elUlMC0Ep@archlinux> <20260623164603.10322-1-scardracs@disroot.org> <20260623164603.10322-2-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Jun 2026, Marco Scardovi wrote:

> On generic (non-Omen/non-Victus) HP laptops supported by the
> hp-wmi driver, the platform_profile sysfs operations could fail,
> leading to 'platform_profile: Failed to get profile for handler hp-wmi'
> errors and preventing userspace power profile management from working
> correctly.
> 
> The driver was blindly registering all 4 profiles (quiet, cool,
> balanced, performance) without checking which ones were actually
> supported by the BIOS. Furthermore, when userspace switched profiles,
> hp_wmi_platform_profile_get() was called, which queried the BIOS
> using thermal_profile_get(). If the BIOS query returned an error or
> returned a value not in the recognized cases, the get call failed,
> throwing an error.
> 
> Fix this by dynamically probing which thermal profiles are supported
> by the BIOS during driver registration. This is done by temporarily
> setting each profile and checking the return code, then restoring the
> original profile. Restructure the probe function to explicitly populate
> choices for each laptop type, avoiding confusing fall-through behavior.
> 
> There are no expected negative side effects, as the active profile is
> restored to its original state during probe time, and only validated
> profiles are exposed.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220008
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221569
> Closes: https://lore.kernel.org/platform-driver-x86/a3b137df-1b21-4460-b003-58c5ca2d59d4@ukf.sk/
> Fixes: 4296f679ca50 ("platform/x86: hp-wmi: add platform profile support")
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 37 ++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 8ba286ed8721..82fdfaa169ec 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -2011,19 +2011,42 @@ static int hp_wmi_platform_profile_probe(void *drvdata, unsigned long *choices)
>  {
>  	if (is_omen_thermal_profile()) {
>  		set_bit(PLATFORM_PROFILE_COOL, choices);
> -	} else if (is_victus_thermal_profile()) {
> +		set_bit(PLATFORM_PROFILE_BALANCED, choices);
> +		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +		return 0;
> +	}
> +
> +	if (is_victus_thermal_profile()) {
>  		set_bit(PLATFORM_PROFILE_QUIET, choices);
> -	} else if (is_victus_s_thermal_profile()) {
> +		set_bit(PLATFORM_PROFILE_BALANCED, choices);
> +		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +		return 0;
> +	}
> +
> +	if (is_victus_s_thermal_profile()) {
>  		/* Adding an equivalent to HP Omen software ECO mode: */
>  		set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> -	} else {
> -		set_bit(PLATFORM_PROFILE_QUIET, choices);
> -		set_bit(PLATFORM_PROFILE_COOL, choices);
> +		set_bit(PLATFORM_PROFILE_BALANCED, choices);
> +		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +		return 0;
>  	}

You'll need to write a better justification into the changelog if you want 
to have these above included. It also looks largely unrelated to what 
you're doing according to changelog so it might actually belong to 
another patch but without proper explanation, I'm pretty much in dark 
why you're doing these in the first place.

> -	set_bit(PLATFORM_PROFILE_BALANCED, choices);
> -	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +	/* Generic HP laptops supported by hp-wmi: probe dynamically */
> +	int current_tp = thermal_profile_get();
> +	if (current_tp < 0)
> +		return current_tp;
> +
> +	if (thermal_profile_set(HP_THERMAL_PROFILE_QUIET) == 0)
> +		set_bit(PLATFORM_PROFILE_QUIET, choices);
> +	if (thermal_profile_set(HP_THERMAL_PROFILE_COOL) == 0)
> +		set_bit(PLATFORM_PROFILE_COOL, choices);
> +	if (thermal_profile_set(HP_THERMAL_PROFILE_DEFAULT) == 0)
> +		set_bit(PLATFORM_PROFILE_BALANCED, choices);
> +	if (thermal_profile_set(HP_THERMAL_PROFILE_PERFORMANCE) == 0)
> +		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>  
> +	/* Restore original thermal profile */
> +	thermal_profile_set(current_tp);
>  	return 0;
>  }
>  
> 

-- 
 i.

