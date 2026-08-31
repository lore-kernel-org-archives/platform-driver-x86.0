Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B3A3D953E;
	Mon, 31 Aug 2026 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169181; cv=none; b=caytQGj6Ah/gHyZqS3vhxLxuDhI5Ks8yfBIIGIeRR4WXmOgIMt9SOHyUiyt4lH/M5qYmMKSzYe5a0tX8SmYQO5b0pjGXyTYUt3jcKhuA2TdL4ayyK4eMImzbm+71ZRUKcOgNzWjMjmX2kDOk2JzmHtdDE9W3tinU+MXROwQVqpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169181; c=relaxed/simple;
	bh=mu5pUBF6dkEExRujHgIB0bUtMV9FBdh/D3MD8hRCAac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrKfXHP7+XqXpKlniqyMQjhQ1WCJ76AqMUscS9ANQIrAOG65mjziJ7yBhcKDSiIEGXMp2hb3wD3BRRmTdZsfkEGiyjnzSzjqh/yeGwsSHgIvESSVYG0EeM/gUka/261uw6zHT7z1WYeDRdM/moaQBFKbyz3wRTAGkf9WXGhxE8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wfqp9hVf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wfqp9hVf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB8F1F000E9;
	Mon, 31 Aug 2026 09:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788169179;
	bh=HXyt03jyX12/zSj3ShsACBmTndYNSu66CEyLHawzQas=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Wfqp9hVfNqJH5DgQ2EP79rePvNM8tg1cVewQOPl0I7fhg0w9Dl081GIMK0bxn1G2z
	 ng4wRXGFzSt19FkFIomRS5V6h7UOKmZViwheaAENnaAmNy1oxmBfzPvIwohIHuLeAm
	 SMr6IPFXIDPwX3RSHKRA3kae5kz+1yL9TRBzrHU9CVM1Z1UQyVCe/auqGTY9l98S8N
	 8GYQ/tyIrOz297+mbXg5FOejR6XyxeveECO5GmcYP/3+TRbgkC2qLAqy+goh1KaI0l
	 tTtvfkszewiJ0UTXzUnfCGGsgYZ8XmCePucajDs0pyBMUvHJ3gpF6l8moFQhGer4Fp
	 5hlCvDOgljGrg==
Message-ID: <2002cf03-d9b5-4713-9790-e905e7aa3a42@kernel.org>
Date: Mon, 31 Aug 2026 11:39:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: int3472: support the POWER1 GPIO type
To: Sergey Lebedev <lsa.uz@pm.me>, Jakob Berg Jespersen <dev@berg.pm>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260830134126.70277-1-lsa.uz@pm.me>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260830134126.70277-1-lsa.uz@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30-Aug-26 3:41 PM, Sergey Lebedev wrote:
> Hans pointed me at this from a report I sent this morning about the same
> GPIO type on a Surface Pro 11 - thank you, and sorry for the duplicate
> question. I have now tested this patch on that machine, which is a third
> model and, more usefully, a different sensor. Result below, with the part
> that is still missing for this sensor family.
> 
> Tested-by: Sergey Lebedev <lsa.uz@pm.me>   # Surface Pro 11, INT3472 side
> 
> What the patch fixes here
> -------------------------
> 
> Built on 7.0.0-30 (Ubuntu 26.04). The warning is gone and the rail is
> mapped:
> 
>   before: int3472-discrete INT3472:00: GPIO type 0x08 unknown;
>                                        the sensor may not work
>   after : no int3472 messages at all
> 
>   /sys/class/regulator:
>     regulator.1  INT3472:00-avdd
>     regulator.2  INT3472:00-dvdd     <- new, from this patch
>     regulator.3  INT3472:01-avdd
>     regulator.4  INT3472:01-dovdd
>     regulator.5  INT3472:02-avdd
> 
> Nothing else regressed: audio, Secure Boot and module signing unaffected,
> no failed units.
> 
> What it does not fix, and why that is not this patch's fault
> ------------------------------------------------------------
> 
> The camera is exactly as dead as before:
> 
>   ov13858 i2c-OVTID858:00: failed to find sensor: -5
>   every regulator: num_users=0, state=disabled
>   /dev/media0: 0 entities
> 
> The rear sensor here is an OV13858, and the in-tree ov13858 driver requests
> no regulators and touches no GPIOs at all - zero `regulator` and zero
> `gpiod` references in drivers/media/i2c/ov13858.c. So INT3472:00-dvdd is
> registered and then never claimed by anyone, and the sensor is still held
> in reset because nothing releases it.
> 
> That is exactly the difference between your machine and this one. ov8865
> asks for "dvdd", "dovdd" and "avdd" by name, so mapping POWER1 to "dvdd"
> completes the picture for the Surface Pro 7+. ov13858 asks for nothing.
> 
> The same conclusion was reached independently on the Surface Pro 10, which
> carries the same OV13858:
> 
>   https://github.com/linux-surface/linux-surface/issues/2153
> 
> There they had to add reset-GPIO handling to ov13858_probe() and force the
> regulators on, and describe the latter as too broad for upstream.
> 
> So: this patch is correct and necessary, and for the OV13858 machines it is
> not sufficient. The remaining work is in the sensor driver rather than in
> int3472, which seems worth stating explicitly so nobody expects the Pro 10
> or Pro 11 rear camera to start working when this lands.
> 
> If it would help, I am happy to test a patch teaching ov13858 to request
> its supplies and release reset - it is the same shape as what ov8865
> already does. The machine is here and I can build and boot kernels on it.

Right. Someone needs to write 2 patches for the ov13858 driver to add:

1. Regulator support, this should list the 3 standard:

static const char * const ov02c10_supply_names[] = {
        "dovdd",        /* Digital I/O power */
        "avdd",         /* Analog power */
        "dvdd",         /* Digital core power */
};

OV sensor supply names. This should use the bulk regulator API,
request these at probe and turn them on / off at stream start / stop time.

The ov2c10 driver in drivers/media/i2c/ov2c10 with its
ov02c10_get_pm_resources() ov02c10_power_off() and
ov02c10_power_on() functions is a good example of how
to handle this.

2. Add reset GPIO support, again the ov02c10 driver and
the 3 mentioned helper functions there are a good example
to copy for this.

Regards,

Hans


