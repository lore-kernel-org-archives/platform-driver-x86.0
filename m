Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CBD4E36E3;
	Fri,  9 Oct 2026 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549104; cv=none; b=NLbSl9ua56ZBcqTBq2AgExwIMrXObTSxk42nAcp7b3Ff37M+TiB2gQeTprcQv6Ioq66lKotYOjMEQlFpzSs81HQlwEqxV55d+NBGuaAstDvoAoXsaHoRs3fxJRmGAG+3spqLVU4qoHYr4n01RB0xwLxpkicyU/U0LpJEHjx2z1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549104; c=relaxed/simple;
	bh=ENHPwjJt2cGx9b4WZdj3zhIZBzV9Nv+Ho663yzalEto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fSZANi4X/VZLzd+W0nGDtmRsBYA4uPur7TLxA3XBwZbbhQRlDXLQN6MhaF5tMS+uIB66tvnsjJeHT3Bb1bxcIq7VuD7ge+huSdajveGkP4rmuZAd+X1+UHvIDYt+Klkjde6FcguHGf5/bDph5sTAfTx8EhZ0/RL9j+oZFzbAEds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PjGvBdkl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PjGvBdkl"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AAC7C2D;
	Fri,  9 Oct 2026 14:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791548977;
	bh=ENHPwjJt2cGx9b4WZdj3zhIZBzV9Nv+Ho663yzalEto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PjGvBdklHAL4HycDjQvVrS7csYKIfuQhzYSNgT3jrZkzc0agXKFxv6u457w5GZbKA
	 wnZV/VAY6mWsZ0C1s+kk4I0Ps0wzR23c9TWLEXayAShSi23tbZWmgE03gtLucRRWRO
	 /O+T4ICln/j++8BaXKYyE9mY2nonFoCkaXWVc/SI=
Message-ID: <f7a95f64-6818-4d1d-8023-98fdcce17278@ideasonboard.com>
Date: Fri, 9 Oct 2026 13:31:33 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: int3472: GPIO type names disagree with Intel's Windows driver
To: Alexander Patrakov <patrakov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Leif Skunberg <diamondback@cohunt.app>, Sahan Nissanka <adee.sahan@gmail.com>
References: <CAN_LGv0qkxARw4bxO8K-1hUkWNg2ts6q50dooCB5UM5en=bo0w@mail.gmail.com>
 <d9a37aff-3b4d-467c-825d-5473b4c1bbb4@ideasonboard.com>
 <CAN_LGv0nBTkVmxbuK+_O1v5Z_OZqQz5LgEZdL1_37otsei36fQ@mail.gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CAN_LGv0nBTkVmxbuK+_O1v5Z_OZqQz5LgEZdL1_37otsei36fQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alexander

On 09/10/2026 12:25, Alexander Patrakov wrote:
> On Fri, Oct 9, 2026 at 6:03 PM Dan Scally <dan.scally@ideasonboard.com> wrote:
>> On 09/10/2026 04:06, Alexander Patrakov wrote:
>>> Hi,
>>> Why I am not sending a patch
>>> ----------------------------
>>>
>>> Giving 0x0f, 0x10 and 0x11 their proper names, while 0x0b and 0x12 keep
>>> the ones they have, means two names end up on two types each:
>>>
>>>     avdd   0x0b (PowerEn) and 0x10 (Avdd)
>>>     dvdd   0x11 (Core) and 0x12 (Handshake)
>>>
>>> A system whose INT3472 declares both members of a pair for one sensor
>>> would ask for two regulators supplying the same name, and the second
>>> regulator_register() fails with -EBUSY. No type shares a default name
>>> with another in mainline today. I do not know whether such a system
>>> exists; Intel's 2021 build handles Core and Handshake as separate steps,
>>> so the firmware vocabulary at least allows it.
>>>
>>> The ov5675 driver asks for avdd, dovdd and dvdd, and all three are
>>> already the default names of 0x0b, 0x10 and 0x12. So I see no way to add
>>> 0x0f and 0x11 as general types without reusing a name, whatever is done
>>> about 0x10.
>>
>> Does the situation need amending? The handshake pin being modelled as a regulator named dvdd is a
>> deliberate situation; see Hans' commit message in c5d0393272048 ("platform/x86: int3472: Add
>> handshake pin support") for the explanation. I would think the same applies for PowerEnable (though
>> I suppose it could also be legitimately modeled as a GPIO, but sensor driver handling of those is
>> less consistent).
>>
>> Is there some sensor case you're aware of that's not working because of this problem?
> 
> 
> My sensor does not work without a patch that maps 0x0f and 0x11 to
> something that the ov5675 driver tries to enable.

Right, ok. This has always been done a little unsatisfactorily in retrospect. On a devicetree system 
the regulators would be declared against the sensor's node with names that the driver was known to 
expect, here we're fixing names (by passing REGULATOR_SUPPLY() entries in the regulator's init_data) 
in what is effectively the regulator's driver and hoping that they match up to the sensor driver's 
expectations.

I think that what probably needs to happen, really, is for skl_int3472_register_regulator() to look 
up its array of consumer_supplies (which maps sensor device name to regulator name) based on DMI 
matching just as int3472_tps68470_get_board_data() does for the TPS68470 IC version of the INT3472, 
and we can drop this idea of getting the con_id in int3472_get_con_id_and_polarity() entirely. 
Perhaps we could provide a fall-back to the current names in the event of no DMI matching...but 
really the goal ought to be to register the regulator with an array of consumer_supplies that mimic 
what the devicetree bindings declare as the supply names for the sensor. You could then add 0x0f and 
0x11 as new GPIO types that register a regulator without worrying about duplicated names.

Thanks
Dan

The INT3472 of the
> Lenovo Yoga Duet 7 13ITL6 declares types 0x0f, 0x10 and 0x11, plus a
> reset and a privacy LED, and neither 0x0b nor 0x12. But I am reluctant to
> send a patch that knowingly gives a GPIO type the wrong supply name, thus
> spreading the mistake.
> 
> I have read c5d0393272048, and I accept that "dvdd" for the handshake pin
> is a deliberate abstraction and not a claim about the pin. Type 0x10 is a
> different case: its commit says the pin controls the DOVDD rail, the
> constant is named INT3472_GPIO_TYPE_DOVDD, and Intel's table calls that
> type Avdd. That one is a statement of fact, and it looks wrong.
> 
> Here is the whole story: Claude, initially, found that the driver
> complains about the two unmapped GPIOs, matched that to the three
> regulator supplies that the ov5675 driver requests (avdd, dovdd, dvdd),
> and _arbitrarily_ assigned the two supply names that were still free to
> the two complained-about types ("GPIO type 0x%02x unknown; the sensor may
> not work\n"). At least it told me about the guess:
> 
> + * There is no 0x0b (avdd) and no 0x12 (dvdd), and the sensor needs three
> + * rails, so 0x0f and 0x11 are taken to be the remaining two. Which of them
> + * is avdd and which dvdd is a guess; ov5675.c enables all three together,
> + * so the labels do not change behaviour.
> 
> Then I asked Claude to try harder to figure out which is which, and at
> that point it found the table in the Windows driver. It then created a
> patch with the mapping that follows the table, but added a DMI lookup to
> int3472_get_con_id_and_polarity() that matches the tablet, so that it
> could override the conflicting generic mapping of 0x10. I started
> questioning everything, and finally got this:
> 
> ---
> Your clone is at v7.3-rc6. The commit is 2a7b7652b1bb, "platform/x86:
> int3472: Handle GPIO type 0x10 (DOVDD)", by Leif Skunberg, February 2026.
> 
> The commit message asserts the meaning and gives no basis for it. It says
> the Fold's _DSM returns type 0x10 for a pin "which controls the DOVDD
> (digital I/O power) regulator enable", and nothing about how that was
> determined. It does not list the machine's other pins.
> 
> Version 1 was a quirk for that one machine. It added an entry to the
> per-device GPIO map. Hans de Goede asked for it to be handled as a new
> generic type instead, and for the name "dovdd". So the generalisation to
> every machine came from review, based on a single device.
> ---
> ...which links to
> https://lkml.iu.edu/hypermail/linux/kernel/2602.1/02605.html
> 
> So, I tried to investigate the same Fold that served as the basis for the
> initial "dovdd" type assignment to 0x10, and Claude found that the Fold's
> own Windows driver package contradicts this assignment: its table names
> type 0x10 "Avdd", the same as the table in the driver for my tablet.
> 
> I asked Claude to fix int3472 so that I can submit a patch without adding
> further wrong statements about avdd/dvdd/dovdd, and it flagged the risk:
> 
> ---
> Renaming 0x10 to "avdd" breaks any machine whose firmware declares both
> type 0x0b and type 0x10 for the same sensor. The driver already names
> 0x0b "avdd", and registering two regulators for one supply name fails,
> taking the whole INT3472 probe with it.
> ---
> 
> That comes from reading the code; nobody has tested it on hardware. I am
> not aware of any such machine, but that's only because I am not aware of
> anything other than my Yoga tablet and the Fold.
> 
> Thanks,
> Alexander Patrakov

