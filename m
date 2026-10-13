Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FBD4BD36A;
	Tue, 13 Oct 2026 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885888; cv=none; b=RH/h3kjqyYc84p5QhtL7r6pS1Vs/92zGBMNF+HUKudO0/WjGW6rRay6Q+25RkFI4YV4bt0XDvf788v04KBQAG9yw2gqsQ0Vy8OvWUoFD4ZgFslulVqy7cHM8cj9rQXeJrVdVOn67/2LO/7XykWt5rZztUv05zuGDXTrxcejpaGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885888; c=relaxed/simple;
	bh=jpWfUBEoAPjsisHP3pSirCTH8xunSESsfKiqThVJFNs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QP9fzhBXXqu1TLB+JjtAuXau40wlFYodPdx6mn0jp0a9coMPDKo1h4W1Z/M3G/Cg0ZARiPitVcevo6GK+9zC23GvS9iCe3xOsef2AvTj1EqaBtFsMcO0Rm0uCoLDnPvD5eZUJfTx/Ev8qeNSWEkyb+0MYLJQQKBkeOXHBF18yoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkTby3WS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkTby3WS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9721F00899;
	Tue, 13 Oct 2026 10:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885886;
	bh=k8n1G1txu9Js/gS+19Rhr8eqvftqL9g9+QRspdmDaCs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=CkTby3WSVwrqzHAi3/0ykR9dC9FmKaZNrQTAnWnWmjcLC52zCVDjcewmLo0uU43xC
	 FIPaWGapLVbxLmzYbPgPlB/f9SElgOxHw0SPN48HsHutuJ4jUzPRJ+tbjVpMTPIuEH
	 z9/HQ3kGA6BBGW/RrtvjSh5l+yrv5EIjor5psob1ZYU2GJHlcYXsFQJeLxg4AeLiiQ
	 iJYJFzEUxzHzHyQp5oFU8Ml+k1HJzlT0jAXXqwb2NGyfxZmBJh7zEhxfvLfAJhl2So
	 W3qC1xGu0FPxQBLdvDV1mFPg0rZ1tO6ufJ71PIrf1hkkpxnFVX7P8joAl3ovGFdvuy
	 /2pw2AMo298Dw==
Message-ID: <87ea0d84-0122-4302-973a-05a6880cf6d8@kernel.org>
Date: Tue, 13 Oct 2026 12:04:43 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: int3472: GPIO type names disagree with Intel's Windows driver
From: Hans de Goede <hansg@kernel.org>
To: diamondback <diamondback@cohunt.app>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Alexander Patrakov <patrakov@gmail.com>,
 Dan Scally <dan.scally@ideasonboard.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sahan Nissanka <adee.sahan@gmail.com>
References: <CAN_LGv0qkxARw4bxO8K-1hUkWNg2ts6q50dooCB5UM5en=bo0w@mail.gmail.com>
 <d9a37aff-3b4d-467c-825d-5473b4c1bbb4@ideasonboard.com>
 <CAN_LGv0nBTkVmxbuK+_O1v5Z_OZqQz5LgEZdL1_37otsei36fQ@mail.gmail.com>
 <aslsXPVJIuYRrgKv@kekkonen.localdomain>
 <lVgzYFlB_DT3TKJryx4Et9QF3-oqL7pSNP37e4tUENOuzf7sLRLshnvAkcz1jYpd6NCOqlqowIFv1Di9Ddo2Io1_K3HC5gjylmd-kuDLJv8=@cohunt.app>
 <1ab8b696-efe2-44d7-a440-bd54bd705232@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <1ab8b696-efe2-44d7-a440-bd54bd705232@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12-Oct-26 18:10, Hans de Goede wrote:
> Hi,
> 
> On 10-Oct-26 10:01, diamondback wrote:
>> On Saturday, October 10th, 2026 at 12:36 AM, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>>  
>>> The GPIO naming in Windows drivers is also an abstraction while Linux
>>> drivers typically use datasheet names of regulators, which are sensor
>>> specific. The handshake GPIO shouldn't exist with the regulators so it
>>> should be possible to map the rest independently of that. Changing the
>>> default mapping would also be possible, in principle, but that'd still
>>> require ensuring all sensor drivers still get the required regulators. I'm
>>> not sure it's worth it.
>>
>> Answering Alexander's question to me from the first mail:
>>
>> On 09/10/2026 04:06, Alexander Patrakov wrote:
>>> Leif, do you remember what it was based on, and which other GPIO
>>> types that machine's INT3472 reports?
>>
>> It was based on inference. My notes from February only say "likely
>> DOVDD": the ov5675 driver asks for avdd, dovdd and dvdd, 0x0b and 0x12
>> already had avdd and dvdd, so 0x10 got the remaining name. v1 already
>> called it DOVDD; Hans only asked me to drop the OVTI5675 quirk entry and
>> spell the con_id "dovdd" instead of "vio". In hindsight, my commit
>> message should not have stated it so concretely.
>>
>> What the Fold declares (from _DSM and the BIOS pin fields):
>>
>>   INT3472:00 (\_SB.PC00.DSC0), all sensor-on value 1:
>>     0x00  reset    pin 335
>>     0x0b  PowerEn  pin 140
>>     0x10  Avdd     pin 164
>>   INT3472:01 (\_SB.PC00.DSC1): no _CRS, zero pins.
>>
>> No 0x0f, 0x11 or 0x12. And a correction: that INT3472 is not the
>> OV5675's. The OV5675's _DEP names only the IVSC device, it uses dummy
>> regulators for all three supplies, and the supply map shows both
>> regulators going to the IR sensor:
>>
>>   INT3472:00-avdd -> i2c-SMO55F0:00.avdd
>>   INT3472:00-dovdd -> i2c-SMO55F0:00.dovdd
>>
>> So 0x10 on the Fold is a VD55G0 pin, not an OV5675 one.
> 
> Thank you for providing this information.
> 
>> Dan's suggestion makes sense to me
> I'm afraid that Dan's suggestion to:
> 
> "I think that what probably needs to happen, really, is for
> skl_int3472_register_regulator() to look up its array of consumer_supplies (which
> maps sensor device name to regulator name) based on DMI matching just as
> int3472_tps68470_get_board_data() does for the TPS68470 IC version of the INT3472"
> 
> Is not going to scale we are seeing many many different laptop models using
> the discrete INT3472 devices, so we really need a generic solution here and
> so far the current code has been scaling reasonable well.
> 
> The fact that currently we have a conflict between 0x0b poweren -> avdd
> and 0x10 Avdd -> dovdd is unfortunate. I would like to see 0x10 register
> the avdd regulator as per the Windows table, but that might cause
> breakage on some laptop models.
> 
> For now the only laptop + sensor which we've seen use 0xf and 0x11 (+ 0x10)
> _DSM type GPIOs is Alexander's Lenovo Yoga Duet 7 13ITL6 with the OVTI5675
> sensor. The other laptop, diamond back's ThinkPad X1 Fold 16 Gen 1, which
> we know to use an OVTI5675 is behind a ivsc and does not claim any GPIOs at
> all.
> 
> So for now I think it what should happen is:
> 
> 
> 1. An int3472 driver patch renaming INT3472_GPIO_TYPE_DOVDD to
> INT3472_GPIO_TYPE_AVDD, while keeping this mapped to dovdd with a remark
> that this is mapped to dovdd for historical reasons and cannot be easily
> changed because this might break support for some laptops
> 
> + 2 new defines for DOVDD / DVDD, resulting in (combined)
> 
> #define INT3472_GPIO_TYPE_DOVDD                                 0x0f
> #define INT3472_GPIO_TYPE_AVDD					0x10
> #define INT3472_GPIO_TYPE_DVDD					0x11
> 
> So this basically syncs our defines with what we've learned from
> the Windows drivers, without changing any functionality.
>    
> 
> 2. A patch to add mappings for the new INT3472_GPIO_TYPE_DOVDD(0x0f) and
> INT3472_GPIO_TYPE_DVDD(0x11) values to dovdd resp dvdd regulators.
> 
> This one just adds new mappings so should be safe to.
> 
> 
> 3. A patch adding an entry for the OVTI5675 to int3472_gpio_map[] to
> actually map the new INT3472_GPIO_TYPE_AVDD (0x10) the avdd (on the
> OVTI5675 only)
> 
> This might cause breakage if there is a laptop not on our radar
> with a OVTI5675 sensor using 0x0b (power-enable) + 0x10 (avdd) gpio
> types at the same time. But there is only one way to find that out
> really.
> 
> 
> 4. A patch to change the mapping of the new INT3472_GPIO_TYPE_AVDD (0x10)
> to actually be mapped to avdd and mapping INT3472_GPIO_TYPE_POWER_ENABLE
> to dvdd instead of avdd + dropping the int3472_gpio_map[] added in
> the 3th patch.
> > Yes this undoes patch 3, the idea being that we can easily revert patch 4
> if necessary.
> 
> Note patch 4 can cause 2 types of problems:
> 
> 1. A name-conflict in the registered regulators. This would be a real
> problem and a reason to go with a revert.

Thinking more about this I remembered that some HP laptops use
both power-enable + handshake, see e.g.:

https://bugzilla-attachments.redhat.com/attachment.cgi?id=2111237

Where 'INT3472:01' registers both an avdd + dvdd with the old code,
so mapping INT3472_GPIO_TYPE_POWER_ENABLE to dvdd is going to cause
a conflict here.

ATM we have (note new fixed INT3472_GPIO_TYPE_AVDD define):

0x0b INT3472_GPIO_TYPE_POWER_ENABLE -> avdd
0x10 INT3472_GPIO_TYPE_AVDD         -> dovdd
0x12 INT3472_GPIO_TYPE_HANDSHAKE    -> dvdd

So new proposal for patch 4, swap the 0x0b and 0x10 mappings
resulting in:

0x0b INT3472_GPIO_TYPE_POWER_ENABLE -> dovdd
0x10 INT3472_GPIO_TYPE_AVDD         -> avdd
0x12 INT3472_GPIO_TYPE_HANDSHAKE    -> dvdd

Note please also rename avdd_second_sensor to power_enable_second_sensor.

This avoids any regulator name conflicts for all the supported
existing combos, leaving only "2." below as potential problem
with the suggested patch 4:

> 2. Some sensor drivers for sensors using INT3472_GPIO_TYPE_POWER_ENABLE
> GPIOs may only check for avdd and not dvdd (*), in that case we could
> extend the regulator handling in the sensor driver instead of reverting
> patch 4.

And as mentioned we can fix those by extending the supply handling in
the sensor driver.

Ok, so I decided to really do my homework and just checked all
sensor drivers listed in ipu-bridge.c and present in 7.3 (some
or only available out of tree so far) and all of them either do
not support any of avdd, dvdd + dovdd, or they support all of them.

So I think that just swapping avdd and dovdd in the current setup
so as to correctly map 0x10 -> INT3472_GPIO_TYPE_AVDD -> "avdd"
is the right thing to do and that also means we can just squash
patches 3 and 4.

Since I think I've this all figured out now, let me just turn this into
a patch-set.

I'll Cc everyone on this email-thread on the patch-set.

Regards,

Hans



