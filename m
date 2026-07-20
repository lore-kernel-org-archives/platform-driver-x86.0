Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851483E5A10;
	Mon, 20 Jul 2026 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542450; cv=none; b=HbIVLHlchbXDBOQDX67nelVhccIN7xdHXT+k9DhEibkanM/Tcbo0O5mtfxeQ47w5H5gUDtqWdn05iO0sKCwcL3YfCTx0gPyrZMFUHp9LKUt63LzytE2pcF+j7jYS8TMCl4ZZJs3M4Kl1L6yB3ym3zdo61MxDls5tYRc+mdll0us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542450; c=relaxed/simple;
	bh=GJhJvAE5qcjbQIFmhYJvmP6ubRrAIY9gEwJEHl0/NQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJkiL+fuiKTDjQAxeSoUfHnA7/xFWvAS3kHoPaHpXEBL9Gws6TmsCZFYsRkqkMa4Cvz763Xzi8U0d3q8p691yhYARm7JEYGGTfaSq/v1cFu0ROg/xAig2+fSXjmKR0vpYs+9cWdx3pl3DR2utFYDBiOVnQFIzIZMLaDZMKgIcAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwbgGgs4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwbgGgs4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520CB1F000E9;
	Mon, 20 Jul 2026 10:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784542440;
	bh=L82yDrmLiJ1Bvvupwz1aUZXupSUPiCTIJ5flRvZzxt4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dwbgGgs4gW6vk04bGHs4DYQ73pMA8PDxXVoRnOy9/F5602GrRgr538/2+nNLqVPIa
	 apHxwnJYEbUf488ibfN2wSuattBX3INotx8OQ6LLXX3T5tzm7N3ra111DYsdV2Kh+y
	 tL0m0ftmiuvrNn55ANTpryF5X3vu6VJDAU4wAgtd7QVpWkKHOIpyNPEU0RcpLqiX8m
	 DTnSiPGrvp08DQcRbtOXQWHJTIlqbBCihlyHFeP+AKAwowjOwA35f8BME+4OM6KiMg
	 QV47iWyL+lRB22pyLENA/4mxBe6xxqaY9hDKvu5nISoIyJ0MCyBlU7HPfDbtqW2PpT
	 wl0FCW1GLuImQ==
Message-ID: <760d53df-7353-4f6f-b946-a3b76a09e503@kernel.org>
Date: Mon, 20 Jul 2026 12:13:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: int3472: handle GPIO type 0x08 as a power
 regulator
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jakob Berg Jespersen <dev@berg.pm>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tooraj Taraz <tooraj.taraz@yahoo.com>, "Joseph V. Lavigne"
 <jlavig88@gmail.com>
References: <20260719-sp7plus-int3472-v1-1-521a43f5c191@berg.pm>
 <al1I_A0AiKXpHKfN@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <al1I_A0AiKXpHKfN@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20-Jul-26 00:00, Sakari Ailus wrote:
> Hi Jakob,
> 
> Thanks for the patch.
> 
> On Sun, Jul 19, 2026 at 08:15:12PM +0200, Jakob Berg Jespersen wrote:
>> On the Microsoft Surface Pro 7+, the rear camera's INT3472 device
>> (INT3472:01, sensor INT347A / ov8865) enumerates a GPIO of type 0x08
>> in its _DSM which the driver does not recognise, so it is left
>> unmapped:
>>
>>   int3472-discrete INT3472:01: GPIO type 0x08 unknown; the sensor may
>>   not work
>>
>> The DSDT shows this pin (0x0100AF08, pin 175, active-high) sitting
>> alongside a normal type-0x0b power-enable GPIO: it gates a second
>> sensor power rail. Because the type is unknown the rail is never
>> enabled, the ov8865's "dvdd" supply resolves to a dummy regulator, and
>> the sensor never probes.
>>
>> Map type 0x08 for INT347A to a POWER_ENABLE regulator with con_id
>> "dvdd", the supply the in-tree ov8865 driver already requests, so no
>> sensor-driver change is needed. ("dvdd" rather than "avdd" because the
>> type-0x0b power-enable pin on this INT3472 is already registered as
>> "avdd".)
>>
>> Type 0x08 is not in the driver's documented function list and is not
>> otherwise handled by mainline; based on the sensor's supply set and the
>> con_id that brings it up, it appears to be the DVDD (digital core
>> voltage) rail, the counterpart to the existing DOVDD (0x10) type.
>>
>> Related out-of-tree work approached the same rail by adding a new "pwr1"
>> supply instead of the sensor's existing "dvdd" (linux-surface PR #1867
>> for the Surface Pro 9, PR #2201 for the Pro 7+ ov8865); neither was sent
>> upstream. Mapping to "dvdd" keeps the change contained to int3472.
>>
>> With this change the SP7+ rear camera probes and streams reliably,
>> validated by over a month of use.
>>
>> Link: https://github.com/linux-surface/linux-surface/pull/1867
>> Link: https://github.com/linux-surface/linux-surface/pull/2201
>> Cc: Tooraj Taraz <tooraj.taraz@yahoo.com>
>> Cc: Joseph V. Lavigne <jlavig88@gmail.com>
>> Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>
>> ---
>> 0x08 is left as a bare literal rather than a named constant here; if
>> its canonical meaning is known I'm happy to add e.g.
>> INT3472_GPIO_TYPE_DVDD and/or handle it generically like DOVDD in v2.
>>
>> This is my first kernel contribution, so please bear with me on any
>> process mistakes.
>> ---
>>  drivers/platform/x86/intel/int3472/discrete.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index 115bb37577a1..98c7b9bc393f 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -164,6 +164,19 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
>>  		.con_id = "dvdd",
>>  		.enable_time_us = 45 * USEC_PER_MSEC,
>>  	},
>> +	{	/*
>> +		 * Surface Pro 7+ ov8865 (rear camera): type 0x08 is an
>> +		 * undocumented sensor power rail; left undriven the sensor
>> +		 * stays in a failed power state. "dvdd" rather than "avdd"
>> +		 * because this INT3472 also has a type 0x0b (power enable)
>> +		 * pin already registered as "avdd".
>> +		 */
> 
> GPIO type 8 is in fact "POWER1" (type 7 being "POWER0"). This hasn't been
> seen anywhere yet so support for it hasn't been added either.
> 
> I understand the POWER_ENABLE GPIO is for executing the entire power
> sequence and isn't expected to be found with the other regulators, hence an
> apparent conflict here wouldn't be an issue.
> 
> I think for now we could map type POWER1 (8) to "dvdd", however not using a
> quirk but doing it for all devices, like mapping POWER_ENABLE to "avdd".
> That'd leave mapping POWER0 to "avdd" for later. The GPIO definition for
> POWER0 could be added in any case.

I was wondering what the internal Intel headers said for type 8, so thank
you for clarifying that that is called POWER1. Adding a generic mapping
of POWER1 to "dvdd" instead of using a quirk sounds good to me.

Regards,

Hans

