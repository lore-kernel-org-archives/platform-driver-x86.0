Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E068CCA4E;
	Mon, 11 May 2026 18:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525329; cv=none; b=U549NO4E11VuQ6pu1Lf/T2mQQf1BwZSnHOGvfI7mKY8aol/E5LojLgdbtukiYzd/tmVUW22WmOcJ86WtTSvo0mgrjA0WCwUsZDn6UxJZwJvjBhiucfZu5AFc+/4asoRiKjPrqoBETfxGCdeXN5tU1Wor8p5MrqjpINo+xAJgedQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525329; c=relaxed/simple;
	bh=yONiy0uGW2rodP37eOLxEGEjPBXLiHIlaEdxypmZI7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MxywNRSy3zb91si24Ubv0cl1dS0I3HobDdNyAGk0HZNbNXp760AE247PlZcOUOUmw/rXOGfCk8FUj+sQQuIwCOs/fzKoqujhQSiy/jqh5VLq4UZvUfHWJKhPzHMn/PmowofeMfhI0Hi07vHV5OL850tsM6bo4SPRgcrM27EIo3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7Ze5LCO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7Ze5LCO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C01C2BCB0;
	Mon, 11 May 2026 18:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778525328;
	bh=yONiy0uGW2rodP37eOLxEGEjPBXLiHIlaEdxypmZI7k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W7Ze5LCOTTiQQo0mBU1lbHL/WjrXvK1yr3UmqLreqdohJyOPruyaUBdpI9oZ0k0ba
	 Re7Rf+gCCcDrXGm4CP7kTUApxYcjRrkBoZpVmB+M48JWmKCdzxoCZ8C8SaBBtHjqmr
	 nN8JAFt5LTgV1rOzIOz/l3BjOveGbx6PRPkFhIaDbAljP42kmzq4qZg2ivpBKVG4s1
	 O1PbwWs1ugYagj/nJDId07CUFei8u68jMMtZ5Q7sHVC5QsN9rAYt+925GT/SLetaoY
	 xGk7sdd00c/0jtmw1aHq7D0sAbiALcm2qhpnib91EOJ2W5yHZFCh8GDK22utxl5dee
	 23mqUdarHV1QQ==
Message-ID: <5389eb37-61db-4c9a-b8cc-7d605ac7a4f4@kernel.org>
Date: Mon, 11 May 2026 20:48:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/16] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Rong Zhang <i@rong.moe>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
 <20260411162334.25682-15-derekjohn.clark@gmail.com>
 <09d21c9cee8af49fa1d5b568358db0c347668ee9.camel@collabora.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <09d21c9cee8af49fa1d5b568358db0c347668ee9.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nicolas,

On 24-Apr-26 14:50, Nícolas F. R. A. Prado wrote:
> On Sat, 2026-04-11 at 16:23 +0000, Derek J. Clark wrote:
>> Add charge-type power supply extension for devices that support WMI
>> based
>> charge enable/disable.
>>
>> Lenovo Legion devices that implement WMI function and capdata ID
>> 0x03010001 in their BIOS are able to enable or disable charging at
>> 80%
>> through the lenovo-wmi-other interface. Add a charge_type power
>> supply
>> extension to expose this capability to the sysfs.
> 
> Hi,
> 
> this is not the right uAPI to expose this capability.
> 
> If you check the ABI description for
> /sys/class/power_supply/<supply_name>/charge_type [1], it mentions
> "rate" and if you check the corresponding enum definition [2] it
> mentions "speed", so the charge_type uAPI is very clearly meant to
> expose the the charge rate/speed/current currently configured, with
> Long Life specifically meaning a reduced charge rate, rather than
> reduced charge capacity.

As discussed here:

https://lore.kernel.org/linux-pm/49993a42-aa91-46bf-acef-4a089db4c2db@redhat.com/
https://lore.kernel.org/platform-driver-x86/20241209204051.8786-1-hdegoede@redhat.com/

and also here:

https://vdwaa.nl/charge-types-api-upower.html

The use of charge_type[s] for this is intentional and is exactly
the right uAPI to use in this case (especially see the first link).

> The uAPI you're looking for here is
> /sys/class/power_supply/<supply_name>/charge_control_end_threshold [3],
> which very explicitly exposes the charge threshold in percentage. You
> can then accept only 100 or 80 as valid values and configure your
> hardware accordingly. Unfortunately there's currently no way for
> userspace to know that these are the only valid values (which is
> something that I want to look into implementing soon), it can only read
> back to see if what it wrote was accepted, but it's still the best uAPI
> for this.

charge_control_end_threshold only makes sense when the firmware API
actually allows controlling the % of charge at which point the charger
will stop charging the battery.

In many cases there only is an option to prolong battery longevity
aka "long life" by not charging to 100% but the exact % of charge
at which to stop charging is not configurable. This is exactly
the case for which we've decided to use a charge_type of "long life"
and upower has also implemented support for this.

> I see that there have been 2 commits merged last year that make the
> exact same misuse of the uAPI, which probably contributed to the
> confusion here, but the ship has sailed for those. 

Those commits are working as designed and a 3th one is actually
in the making doing the same thing:

https://lore.kernel.org/linux-pm/49993a42-aa91-46bf-acef-4a089db4c2db@redhat.com/

Regards,

Hans


