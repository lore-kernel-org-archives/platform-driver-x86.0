Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379003C1A
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 01:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791335836; cv=none; b=HDnqZF2i1FJ52ERSUdoCo3mWrquaK9McooMZi/N+JcYXCamNsiVcLy0eENx2GZeYXWi0PGi9WF1FXMrXgJcfixRRTmAdjSyGRGbzGQNLoXfyJMFS1IuR5Q/xw4EvsCn2op/Azh7hS0aUD1dXHdPPgT4i+MuWBwifITEe9pu5xLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791335836; c=relaxed/simple;
	bh=CgrBZrN4ks9vBaLYSY7cJYQAbQEa5acc7cEnBZI/KNs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PDm5Jod1l1buB/EjM9l6kzKKLjQ6CaDRPYMuXooulXtugswyK0i2fs9aSVLZRWnXjBi1Zqr7V6BBacHat7QfUkHG4LUTiWnBPk/nDbnFdQlv0dBvkUbddmiIHbb6FOA/SvuEzsSf0CEicVJRM0Z6UvAuT8YCWUvFYf3qxrgU0j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=QSN3fj3r; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="QSN3fj3r"
Received: from [IPV6:2a02:842a:8223:5500:b8d2:f510:e875:a76c] (unknown [IPv6:2a02:842a:8223:5500:b8d2:f510:e875:a76c])
	(Authenticated sender: julien.robin28@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 265B32003A4;
	Wed,  7 Oct 2026 03:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1791335824;
	bh=CgrBZrN4ks9vBaLYSY7cJYQAbQEa5acc7cEnBZI/KNs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=QSN3fj3ri5wN0fY9wfTeCP4m80dnhIHzQ/fGna0o7ou4MWxsbDe2q4WYzdz1b89IC
	 db/JkZm7erFOlEEfe7/ipElqik33RXtg1MIlLMuXIze6D7+Oie8ORNaLNr/kFpiHvY
	 INca/o29SX9zit0VbOGYZmGxHRah6sPCAYuaKchrPAePttjt6VniBOdw8+TC9szGr8
	 N6Durzi5BE6hI8YLmtejCVGEAB2SRGkFO6HGIBnCU7QtSZkXL8xBnKGuStrn1lM6kd
	 DIgcMOgD0HJEFmOKVXr+PkjxgdrhoorcC3fszXD9O82xi/iragCJ6rutvfeuDTrX++
	 7IrJqK2Jnn3TA==
Message-ID: <f3e855cd-259f-440f-be81-d491ae3df7e3@free.fr>
Date: Wed, 7 Oct 2026 03:17:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julien ROBIN <julien.robin28@free.fr>
Subject: Re: hp_wmi: Unknown EC layout for board 8C9C
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
 Suryansh Singh <technosfan14@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
References: <965dd816-dd66-4318-be8d-330a40209f67@free.fr>
 <asPy5Q5wNYaMzTqJ@archlinux> <4ce40bdd-87b4-4ba2-bf04-01f854680151@free.fr>
Content-Language: en-US
In-Reply-To: <4ce40bdd-87b4-4ba2-bf04-01f854680151@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> About victus_s_powersource_event() to manually trigger CPU power limits change, I remember the problem only existed when performance mode was active, it was only about CPU power limits (not GPU) and didn't exist with any of the others modes (balanced, low-power or fallback). Maximum/excessive power limits were kept despite going from AC to battery, and I believe they also weren't restored correctly when going back on AC. On Windows with Omen Gaming Hub this seemed to be addressed by rewriting power limits on power source change. As I updated BIOS to F.18 I'll check if anything evolved about this.
> 
> I'll do the tests tonight: Unloading hp-wmi driver and looking at RyzenAdj allows testing what happens when nothing is done by hp-wmi driver. But I need physical access to the device to unplug the cord, and also to put it to sleep mode, waking it up.
> I'll keep you informed of the results.

Hi back, to complete my feedback from few hours ago: having physical access to the laptop I did the complete tests again on BIOS F.18, same behavior as BIOS F.11

About going to suspend / waking up the computer from sleep:
 - When the computer is placed to suspend mode while performance mode is active, and hp-wmi unloaded, when resuming, it's still in performance mode without having to ask for it again (even if asleep for more than 120 seconds)
 - About the 120 seconds delay before going to fallback mode, this delay is only elapsing when the computer is running. When resuming, 120 seconds are available again (even if only few seconds were left when entering suspend mode)
 - However when the computer is placed to suspend mode while max fan speed is active, when resuming the fan isn't max speed anymore.

About power source changes:
 - When the laptop is running on performance mode, unloading the hp-wmi driver and disconnecting the power plug let the CPU stuck to maximum/excessive power limits (60/65W in my case instead of expected reduction to 25/30W when running on battery).
 - Same thing in the other way, when the laptop is running on battery, on performance mode and CPU power limits to 25/30W, unloading hp-wmi driver and connecting the power plug let the CPU stuck to low power limits (instead of rising to 60/65W).
 - However if the power source change occurs while the computer is suspended, then when waking up, the CPU power limits are set to the right ones by the laptop itself.
 - Also, in every others modes (balanced, low-power, or fallback after 120 seconds without hp-wmi interaction), on power source changes, CPU power limits are automatically adjusted by the laptop itself.

So the laptop forgetting to adjust CPU power limits on power source change, only occurs in performance mode while the computer isn't suspended.
In any other circumstance the laptop behave fine. Would be interesting to see if this strange quirk I found out by extensive testing also occurs to some others models.

As always, I keep available if anything more is needed!
Thanks again for the work

Best regards,
Julien
