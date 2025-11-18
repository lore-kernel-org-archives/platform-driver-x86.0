Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA0D1FA859;
	Tue, 18 Nov 2025 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475901; cv=none; b=E4O91dGCpokNmojIbVRIEJGY2z9AGDfF55+7KAfeDSVRmYtEEJzgdVHHlGEmNeHimFFE8cy98s2EF7UgxZi0f6xgFN6JA8Hxg4B/NVvtoIVRxjqN5YYtQJptW/06ncBVp+zqR/Og9o3oCEjdAicMio9m5Dn35wsHXEm9oj/f/3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475901; c=relaxed/simple;
	bh=nhbtbR3scTNMLVSIGND7YCGwHi25oS7vCqAEExbxdTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FesPCE1KTmZTxlaUUoAA9fQ0AVr+PhBlWZDVj6qKgf7ZnKVUS9puavXTDHwjYFdSSoCLCHF2GBV40BADaVS26vXMYzkYdvztZPNfYk4JGBskekDqzvWhUwxYg7r6TDUyNe0BRG5pv8B9w9rIGEdqH16IFF2Wem2is7QeDI2rWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=WmABnLwU; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="WmABnLwU"
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 970452FC0057;
	Tue, 18 Nov 2025 15:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763475895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yncKwMUU16WX0tnb0ala5Go9+yrhpM9eZPP7JRXN4To=;
	b=WmABnLwUuLQ10Kh7VwAg13mejWFUDkIk8LAyjl+tvDbYLWJQ4I2ZpnMugMYXVq+6jV4nDw
	l21toBfuA2EKW54svfjF51iPCTL68h8oD82kUxYzoaPumjLUF2KpiUQsWQFqQvT/thK8dx
	LUVejk90oE6CEEhUlzKZfM6eECp6UV4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <13ef3a6e-2489-4c42-9412-7a8680d13087@tuxedocomputers.com>
Date: Tue, 18 Nov 2025 15:24:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Start of Upstream Support for TUXEDO NB02 devices
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <1ce9d218-d5cd-4821-b224-b52e314b7027@gmx.de>
 <a2ad4642-cc69-419e-b599-d8f7a2e8097e@tuxedocomputers.com>
 <c6c423da-e640-40ff-a35c-8e2493e4d631@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <c6c423da-e640-40ff-a35c-8e2493e4d631@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 18.11.25 um 14:42 schrieb Armin Wolf:
> Am 18.11.25 um 14:17 schrieb Werner Sembach:
>
>>
>> Am 18.11.25 um 12:31 schrieb Armin Wolf:
>>> Am 17.11.25 um 14:23 schrieb Werner Sembach:
>>>
>>>> With the Uniwill driver from Armin now accepted I want to push the first
>>>> big addon to it that I worked on in parallel.
>>>>
>>>> First this adds all current Tuxedo devices to use at least the input part
>>>> of the new driver.
>>>>
>>>> Second it adds a new feature for cTGP control on Uniwill devices with
>>>> NVIDIA GPUs and enables that on the TUXEDO devices.
>>>>
>>>> I have not yet enabled the other features in this driver for TUXEDO devices
>>>> as they either don't apply (Uniwill did a line with Intel that behaves a
>>>> little different to the rest of their ECs and that line is what the features
>>>> Armin added are based on) or are, as of now, untested.
>>>>
>>>> There are plenty more features currently implemented in the out of tree
>>>> tuxedo-drivers dkms package that I plan to port over one by one, but as
>>>> always: No ETA given.
>>>
>>> Very nice, i think that especially the cTGP control feature will be very 
>>> popular with users.
>>> I am also currently working to add fan table (aka "universal fan control"), 
>>> PL1/PL2 power limit
>>> and platform profile support to the driver, so you might be able to reuse 
>>> some of that
>>> functionality for your devices.
>>>
>>> I think that we can merge the first two patches in the near future, but the 
>>> remaining ones
>>> dealing with the DMI table and cTGP support need some more work. What kind 
>>> of control does
>>> your software (Tuxedo control center) need over the cTGP values? I am asking 
>>> because Intel
>>> devices have fixed cTGP values for each platform profile. If your software 
>>> does something
>>> similar, then maybe we can integrate this into the platform profile mechanism.
>>
>> On some newer Uniwill devices all the platform profile register does is 
>> changing a led, the actual TDP, cTGP, Fan Curves, etc. are set in other 
>> registers. We currently expose this flexibility to userspace and need to keep 
>> it that way.
>>
> The power mode LED i assume? The same thing happens on Intel devices, Fan 
> curves and power limits are independent
> settings. Perhaps the "custom" platform profile would be suitable here? When 
> selecting the custom platform
> profile, your userspace application can modify the fan curves and power limits 
> as desired.

Ah ok,

There are however uniwill devices where the register does more.

But when there is a custom profile i think TCC could fit into that.

>
> Thanks,
> Armin Wolf
>
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>>>>
>>>> Werner Sembach (6):
>>>>    platform/x86/uniwill: Add TUXEDO devices
>>>>    platform/x86/uniwill: Handle more WMI events required for TUXEDO
>>>>      devices
>>>>    platform/x86/uniwill: Implement cTGP setting
>>>>    platform/x86/uniwill: Make uniwill_dmi_table accessible in probe
>>>>    platform/x86/uniwill: Run callbacks of uniwill_dmi_table
>>>>    platform/x86/uniwill: Set cTGP support based on EC for TUXEDO IBP Gen7
>>>>      MK1
>>>>
>>>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 546 ++++++++++++++++++--
>>>>   drivers/platform/x86/uniwill/uniwill-wmi.h  |   2 +
>>>>   2 files changed, 502 insertions(+), 46 deletions(-)
>>>>
>>
