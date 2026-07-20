Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F1B3A4F3D;
	Mon, 20 Jul 2026 21:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784582539; cv=none; b=X+VGp09b2VdqX/tfwLosOUgYliYCJi4IZ3V2dXUjBvaCRxGnaH6ZPuffi2z8YHNlQVr05htW0NT2j7p3KbAZg2LNJjnVI9Sr3ViArt6KXvsfe5gzkUnI04Nf/RiU2eUMm1w1xMLBnAkG8M2FFnYzs3LqOKOoj7cuOEdz3ul+Bus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784582539; c=relaxed/simple;
	bh=egY/foHv2Gw0O8fWeyU063w5lu5AO85MK/WTYF8mjX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QZecCAxeDUg5GI7d+bR6SzfB3i3ep8fBw9HlCwN56BS7IeVC8bQCEBFcpUO9NT8N4EgDy9OqaR3Q+lAWY38UvUb2SNhtGOXVeSkb63MLS7RJ3BupcjdisMtHbrBz4EpkenpCxvolPWBVLLCqRw6FSCjnt7jTQFWaIM9y2fIEiaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NA9ENx9z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NA9ENx9z"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF61FC1;
	Mon, 20 Jul 2026 23:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784582476;
	bh=egY/foHv2Gw0O8fWeyU063w5lu5AO85MK/WTYF8mjX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NA9ENx9z17hxeWsWVf/WkbS5FRjacnLs241bxymrp/mDngE7fua7AxZoFCF2aCXiL
	 YNKQrj/wL5dfbSWnOmE4MPnbcw7yoS9GKKW7EseniOgDaZkw3RUe8BSpr8PnuaTixR
	 yes8Wf0Phj4zxjr7gGJT/WVeM1Zeu7Tmczg2D0g4=
Message-ID: <9e71fe86-be85-4ec3-a25a-f45f6549cef8@ideasonboard.com>
Date: Mon, 20 Jul 2026 22:22:11 +0100
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
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tooraj Taraz <tooraj.taraz@yahoo.com>, "Joseph V. Lavigne"
 <jlavig88@gmail.com>
References: <20260719-sp7plus-int3472-v1-1-521a43f5c191@berg.pm>
 <al1I_A0AiKXpHKfN@kekkonen.localdomain>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <al1I_A0AiKXpHKfN@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all

On 19/07/2026 23:00, Sakari Ailus wrote:
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
>>    int3472-discrete INT3472:01: GPIO type 0x08 unknown; the sensor may
>>    not work
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
>>   drivers/platform/x86/intel/int3472/discrete.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index 115bb37577a1..98c7b9bc393f 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -164,6 +164,19 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
>>   		.con_id = "dvdd",
>>   		.enable_time_us = 45 * USEC_PER_MSEC,
>>   	},
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
> 
> I wonder what Hans or Dan think.

Yep, sounds like a good idea to me.

Thanks
Dan

> 
>> +		.hid = "INT347A",
>> +		.type_from = 0x08,
>> +		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
>> +		.con_id = "dvdd",
>> +		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
>> +	},
>>   };
>>   
>>   static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
>>
> 

