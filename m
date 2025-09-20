Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1365B7261A
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758372353; cv=none; b=TJunGMTPdEB/PcSGqKat/n7Mg4UzStorzZaYqJW/z7xPoAKPqPF+hRpMygvheTzc1HuoBnIYNteJ3nfOoF3Uk2DbZJ3a4i7e+eoim7A9BKGd+LfxUioTpuKprsuzBX/EynV1uuADn9U99vSipQroTNjEp96uO/FwEe06JuFn38Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758372353; c=relaxed/simple;
	bh=hMT0mPyrIJIdcrk2FGtXisGXbseBJQUzjJRj7zK/BNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YAy+48680e22KcPKWnVDiN3fDPNDxVdfAO0rEjUos6ZyHmsexJuoWWL8rP0n5X+6AIroSqiCFMbE95Yq1gpdma57NErw1KqAUnu03K71XFatqCLobxfgrE5h91xlxYwas5cMoZSJTHfBsqXJVCTATlCPvZycQFDcBLM38baWV60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6acjHE4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6acjHE4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51988C4CEEB;
	Sat, 20 Sep 2025 12:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758372352;
	bh=hMT0mPyrIJIdcrk2FGtXisGXbseBJQUzjJRj7zK/BNc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l6acjHE4BvAVDDVEGX99QPVibpujn2aIWnImHmFsYxdoQLvPfx2RXznzpWpgjowly
	 S4wcR8KqbeDC+i+CAUbQx5xxpSxpLJl0E1v4jZQC4guTvZbLQ7OBxDmQzcH5rLQ/PV
	 jqwYvZQ3mYdHOFMHZxGiGJRHMS5K1vBVprud6BmpCSvfl2UOcBBIFwJ1Nqa24xYZVc
	 kMARZJSK6N2zHppQDgUlcnm9UXUq38Ub+JUDEm+AriXjcABmundz4hcFxQ7urrBcm0
	 eC74msUrRBz1SopdbtbcOkvpxErZi9+5hF2GAB1K9S9jDPmxR99exGDTCx8CQV0z+s
	 HqGr0rZPPPzIg==
Message-ID: <76983fbf-afff-42f4-8474-8b38792c1a0e@kernel.org>
Date: Sat, 20 Sep 2025 14:45:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/19] x86-android-tablets: convert to use GPIO
 references + Acer A1-840 support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann
 <arnd@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20250919204742.25581-1-hansg@kernel.org>
 <CAHp75Vdw2-kvtEs_m4FSb5i59P1Qs-VFv88_tMxua+dYoZhs1w@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAHp75Vdw2-kvtEs_m4FSb5i59P1Qs-VFv88_tMxua+dYoZhs1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 20-Sep-25 1:22 PM, Andy Shevchenko wrote:
> On Fri, Sep 19, 2025 at 11:47 PM Hans de Goede <hansg@kernel.org> wrote:
>>
>> Dmitry's v2 cover-letter:
>>
>> "This series came about because now software nodes can be used to
>> describe GPIOs (via PROPERTY_ENTRY_GPIO() macros) and I would like to
>> eventually get rid of gpio_keys_platform_data structure.
>>
>> So while I was doing the conversions from GPIO_LOOKUP() tables for
>> gpio_keys devices I decided to convert the rest of them as well. Maybe
>> some time in the future we can drop support for GPIO_LOOKUP() and rely
>> on device properties exclusively."
>>
>> Changes in v3:
>> - Add missing pinctrl_put() in lenovo_yoga_tab2_830_1050_init_codec()
>>   error-exit paths after the pinctrl_get_select() succeeds
>>
>> - Adding a swnode to the yt3 spi device changes the name of the SPI/codec
>>   device and the sound/soc/intel/boards/bytcr_wm5102.c machine driver looks
>>   up the code by name, update the machine driver to use the new name.
>>
>> - Make yoga-tab2-pro-1380-fastcharger.c propagate the fwnode set on
>>   the platform-device to the serdev it creates to fix this.
>>
>> - Fix the commit message of "platform/x86: x86-android-tablets: convert
>>   gpio_keys devices to GPIO references" which contained a stray reference
>>   to wm5102.
>>
>> New patches in v3:
>>
>> - Change sw_bat register mechanism into a generic swnode_group mechanism
>>
>> - Use swnode_group mechanism to register groups needed, instead of having
>>   init() callbacks manually do this
>>
>> - Changed my email address in the driver to hansg@kernel.org
>>
>> - Rebased "platform/x86: x86-android-tablets: Add support for Acer A1-840
>>   tablet" on top, switched that to also use software-nodes for GPIOs and
>>   added it to this series
>>
>> - Some Lenovo Yoga Tab 2 support fixes
> 
> I'm in favour of this series,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> with some nit-picks here and there.

Thank you. I'll post a v4 to address your remarks soon.

Regards,

Hans



